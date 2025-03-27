# MCP.dart

A Dart client implementation for the Machine Code Protocol (MCP).

## Features

- **Multiple Connection Methods**:
  - **SSE Client**: Uses Server-Sent Events for persistent connections
  - **Stdio Client**: Communicates with locally spawned processes via standard I/O

- **Robust Error Handling**:
  - Automatic reconnection with exponential backoff
  - Process state tracking
  - Detailed error reporting

- **Protocol Support**:
  - JSON-RPC message handling
  - Tool discovery and invocation
  - Full MCP protocol implementation

- **Cross-Platform**:
  - Works on macOS, Linux, and Windows
  - Handles platform-specific environment setup


## Usage

### Connecting to an MCP Server

```dart
import 'package:mcp/mcp.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  // Set up logging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Configure server connection
  final serverConfig = ServerConfig(
    command: 'http://localhost:8080/sse', // For SSE connection
    args: [],
    env: {'KEY': 'value'}, // Optional environment variables
  );

  // Create and initialize the client
  final client = SSEClient(serverConfig: serverConfig);
  await client.initialize();

  // Subscribe to process state changes
  client.processStateStream.listen(print);

  try {
    // Initialize the protocol
    final initResponse = await client.sendInitialize();
    print('Server initialized: ${initResponse.result}');

    // Get available tools
    final toolsResponse = await client.sendToolList();
    print('Available tools: ${toolsResponse.result}');

    // Call a tool
    final callResponse = await client.sendToolCall(
      name: 'example.tool',
      arguments: {'param1': 'value1'},
    );
    print('Tool result: ${callResponse.result}');
  } catch (e) {
    print('Error: $e');
  } finally {
    await client.dispose();
  }
}
```

### Using a Local Process (Stdio Client)

```dart
import 'package:mcp/mcp.dart';

Future<void> main() async {
  final serverConfig = ServerConfig(
    command: '/path/to/mcp/server',
    args: ['--option', 'value'],
    env: {'DEBUG': 'true'},
  );

  final client = StdioClient(
    serverConfig: serverConfig,
    stdOutCallback: [(line) => print('stdout: $line')],
    stdErrCallback: [(line) => print('stderr: $line')],
  );
  
  await client.initialize();
  
  try {
    // Same API as the SSE client
    final tools = await client.sendToolList();
    print(tools.result);
  } finally {
    await client.dispose();
  }
}
```

## API Overview

### Client Interfaces

- `McpClient`: Base interface implemented by all clients
- `SSEClient`: Client for HTTP/SSE connections
- `StdioClient`: Client for local process connections via standard I/O

### Key Methods

- `initialize()`: Set up the connection
- `sendInitialize()`: Initialize the MCP protocol
- `sendToolList()`: Get available tools
- `sendToolCall()`: Call a specific tool
- `sendPing()`: Check server responsiveness
- `dispose()`: Clean up resources

### Process State Monitoring

Subscribe to the `processStateStream` to monitor the state of the connection:

```dart
client.processStateStream.listen(print);
```

## License

MIT License lollipopkit
