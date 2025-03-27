import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mcp/mcp.dart';
import 'package:mcp/src/model/process.dart';
import 'package:mcp/src/utils/debug.dart';
import 'package:synchronized/synchronized.dart';

/// Client implementation that communicates with the server using Server-Sent Events (SSE).
///
/// This client establishes a persistent connection to the server using SSE for receiving
/// messages and uses HTTP POST requests for sending messages.
/// It handles automatic reconnection with exponential backoff in case of connection failure.
class SSEClient implements McpClient {
  /// Configuration for connecting to the server
  final ServerConfig _serverConfig;

  /// Map of pending requests awaiting responses from the server
  final _pendingRequests = <String, Completer<JsonRpcMsg>>{};

  /// Controller for broadcasting process state updates
  final _processStateController = StreamController<ProcessState>.broadcast();

  /// Stream of process state updates that clients can subscribe to
  Stream<ProcessState> get processStateStream => _processStateController.stream;

  /// Subscription to the SSE stream
  StreamSubscription? _sseSubscription;

  /// Lock to prevent concurrent write operations
  final _writeLock = Lock();

  /// Endpoint for sending messages to the server
  String? _messageEndpoint;

  /// Flag indicating if a connection attempt is in progress
  bool _isConnecting = false;

  /// Flag indicating if the client has been disposed
  bool _disposed = false;

  /// Current number of reconnection attempts
  int _reconnectAttempts = 0;

  /// Maximum number of reconnection attempts before giving up
  static const int _maxReconnectAttempts = 5;

  /// Initial delay for reconnection, doubles with each attempt (exponential backoff)
  static const Duration _initialReconnectDelay = Duration(seconds: 1);

  /// Timer for scheduling reconnection attempts
  Timer? _reconnectTimer;

  /// Creates a new SSE client with the specified server configuration
  SSEClient({required ServerConfig serverConfig})
      : _serverConfig = serverConfig;

  @override
  ServerConfig get serverConfig => _serverConfig;

  /// Handles incoming JSON-RPC messages from the server
  ///
  /// If the message contains an ID that matches a pending request,
  /// completes the corresponding completer.
  void _handleMessage(JsonRpcMsg message) {
    if (message.id != null && _pendingRequests.containsKey(message.id)) {
      final completer = _pendingRequests.remove(message.id);
      completer?.complete(message);
    }
  }

  /// Initializes the client connection to the server
  ///
  /// Resets reconnection attempts and establishes an initial connection.
  @override
  Future<void> initialize() async {
    _reconnectAttempts = 0;
    await _connect();
  }

