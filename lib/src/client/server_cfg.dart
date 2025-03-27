import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_cfg.freezed.dart';
part 'server_cfg.g.dart';

@freezed
abstract class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    required String command,
    required List<String> args,
    @Default({}) Map<String, String> env,
    @Default('') String author,
  }) = _ServerConfig;

  factory ServerConfig.fromJson(Map<String, dynamic> json) =>
      _$ServerConfigFromJson(json);
}
