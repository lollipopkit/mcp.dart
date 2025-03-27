import 'package:mcp/mcp.dart';

Future<void> main() async {
  const serverConfig = ServerConfig(
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

  client.processStateStream.listen(print);
}
