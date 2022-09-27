import 'package:json_annotation/json_annotation.dart';

part 'api_error_entity.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorEntity {
  final ApiErrorDataEntity error;

  const ApiErrorEntity({
    required this.error,
  });

  factory ApiErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorEntityFromJson(json);
}

@JsonSerializable(createToJson: false)
class ApiErrorDataEntity {
  final int code;
  final String name;
  final String description;

  const ApiErrorDataEntity({
    required this.code,
    required this.name,
    required this.description,
  });

  factory ApiErrorDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDataEntityFromJson(json);
}
