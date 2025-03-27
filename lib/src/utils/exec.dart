import 'dart:io';
import 'package:logging/logging.dart';

final _pathSeparator = Platform.isWindows ? ';' : ':';
final _systemPath = Platform.environment['PATH'] ?? '';

String getDefaultPath([String? additionalPath]) {
  final paths = switch (Platform.operatingSystem) {
    'windows' => {
        'C:\\Windows\\System32',
        'C:\\Windows',
        'C:\\Windows\\System32\\Wbem',
        'C:\\Windows\\System32\\WindowsPowerShell\\v1.0',
      },
    'macos' => {
        '/opt/homebrew/bin',
        '/usr/local/bin',
        '/usr/bin',
        '/bin',
        '/usr/sbin',
        '/sbin',
      },
    _ => {
        '/usr/local/bin',
        '/usr/bin',
        '/bin',
        '/usr/sbin',
        '/sbin',
      },
  };

  // Merge default paths, system PATH and additional paths
  paths.addAll(_systemPath.split(_pathSeparator));

  // If additional paths are provided, add them to the list
  if (additionalPath != null && additionalPath.isNotEmpty) {
    paths.addAll(additionalPath.split(_pathSeparator));
  }

  // Remove empty paths and deduplicate
  return paths.where((p) => p.isNotEmpty).join(_pathSeparator);
}

Future<bool> isCommandAvailable(String command) async {
  try {
    final whichCommand = Platform.isWindows ? 'where' : 'which';
    final env = Map.of(Platform.environment);
    env['PATH'] = getDefaultPath();

    final result = await Process.run(
      whichCommand,
      [command],
      environment: env,
      includeParentEnvironment: true,
    );

    return result.exitCode == 0;
  } catch (e) {
    return false;
  }
}

Map<String, String>? _cachedEnv;

Future<Map<String, String>> _loadShellEnv() async {
  if (!Platform.isMacOS && !Platform.isLinux) {
    return {};
  }

  try {
    // Get the user's default shell
    final String shell = Platform.environment['SHELL'] ?? '/bin/bash';
    final String homeDir = Platform.environment['HOME'] ?? '';
    final String user = Platform.environment['USER'] ?? '';

    // Create a temporary script to load environment variables
    final tempDir = await Directory.systemTemp.createTemp('env_loader');
    final scriptFile = File('${tempDir.path}/load_env.sh');

    // Write the environment loading script
    await scriptFile.writeAsString('''
#!$shell
# Set basic environment
export HOME="$homeDir"
export USER="$user"
export SHELL="$shell"
export TERM="xterm-256color"
export LANG="en_US.UTF-8"

# Load system-wide configuration
if [ -f /etc/profile ]; then
  . /etc/profile
fi

# Load configuration based on the shell
if [[ "$shell" == *"/bash" ]]; then
  if [ -f "\$HOME/.bash_profile" ]; then
    . "\$HOME/.bash_profile"
  elif [ -f "\$HOME/.bash_login" ]; then
    . "\$HOME/.bash_login"
  elif [ -f "\$HOME/.profile" ]; then
    . "\$HOME/.profile"
  fi
elif [[ "$shell" == *"/zsh" ]]; then
  if [ -f "\$HOME/.zprofile" ]; then
    . "\$HOME/.zprofile"
  fi
  if [ -f "\$HOME/.zshrc" ]; then
    . "\$HOME/.zshrc"
  fi
elif [[ "$shell" == *"/fish" ]]; then
  if [ -f "\$HOME/.config/fish/config.fish" ]; then
    . "\$HOME/.config/fish/config.fish"
  fi
fi

# Output all environment variables
env
''');

    // Set script permissions
    await Process.run('chmod', ['+x', scriptFile.path]);

    // Execute the script to get environment variables
    final result = await Process.run(
      shell,
      [
        '-l', // Execute in login mode to ensure all configuration files are loaded
        scriptFile.path,
      ],
      environment: {
        'HOME': homeDir,
        'USER': user,
        'SHELL': shell,
        'TERM': 'xterm-256color',
        'PATH':
            '/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin',
      },
    );

    // Clean up temporary files
    await tempDir.delete(recursive: true);

    if (result.exitCode != 0) {
      Logger.root.warning('Failed to load shell environment: ${result.stderr}');
      return {};
    }

    // Parse environment variables
    final env = <String, String>{};
    final lines = result.stdout.toString().split('\n');
    for (final line in lines) {
      final parts = line.split('=');
      if (parts.length >= 2) {
        final key = parts[0];
        final value = parts.sublist(1).join('=');
        env[key] = value;
      }
    }

    Logger.root.info('Loaded shell environment: $env');

    return env;
  } catch (e) {
    Logger.root.severe('Error loading shell environment: $e');
    return {};
  }
}

Future<Map<String, String>> getDefaultEnv() async {
  // If environment variables have already been loaded, return the cache
  if (_cachedEnv != null) {
    return Map.of(_cachedEnv!);
  }
  final env = Map.of(Platform.environment);
  if (Platform.isWindows) {
    // pass
  } else if (Platform.isMacOS || Platform.isLinux) {
    final shellEnv = await _loadShellEnv();
    if (shellEnv.containsKey('PATH')) {
      final String newPath = shellEnv['PATH']!;
      Logger.root.info('Loaded PATH from shell: $newPath');
      env['PATH'] = newPath;
    } else {
      final defaultPath = getDefaultPath();
      Logger.root.info('Using default PATH: $defaultPath');
      env['PATH'] = defaultPath;
    }

    // Merge other environment variables
    shellEnv.forEach((key, value) {
      if (key != 'PATH' && !env.containsKey(key)) {
        env[key] = value;
      }
    });
  }
  Logger.root.info('Default environment: $env');

  // Cache environment variables
  _cachedEnv = Map.of(env);

  return env;
}

/// Starts a process with the specified command and arguments.
///
/// Uses the default environment variables plus any additional variables provided.
/// Note: User-provided environment variables will override default ones in case of conflict.
///
/// - [command] The command to execute
/// - [args] List of command arguments
/// - [environment] Additional environment variables to be added
/// @return A Process instance
Future<Process> startProcess(
  String command,
  List<String> args,
  Map<String, String> environment,
) async {
  final Map<String, String> env = await getDefaultEnv();
  env.addAll(environment); // Add user provided environment variables

  return Process.start(
    command,
    args,
    environment: env,
    includeParentEnvironment: true,
    // Windows need it to run properly, no idea why. Keep other platforms as default value (false).
    runInShell: Platform.isWindows,
  );
}

/// Clears environment variable cache, forcing reload on next request.
///
/// Call this when you need to ensure fresh environment variables,
/// for example after installing new software or modifying PATH.
void clearEnvironmentCache() {
  _cachedEnv = null;
  Logger.root.info('Environment cache cleared, will reload next time');
}
