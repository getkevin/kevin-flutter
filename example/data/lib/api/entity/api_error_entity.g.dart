// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorEntity _$ApiErrorEntityFromJson(Map<String, dynamic> json) =>
    ApiErrorEntity(
      error: ApiErrorDataEntity.fromJson(json['error'] as Map<String, dynamic>),
    );

ApiErrorDataEntity _$ApiErrorDataEntityFromJson(Map<String, dynamic> json) =>
    ApiErrorDataEntity(
      code: json['code'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
