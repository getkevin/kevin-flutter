// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenEntity _$AuthTokenEntityFromJson(Map<String, dynamic> json) =>
    AuthTokenEntity(
      tokenType: json['tokenType'] as String,
      accessToken: json['accessToken'] as String,
      accessTokenExpiresAt:
          DateTime.parse(json['accessTokenExpiresAt'] as String),
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiresAt:
          DateTime.parse(json['refreshTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$AuthTokenEntityToJson(AuthTokenEntity instance) =>
    <String, dynamic>{
      'tokenType': instance.tokenType,
      'accessToken': instance.accessToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt.toIso8601String(),
    };
