import 'package:mcp/mcp.dart';

/// Interface for MCP client.
abstract class McpClient {
  /// Server configuration.
  ServerConfig get serverConfig;

  /// Initialize the client.
  Future<void> initialize();

  /// Dispose the client.
  Future<void> dispose();

  /// Send a message.
  Future<JsonRpcMsg> sendMessage(JsonRpcMsg message);

  /// Send a notification.
  Future<JsonRpcMsg> sendInitialize();

  /// Send a ping.
  Future<JsonRpcMsg> sendPing();

  /// Send a tool list.
  Future<JsonRpcMsg> sendToolList();

  /// Send a tool call.
  Future<JsonRpcMsg> sendToolCall({
    /// Tool name.
    required String name,

    /// Arguments of the tool.
    required Map<String, dynamic> arguments,

    /// Optional tool id
    String? id,
  });
}
