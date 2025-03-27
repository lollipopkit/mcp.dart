// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_cfg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerConfig {
  String get command;
  List<String> get args;
  Map<String, String> get env;
  String get author;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerConfigCopyWith<ServerConfig> get copyWith =>
      _$ServerConfigCopyWithImpl<ServerConfig>(
          this as ServerConfig, _$identity);

  /// Serializes this ServerConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerConfig &&
            (identical(other.command, command) || other.command == command) &&
            const DeepCollectionEquality().equals(other.args, args) &&
            const DeepCollectionEquality().equals(other.env, env) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      command,
      const DeepCollectionEquality().hash(args),
      const DeepCollectionEquality().hash(env),
      author);

  @override
  String toString() {
    return 'ServerConfig(command: $command, args: $args, env: $env, author: $author)';
  }
}

/// @nodoc
abstract mixin class $ServerConfigCopyWith<$Res> {
  factory $ServerConfigCopyWith(
          ServerConfig value, $Res Function(ServerConfig) _then) =
      _$ServerConfigCopyWithImpl;
  @useResult
  $Res call(
      {String command,
      List<String> args,
      Map<String, String> env,
      String author});
}

/// @nodoc
class _$ServerConfigCopyWithImpl<$Res> implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._self, this._then);

  final ServerConfig _self;
  final $Res Function(ServerConfig) _then;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? args = null,
    Object? env = null,
    Object? author = null,
  }) {
    return _then(_self.copyWith(
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _self.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<String>,
      env: null == env
          ? _self.env
          : env // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ServerConfig implements ServerConfig {
  const _ServerConfig(
      {required this.command,
      required final List<String> args,
      final Map<String, String> env = const {},
      this.author = ''})
      : _args = args,
        _env = env;
  factory _ServerConfig.fromJson(Map<String, dynamic> json) =>
      _$ServerConfigFromJson(json);

  @override
  final String command;
  final List<String> _args;
  @override
  List<String> get args {
    if (_args is EqualUnmodifiableListView) return _args;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_args);
  }

  final Map<String, String> _env;
  @override
  @JsonKey()
  Map<String, String> get env {
    if (_env is EqualUnmodifiableMapView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_env);
  }

  @override
  @JsonKey()
  final String author;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerConfigCopyWith<_ServerConfig> get copyWith =>
      __$ServerConfigCopyWithImpl<_ServerConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServerConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerConfig &&
            (identical(other.command, command) || other.command == command) &&
            const DeepCollectionEquality().equals(other._args, _args) &&
            const DeepCollectionEquality().equals(other._env, _env) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      command,
      const DeepCollectionEquality().hash(_args),
      const DeepCollectionEquality().hash(_env),
      author);

  @override
  String toString() {
    return 'ServerConfig(command: $command, args: $args, env: $env, author: $author)';
  }
}

/// @nodoc
abstract mixin class _$ServerConfigCopyWith<$Res>
    implements $ServerConfigCopyWith<$Res> {
  factory _$ServerConfigCopyWith(
          _ServerConfig value, $Res Function(_ServerConfig) _then) =
      __$ServerConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String command,
      List<String> args,
      Map<String, String> env,
      String author});
}

/// @nodoc
class __$ServerConfigCopyWithImpl<$Res>
    implements _$ServerConfigCopyWith<$Res> {
  __$ServerConfigCopyWithImpl(this._self, this._then);

  final _ServerConfig _self;
  final $Res Function(_ServerConfig) _then;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? command = null,
    Object? args = null,
    Object? env = null,
    Object? author = null,
  }) {
    return _then(_ServerConfig(
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _self._args
          : args // ignore: cast_nullable_to_non_nullable
              as List<String>,
      env: null == env
          ? _self._env
          : env // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
