// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_rpc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonRpcMsg _$JsonRpcMsgFromJson(Map<String, dynamic> json) => _JsonRpcMsg(
      id: json['id'] as String?,
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
      method: json['method'] as String,
      params: json['params'],
      result: json['result'],
      error: json['error'],
    );

Map<String, dynamic> _$JsonRpcMsgToJson(_JsonRpcMsg instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jsonrpc': instance.jsonrpc,
      'method': instance.method,
      if (instance.params case final value?) 'params': value,
      if (instance.result case final value?) 'result': value,
      if (instance.error case final value?) 'error': value,
    };
