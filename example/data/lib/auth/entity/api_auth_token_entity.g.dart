// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_auth_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAuthTokenEntity _$ApiAuthTokenEntityFromJson(Map<String, dynamic> json) =>
    ApiAuthTokenEntity(
      tokenType: json['tokenType'] as String,
      accessToken: json['accessToken'] as String,
      accessTokenExpiresIn: json['accessTokenExpiresIn'] as int,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiresIn: json['refreshTokenExpiresIn'] as int,
    );
