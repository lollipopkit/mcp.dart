import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_rpc.freezed.dart';
part 'json_rpc.g.dart';

@freezed
abstract class JsonRpcMsg with _$JsonRpcMsg {
  const factory JsonRpcMsg({
    String? id,
    @Default('2.0') String jsonrpc,
    required String method,
    // @JsonKey(
    //     fromJson: JsonRpcMsgParams.fromJson, toJson: JsonRpcMsgParams.toJson)
    @JsonKey(includeIfNull: false) Object? params, // support both Map and List
    @JsonKey(includeIfNull: false) Object? result,
    @JsonKey(includeIfNull: false) Object? error,
  }) = _JsonRpcMsg;

  factory JsonRpcMsg.fromJson(Map<String, dynamic> json) =>
      _$JsonRpcMsgFromJson(json);
}

// @Freezed(toJson: false, fromJson: false)
// abstract class JsonRpcMsgParams with _$JsonRpcMsgParams {
//   const factory JsonRpcMsgParams({
//     Map<String, dynamic>? map,
//     List<dynamic>? list,
//   }) = _JsonRpcMsgParams;

//   static JsonRpcMsgParams? fromJson(Object? json) {
//     return switch (json) {
//       final Map<String, dynamic> map => JsonRpcMsgParams(map: map),
//       final List<dynamic> list => JsonRpcMsgParams(list: list),
//       _ => null,
//     };
//   }

//   static Object? toJson(JsonRpcMsgParams? params) {
//     if (params?.map != null) {
//       return params?.map;
//     } else if (params?.list != null) {
//       return params?.list;
//     } else {
//       return null;
//     }
//   }
// }
