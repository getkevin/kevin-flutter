import 'package:domain/auth/model/auth_token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_auth_token_entity.g.dart';

@JsonSerializable(createToJson: false)
class ApiAuthTokenEntity {
  final String tokenType;
  final String accessToken;
  final int accessTokenExpiresIn;
  final String refreshToken;
  final int refreshTokenExpiresIn;

  const ApiAuthTokenEntity({
    required this.tokenType,
    required this.accessToken,
    required this.accessTokenExpiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiresIn,
  });

  factory ApiAuthTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiAuthTokenEntityFromJson(json);

  AuthToken toModel(DateTime currentTime) => AuthToken(
        tokenType: tokenType,
        accessToken: accessToken,
        accessTokenExpiresAt:
            currentTime.add(Duration(milliseconds: accessTokenExpiresIn)),
        refreshToken: refreshToken,
        refreshTokenExpiresAt:
            currentTime.add(Duration(milliseconds: refreshTokenExpiresIn)),
      );
}