  /// Establishes an SSE connection to the server
  ///
  /// Sets up event listeners for handling server messages, errors, and connection closure.
  /// Updates process state accordingly and schedules reconnection if needed.
  Future<void> _connect() async {
    if (_isConnecting || _disposed) return;

    _isConnecting = true;
    try {
      _processStateController
          .add(ProcessStarting(serverConfig.command, serverConfig.args));

      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(serverConfig.command));
      // Set appropriate headers for SSE connection
      request.headers.set('Accept', 'text/event-stream');
      request.headers.set('Cache-Control', 'no-cache');
      request.headers.set('Connection', 'keep-alive');

      final response = await request.close();

      if (response.statusCode != 200) {
        throw Exception('SSE connection failed: ${response.statusCode}');
      }

      _reconnectAttempts = 0;

      // Listen for SSE events from the server
      _sseSubscription = response
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen(
        (line) {
          dprint('SSEClient: $line');
          if (line.startsWith('event: endpoint')) {
            return;
          }
          if (line.startsWith('data: ')) {
            final data = line.substring(6);
            if (_messageEndpoint == null) {
              // First message contains the endpoint URL for sending messages
              final baseUrl = Uri.parse(
                serverConfig.command,
              ).replace(path: '').toString();
              _messageEndpoint =
                  data.startsWith('http') ? data : baseUrl + data;
              Logger.root.info('Received message endpoint: $_messageEndpoint');
              _processStateController.add(const ProcessRunning());
            } else {
              // Subsequent messages are JSON-RPC messages
              try {
                final jsonData = jsonDecode(data);
                final message = JsonRpcMsg.fromJson(jsonData);
                _handleMessage(message);
              } catch (e, stack) {
                Logger.root
                    .severe('Failed to parse server message: $e\n$stack');
              }
            }
          }
        },
        onError: (error) {
          _processStateController.add(
            ProcessError(error, StackTrace.current),
          );
          _scheduleReconnect();
        },
        onDone: () {
          _processStateController.add(const ProcessExited());
          _scheduleReconnect();
        },
      );
    } catch (e, stack) {
      _processStateController.add(ProcessError(e, stack));
      _scheduleReconnect();
    } finally {
      _isConnecting = false;
    }
  }

  /// Schedules a reconnection attempt with exponential backoff
  ///
  /// Increases the delay between attempts with each failed connection.
  /// Stops trying after reaching the maximum number of attempts.
  void _scheduleReconnect() {
    if (_disposed || _isConnecting || _reconnectTimer != null) return;

    _reconnectAttempts++;
    if (_reconnectAttempts > _maxReconnectAttempts) {
      Logger.root.severe(
          'Reached maximum reconnection attempts ($_maxReconnectAttempts), stopping reconnection');
      return;
    }

    final delay = _initialReconnectDelay * (1 << (_reconnectAttempts - 1));
    Logger.root.info(
        'Scheduling reconnection attempt $_reconnectAttempts in ${delay.inSeconds} seconds');

    _reconnectTimer = Timer(delay, () {
      _reconnectTimer = null;
      _connect();
    });
  }

  /// Disposes of resources used by the client
  ///
  /// Cancels any pending reconnection attempts, the SSE subscription,
  /// and closes the process state controller.
  @override
  Future<void> dispose() async {
    _disposed = true;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    await _sseSubscription?.cancel();
    await _processStateController.close();
  }

  /// Sends an HTTP POST request to the server with the provided data
  ///
  /// Uses a lock to ensure only one request is sent at a time.
  /// Throws an exception if the message endpoint is not yet initialized.
  Future<void> _sendHttpPost(Map<String, dynamic> data) async {
    if (_messageEndpoint == null) {
      throw StateError('Message endpoint not initialized ${jsonEncode(data)}');
    }

    await _writeLock.synchronized(() async {
      try {
        await Dio().post(
          _messageEndpoint!,
          data: jsonEncode(data),
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
      } catch (e) {
        Logger.root.severe('Failed to send HTTP POST: $e');
        rethrow;
      }
    });
  }

  /// Sends a JSON-RPC message to the server and waits for a response
  ///
  /// Stores a completer for the message ID and completes it when a response
  /// with the same ID is received. Times out after 30 seconds.
  @override
  Future<JsonRpcMsg> sendMessage(JsonRpcMsg message) async {
    if (message.id == null) {
      throw ArgumentError('Message must have an ID');
    }

    final completer = Completer<JsonRpcMsg>();
    _pendingRequests[message.id!] = completer;

    try {
      await _sendHttpPost(message.toJson());
      return await completer.future.timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          _pendingRequests.remove(message.id);
          throw TimeoutException('Request timed out: ${message.id}');
        },
      );
    } catch (e) {
      _pendingRequests.remove(message.id);
      rethrow;
    }
  }

  /// Sends an initialization request to the server
  ///
  /// Establishes the protocol version and client capabilities.
  /// Also sends a notification that initialization is complete.
  @override
  Future<JsonRpcMsg> sendInitialize() async {
    const initMessage = JsonRpcMsg(
      id: 'init-1',
      method: 'initialize',
      params: {
        'protocolVersion': '2024-11-05',
        'capabilities': {
          'roots': {'listChanged': true},
          'sampling': {},
        },
        'clientInfo': {'name': 'mcp.dart', 'version': '1.0.0'},
      },
    );

    Logger.root
        .info('Initialize request: ${jsonEncode(initMessage.toString())}');

    final initResponse = await sendMessage(initMessage);
    Logger.root.info('Initialize request response: $initResponse');

    const notifyMessage = JsonRpcMsg(method: 'initialized', params: {});

    await _sendHttpPost(notifyMessage.toJson());
    return initResponse;
  }

  /// Sends a ping request to the server to check connectivity
  @override
  Future<JsonRpcMsg> sendPing() async {
    const message = JsonRpcMsg(id: 'ping-1', method: 'ping');
    return sendMessage(message);
  }

  /// Requests a list of available tools from the server
  @override
  Future<JsonRpcMsg> sendToolList() async {
    const message = JsonRpcMsg(id: 'tool-list-1', method: 'tools/list');
    return sendMessage(message);
  }

  /// Calls a specific tool on the server with the provided arguments
  ///
  /// Generates a unique ID for the request if none is provided.
  @override
  Future<JsonRpcMsg> sendToolCall({
    required String name,
    required Map<String, dynamic> arguments,
    String? id,
  }) async {
    final message = JsonRpcMsg(
      method: 'tools/call',
      params: {
        'name': name,
        'arguments': arguments,
        '_meta': {'progressToken': 0},
      },
      id: id ?? 'tool-call-${DateTime.now().millisecondsSinceEpoch}',
    );

    return sendMessage(message);
  }
}
