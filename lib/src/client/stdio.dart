import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:logging/logging.dart';
import 'package:mcp/mcp.dart';
import 'package:mcp/src/model/process.dart';
import 'package:mcp/src/utils/exec.dart';
import 'package:synchronized/synchronized.dart';

class StdioClient implements McpClient {
  @override
  final ServerConfig serverConfig;
  late final Process process;
  final _writeLock = Lock();
  final _pendingRequests = <String, Completer<JsonRpcMsg>>{};
  final List<Function(String)> stdErrCallback;
  final List<Function(String)> stdOutCallback;

  // Add StreamController
  final _processStateController = StreamController<ProcessState>.broadcast();

  // Provide public Stream
  Stream<ProcessState> get processStateStream => _processStateController.stream;

  StdioClient({
    required this.serverConfig,
    this.stdErrCallback = const [],
    this.stdOutCallback = const [],
  });

  void _handleMessage(JsonRpcMsg message) {
    if (message.id != null && _pendingRequests.containsKey(message.id)) {
      final completer = _pendingRequests.remove(message.id);
      completer?.complete(message);
    }
  }

  Future<void> _setupProcess() async {
    try {
      _processStateController
          .add(ProcessStarting(serverConfig.command, serverConfig.args));

      process = await startProcess(
        serverConfig.command,
        serverConfig.args,
        serverConfig.env,
      );

      Logger.root.info('Process started: PID=${process.pid}');

      final stdoutStream = process.stdout
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      stdoutStream.listen(
        (String line) {
          try {
            for (final callback in stdOutCallback) {
              callback(line);
            }
            final data = jsonDecode(line);
            final message = JsonRpcMsg.fromJson(data);
            _handleMessage(message);
          } catch (e, stack) {
            Logger.root.severe('Failed to parse server output: $e\n$stack');
          }
        },
        onError: (error) {
          Logger.root.severe('stdout error: $error');
          for (final callback in stdErrCallback) {
            callback(error.toString());
          }
        },
        onDone: () {
          Logger.root.info('stdout stream closed');
        },
      );

      process.stderr.transform(utf8.decoder).listen(
        (String text) {
          Logger.root.warning('Server error output: $text');
          for (final callback in stdErrCallback) {
            callback(text);
          }
        },
        onError: (error) {
          Logger.root.severe('stderr error: $error');
          for (final callback in stdErrCallback) {
            callback(error.toString());
          }
        },
      );

      // Listen for process exit
      process.exitCode.then((code) {
        _processStateController.add(ProcessExited(code));
      });

      _processStateController.add(ProcessRunning(process.pid));
    } catch (e, stack) {
      _processStateController.add(ProcessError(e, stack));
      rethrow;
    }
  }

  Future<void> write(List<int> data) async {
    try {
      await _writeLock.synchronized(() async {
        final String jsonStr = utf8.decode(data);
        process.stdin.writeln(utf8.decode(data));
        await process.stdin.flush();
        Logger.root.info('Writing data: $jsonStr');
      });
    } catch (e) {
      Logger.root.severe('Failed to write data: $e');
      rethrow;
    }
  }

  // Add initialization method
  @override
  Future<void> initialize() async {
    await _setupProcess();
  }

  // Modify dispose method
  @override
  Future<void> dispose() async {
    await _processStateController.close();
    process.kill();
  }

  @override
  Future<JsonRpcMsg> sendMessage(JsonRpcMsg message) async {
    if (message.id == null) {
      throw ArgumentError('Message must have an id');
    }

    final completer = Completer<JsonRpcMsg>();
    _pendingRequests[message.id!] = completer;

    try {
      await write(utf8.encode(jsonEncode(message.toJson())));
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

  @override
  Future<JsonRpcMsg> sendInitialize() async {
    // Step 1: Send initialization request
    const initMessage = JsonRpcMsg(id: 'init-1', method: 'initialize', params: {
      'protocolVersion': '2024-11-05',
      'capabilities': {
        'roots': {'listChanged': true},
        'sampling': {}
      },
      'clientInfo': {'name': 'DartMCPClient', 'version': '1.0.0'}
    });

    final initResponse = await sendMessage(initMessage);
    Logger.root.info('Initialize request response: $initResponse');

    // Step 2: Send initialization completed notification (no response needed)
    const notifyMessage = JsonRpcMsg(
        method: 'notifications/initialized', // Remove notifications/ prefix
        params: {} // Add empty params object
        );

    await write(utf8.encode(jsonEncode(notifyMessage.toJson())));
    return initResponse;
  }

  @override
  Future<JsonRpcMsg> sendPing() async {
    const message = JsonRpcMsg(id: 'ping-1', method: 'ping');
    return sendMessage(message);
  }

  @override
  Future<JsonRpcMsg> sendToolList() async {
    const message = JsonRpcMsg(id: 'tool-list-1', method: 'tools/list');
    return sendMessage(message);
  }

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
