/// Process state interface
sealed class ProcessState {
  /// Construct a process state
  const ProcessState();

  /// The description of the process state
  String get description;

  @override
  String toString() => '$runtimeType<$description>';
}

/// Process state when the process is starting
final class ProcessStarting extends ProcessState {
  final String cmd;
  final List<String> args;

  const ProcessStarting(this.cmd, this.args);

  @override
  String get description => 'Starting: $cmd ${args.join(' ')}';
}

/// Process state when the process is running
/// This state is used when the process is running and no errors have occurred
final class ProcessRunning extends ProcessState {
  /// The process ID
  final int? pid;

  const ProcessRunning([this.pid]);

  @override
  String get description {
    if (pid != null) {
      return 'Running: PID=$pid';
    } else {
      return 'Running';
    }
  }
}

/// Process state when an error occurs
final class ProcessError extends ProcessState {
  /// The error that occurred
  final Object error;

  /// The stack trace of the error
  final StackTrace stackTrace;

  const ProcessError(this.error, this.stackTrace);

  @override
  String get description => 'Failed: $error\n$stackTrace';
}

/// Process state when the process has exited
final class ProcessExited extends ProcessState {
  /// The exit code of the process
  final int? code;

  const ProcessExited([this.code]);

  @override
  String get description {
    if (code != null) {
      return 'Exited with code $code';
    } else {
      return 'Exited';
    }
  }
}
