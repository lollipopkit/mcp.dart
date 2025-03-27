// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_cfg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) =>
    _ServerConfig(
      command: json['command'] as String,
      args: (json['args'] as List<dynamic>).map((e) => e as String).toList(),
      env: (json['env'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      author: json['author'] as String? ?? '',
    );

Map<String, dynamic> _$ServerConfigToJson(_ServerConfig instance) =>
    <String, dynamic>{
      'command': instance.command,
      'args': instance.args,
      'env': instance.env,
      'author': instance.author,
    };
