// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_rpc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsonRpcMsg {
  String? get id;
  String get jsonrpc;
  String get method; // @JsonKey(
//     fromJson: JsonRpcMsgParams.fromJson, toJson: JsonRpcMsgParams.toJson)
  @JsonKey(includeIfNull: false)
  Object? get params; // support both Map and List
  @JsonKey(includeIfNull: false)
  Object? get result;
  @JsonKey(includeIfNull: false)
  Object? get error;

  /// Create a copy of JsonRpcMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsonRpcMsgCopyWith<JsonRpcMsg> get copyWith =>
      _$JsonRpcMsgCopyWithImpl<JsonRpcMsg>(this as JsonRpcMsg, _$identity);

  /// Serializes this JsonRpcMsg to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsonRpcMsg &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      jsonrpc,
      method,
      const DeepCollectionEquality().hash(params),
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'JsonRpcMsg(id: $id, jsonrpc: $jsonrpc, method: $method, params: $params, result: $result, error: $error)';
  }
}

/// @nodoc
abstract mixin class $JsonRpcMsgCopyWith<$Res> {
  factory $JsonRpcMsgCopyWith(
          JsonRpcMsg value, $Res Function(JsonRpcMsg) _then) =
      _$JsonRpcMsgCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String jsonrpc,
      String method,
      @JsonKey(includeIfNull: false) Object? params,
      @JsonKey(includeIfNull: false) Object? result,
      @JsonKey(includeIfNull: false) Object? error});
}

/// @nodoc
class _$JsonRpcMsgCopyWithImpl<$Res> implements $JsonRpcMsgCopyWith<$Res> {
  _$JsonRpcMsgCopyWithImpl(this._self, this._then);

  final JsonRpcMsg _self;
  final $Res Function(JsonRpcMsg) _then;

  /// Create a copy of JsonRpcMsg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jsonrpc = null,
    Object? method = null,
    Object? params = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      jsonrpc: null == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params ? _self.params : params,
      result: freezed == result ? _self.result : result,
      error: freezed == error ? _self.error : error,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _JsonRpcMsg implements JsonRpcMsg {
  const _JsonRpcMsg(
      {this.id,
      this.jsonrpc = '2.0',
      required this.method,
      @JsonKey(includeIfNull: false) this.params,
      @JsonKey(includeIfNull: false) this.result,
      @JsonKey(includeIfNull: false) this.error});
  factory _JsonRpcMsg.fromJson(Map<String, dynamic> json) =>
      _$JsonRpcMsgFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String jsonrpc;
  @override
  final String method;
// @JsonKey(
//     fromJson: JsonRpcMsgParams.fromJson, toJson: JsonRpcMsgParams.toJson)
  @override
  @JsonKey(includeIfNull: false)
  final Object? params;
// support both Map and List
  @override
  @JsonKey(includeIfNull: false)
  final Object? result;
  @override
  @JsonKey(includeIfNull: false)
  final Object? error;

  /// Create a copy of JsonRpcMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JsonRpcMsgCopyWith<_JsonRpcMsg> get copyWith =>
      __$JsonRpcMsgCopyWithImpl<_JsonRpcMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JsonRpcMsgToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JsonRpcMsg &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      jsonrpc,
      method,
      const DeepCollectionEquality().hash(params),
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'JsonRpcMsg(id: $id, jsonrpc: $jsonrpc, method: $method, params: $params, result: $result, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$JsonRpcMsgCopyWith<$Res>
    implements $JsonRpcMsgCopyWith<$Res> {
  factory _$JsonRpcMsgCopyWith(
          _JsonRpcMsg value, $Res Function(_JsonRpcMsg) _then) =
      __$JsonRpcMsgCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String jsonrpc,
      String method,
      @JsonKey(includeIfNull: false) Object? params,
      @JsonKey(includeIfNull: false) Object? result,
      @JsonKey(includeIfNull: false) Object? error});
}

/// @nodoc
class __$JsonRpcMsgCopyWithImpl<$Res> implements _$JsonRpcMsgCopyWith<$Res> {
  __$JsonRpcMsgCopyWithImpl(this._self, this._then);

  final _JsonRpcMsg _self;
  final $Res Function(_JsonRpcMsg) _then;

  /// Create a copy of JsonRpcMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? jsonrpc = null,
    Object? method = null,
    Object? params = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_JsonRpcMsg(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      jsonrpc: null == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params ? _self.params : params,
      result: freezed == result ? _self.result : result,
      error: freezed == error ? _self.error : error,
    ));
  }
}

// dart format on
