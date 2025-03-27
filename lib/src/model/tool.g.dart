// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolResponse _$ToolResponseFromJson(Map<String, dynamic> json) =>
    _ToolResponse(
      tools: (json['tools'] as List<dynamic>)
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolResponseToJson(_ToolResponse instance) =>
    <String, dynamic>{
      'tools': instance.tools,
    };

_Tool _$ToolFromJson(Map<String, dynamic> json) => _Tool(
      name: json['name'] as String,
      description: json['description'] as String,
      inputSchema:
          InputSchema.fromJson(json['inputSchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolToJson(_Tool instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'inputSchema': instance.inputSchema,
    };

_InputSchema _$InputSchemaFromJson(Map<String, dynamic> json) => _InputSchema(
      type: json['type'] as String,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Property.fromJson(e as Map<String, dynamic>)),
      ),
      required: (json['required'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InputSchemaToJson(_InputSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'required': instance.required,
    };

_Property _$PropertyFromJson(Map<String, dynamic> json) => _Property(
      type: json['type'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PropertyToJson(_Property instance) => <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };
