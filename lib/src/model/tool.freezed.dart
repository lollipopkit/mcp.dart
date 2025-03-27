// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolResponse {
  List<Tool> get tools;

  /// Create a copy of ToolResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolResponseCopyWith<ToolResponse> get copyWith =>
      _$ToolResponseCopyWithImpl<ToolResponse>(
          this as ToolResponse, _$identity);

  /// Serializes this ToolResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToolResponse &&
            const DeepCollectionEquality().equals(other.tools, tools));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tools));

  @override
  String toString() {
    return 'ToolResponse(tools: $tools)';
  }
}

/// @nodoc
abstract mixin class $ToolResponseCopyWith<$Res> {
  factory $ToolResponseCopyWith(
          ToolResponse value, $Res Function(ToolResponse) _then) =
      _$ToolResponseCopyWithImpl;
  @useResult
  $Res call({List<Tool> tools});
}

/// @nodoc
class _$ToolResponseCopyWithImpl<$Res> implements $ToolResponseCopyWith<$Res> {
  _$ToolResponseCopyWithImpl(this._self, this._then);

  final ToolResponse _self;
  final $Res Function(ToolResponse) _then;

  /// Create a copy of ToolResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tools = null,
  }) {
    return _then(_self.copyWith(
      tools: null == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Tool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ToolResponse implements ToolResponse {
  const _ToolResponse({required final List<Tool> tools}) : _tools = tools;
  factory _ToolResponse.fromJson(Map<String, dynamic> json) =>
      _$ToolResponseFromJson(json);

  final List<Tool> _tools;
  @override
  List<Tool> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  /// Create a copy of ToolResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToolResponseCopyWith<_ToolResponse> get copyWith =>
      __$ToolResponseCopyWithImpl<_ToolResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ToolResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolResponse &&
            const DeepCollectionEquality().equals(other._tools, _tools));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tools));

  @override
  String toString() {
    return 'ToolResponse(tools: $tools)';
  }
}

/// @nodoc
abstract mixin class _$ToolResponseCopyWith<$Res>
    implements $ToolResponseCopyWith<$Res> {
  factory _$ToolResponseCopyWith(
          _ToolResponse value, $Res Function(_ToolResponse) _then) =
      __$ToolResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<Tool> tools});
}

/// @nodoc
class __$ToolResponseCopyWithImpl<$Res>
    implements _$ToolResponseCopyWith<$Res> {
  __$ToolResponseCopyWithImpl(this._self, this._then);

  final _ToolResponse _self;
  final $Res Function(_ToolResponse) _then;

  /// Create a copy of ToolResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tools = null,
  }) {
    return _then(_ToolResponse(
      tools: null == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Tool>,
    ));
  }
}

/// @nodoc
mixin _$Tool {
  String get name;
  String get description;
  InputSchema get inputSchema;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolCopyWith<Tool> get copyWith =>
      _$ToolCopyWithImpl<Tool>(this as Tool, _$identity);

  /// Serializes this Tool to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tool &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.inputSchema, inputSchema) ||
                other.inputSchema == inputSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, inputSchema);

  @override
  String toString() {
    return 'Tool(name: $name, description: $description, inputSchema: $inputSchema)';
  }
}

/// @nodoc
abstract mixin class $ToolCopyWith<$Res> {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) _then) =
      _$ToolCopyWithImpl;
  @useResult
  $Res call({String name, String description, InputSchema inputSchema});

  $InputSchemaCopyWith<$Res> get inputSchema;
}

/// @nodoc
class _$ToolCopyWithImpl<$Res> implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._self, this._then);

  final Tool _self;
  final $Res Function(Tool) _then;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? inputSchema = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputSchema: null == inputSchema
          ? _self.inputSchema
          : inputSchema // ignore: cast_nullable_to_non_nullable
              as InputSchema,
    ));
  }

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputSchemaCopyWith<$Res> get inputSchema {
    return $InputSchemaCopyWith<$Res>(_self.inputSchema, (value) {
      return _then(_self.copyWith(inputSchema: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Tool implements Tool {
  const _Tool(
      {required this.name,
      required this.description,
      required this.inputSchema});
  factory _Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final InputSchema inputSchema;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToolCopyWith<_Tool> get copyWith =>
      __$ToolCopyWithImpl<_Tool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ToolToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tool &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.inputSchema, inputSchema) ||
                other.inputSchema == inputSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, inputSchema);

  @override
  String toString() {
    return 'Tool(name: $name, description: $description, inputSchema: $inputSchema)';
  }
}

/// @nodoc
abstract mixin class _$ToolCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory _$ToolCopyWith(_Tool value, $Res Function(_Tool) _then) =
      __$ToolCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String description, InputSchema inputSchema});

  @override
  $InputSchemaCopyWith<$Res> get inputSchema;
}

/// @nodoc
class __$ToolCopyWithImpl<$Res> implements _$ToolCopyWith<$Res> {
  __$ToolCopyWithImpl(this._self, this._then);

  final _Tool _self;
  final $Res Function(_Tool) _then;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? inputSchema = null,
  }) {
    return _then(_Tool(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      inputSchema: null == inputSchema
          ? _self.inputSchema
          : inputSchema // ignore: cast_nullable_to_non_nullable
              as InputSchema,
    ));
  }

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputSchemaCopyWith<$Res> get inputSchema {
    return $InputSchemaCopyWith<$Res>(_self.inputSchema, (value) {
      return _then(_self.copyWith(inputSchema: value));
    });
  }
}

/// @nodoc
mixin _$InputSchema {
  String get type;
  Map<String, Property>? get properties;
  List<String>? get required;

  /// Create a copy of InputSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputSchemaCopyWith<InputSchema> get copyWith =>
      _$InputSchemaCopyWithImpl<InputSchema>(this as InputSchema, _$identity);

  /// Serializes this InputSchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputSchema &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(properties),
      const DeepCollectionEquality().hash(required));

  @override
  String toString() {
    return 'InputSchema(type: $type, properties: $properties, required: $required)';
  }
}

/// @nodoc
abstract mixin class $InputSchemaCopyWith<$Res> {
  factory $InputSchemaCopyWith(
          InputSchema value, $Res Function(InputSchema) _then) =
      _$InputSchemaCopyWithImpl;
  @useResult
  $Res call(
      {String type, Map<String, Property>? properties, List<String>? required});
}

/// @nodoc
class _$InputSchemaCopyWithImpl<$Res> implements $InputSchemaCopyWith<$Res> {
  _$InputSchemaCopyWithImpl(this._self, this._then);

  final InputSchema _self;
  final $Res Function(InputSchema) _then;

  /// Create a copy of InputSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? properties = freezed,
    Object? required = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, Property>?,
      required: freezed == required
          ? _self.required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InputSchema implements InputSchema {
  const _InputSchema(
      {required this.type,
      final Map<String, Property>? properties,
      final List<String>? required})
      : _properties = properties,
        _required = required;
  factory _InputSchema.fromJson(Map<String, dynamic> json) =>
      _$InputSchemaFromJson(json);

  @override
  final String type;
  final Map<String, Property>? _properties;
  @override
  Map<String, Property>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _required;
  @override
  List<String>? get required {
    final value = _required;
    if (value == null) return null;
    if (_required is EqualUnmodifiableListView) return _required;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of InputSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputSchemaCopyWith<_InputSchema> get copyWith =>
      __$InputSchemaCopyWithImpl<_InputSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputSchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputSchema &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._required, _required));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_required));

  @override
  String toString() {
    return 'InputSchema(type: $type, properties: $properties, required: $required)';
  }
}

/// @nodoc
abstract mixin class _$InputSchemaCopyWith<$Res>
    implements $InputSchemaCopyWith<$Res> {
  factory _$InputSchemaCopyWith(
          _InputSchema value, $Res Function(_InputSchema) _then) =
      __$InputSchemaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type, Map<String, Property>? properties, List<String>? required});
}

/// @nodoc
class __$InputSchemaCopyWithImpl<$Res> implements _$InputSchemaCopyWith<$Res> {
  __$InputSchemaCopyWithImpl(this._self, this._then);

  final _InputSchema _self;
  final $Res Function(_InputSchema) _then;

  /// Create a copy of InputSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? properties = freezed,
    Object? required = freezed,
  }) {
    return _then(_InputSchema(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _self._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, Property>?,
      required: freezed == required
          ? _self._required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$Property {
  String get type;
  String? get description;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<Property> get copyWith =>
      _$PropertyCopyWithImpl<Property>(this as Property, _$identity);

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Property &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, description);

  @override
  String toString() {
    return 'Property(type: $type, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) _then) =
      _$PropertyCopyWithImpl;
  @useResult
  $Res call({String type, String? description});
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res> implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._self, this._then);

  final Property _self;
  final $Res Function(Property) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Property implements Property {
  const _Property({required this.type, this.description});
  factory _Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  @override
  final String type;
  @override
  final String? description;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PropertyCopyWith<_Property> get copyWith =>
      __$PropertyCopyWithImpl<_Property>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PropertyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Property &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, description);

  @override
  String toString() {
    return 'Property(type: $type, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PropertyCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$PropertyCopyWith(_Property value, $Res Function(_Property) _then) =
      __$PropertyCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String? description});
}

/// @nodoc
class __$PropertyCopyWithImpl<$Res> implements _$PropertyCopyWith<$Res> {
  __$PropertyCopyWithImpl(this._self, this._then);

  final _Property _self;
  final $Res Function(_Property) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? description = freezed,
  }) {
    return _then(_Property(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
