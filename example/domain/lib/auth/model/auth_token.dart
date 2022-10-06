import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String tokenType;
  final String accessToken;
  final DateTime accessTokenExpiresAt;
  final String refreshToken;
  final DateTime refreshTokenExpiresAt;

  const AuthToken({
    required this.tokenType,
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
  });

  @override
  List<Object?> get props => [
        tokenType,
        accessToken,
        accessTokenExpiresAt,
        refreshToken,
        refreshTokenExpiresAt,
      ];
}
