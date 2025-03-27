import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool.freezed.dart';
part 'tool.g.dart';

@freezed
abstract class ToolResponse with _$ToolResponse {
  const factory ToolResponse({
    required List<Tool> tools,
  }) = _ToolResponse;

  factory ToolResponse.fromJson(Map<String, dynamic> json) => 
      _$ToolResponseFromJson(json);
}

@freezed
abstract class Tool with _$Tool {
  const factory Tool({
    required String name,
    required String description,
    required InputSchema inputSchema,
  }) = _Tool;

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
}

@freezed
abstract class InputSchema with _$InputSchema {
  const factory InputSchema({
    required String type,
    Map<String, Property>? properties,
    List<String>? required,
  }) = _InputSchema;

  factory InputSchema.fromJson(Map<String, dynamic> json) => 
      _$InputSchemaFromJson(json);
}

@freezed
abstract class Property with _$Property {
  const factory Property({
    required String type,
    String? description,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) => 
      _$PropertyFromJson(json);
}
