import 'package:domain/auth/model/auth_token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token_entity.g.dart';

@JsonSerializable()
class AuthTokenEntity {
  final String tokenType;
  final String accessToken;
  final DateTime accessTokenExpiresAt;
  final String refreshToken;
  final DateTime refreshTokenExpiresAt;

  const AuthTokenEntity({
    required this.tokenType,
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
  });

  factory AuthTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenEntityFromJson(json);

  factory AuthTokenEntity.fromModel(AuthToken model) => AuthTokenEntity(
        tokenType: model.tokenType,
        accessToken: model.accessToken,
        accessTokenExpiresAt: model.accessTokenExpiresAt,
        refreshToken: model.refreshToken,
        refreshTokenExpiresAt: model.refreshTokenExpiresAt,
      );

  Map<String, dynamic> toJson() => _$AuthTokenEntityToJson(this);

  AuthToken toModel() => AuthToken(
        tokenType: tokenType,
        accessToken: accessToken,
        accessTokenExpiresAt: accessTokenExpiresAt,
        refreshToken: refreshToken,
        refreshTokenExpiresAt: refreshTokenExpiresAt,
      );
}
