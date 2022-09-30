import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/auth/repository/auth_repository.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/time/time_provider.dart';

class GetAuthTokenUseCase {
  final AuthRepository _authRepository;
  final KevinRepository _kevinRepository;
  final TimeProvider _timeProvider;
  final Duration _tokenExpirationGap;

  const GetAuthTokenUseCase({
    required AuthRepository authRepository,
    required KevinRepository kevinRepository,
    required TimeProvider timeProvider,
    required Duration tokenExpirationGap,
  })  : _authRepository = authRepository,
        _kevinRepository = kevinRepository,
        _timeProvider = timeProvider,
        _tokenExpirationGap = tokenExpirationGap;

  Future<AuthToken> invoke(String linkToken) async {
    final currentToken =
        await _authRepository.getAuthToken(linkToken);

    if (currentToken == null) return _getNewAuthToken(linkToken: linkToken);

    final accessTokenValid =
        _isTokenValid(expiresAt: currentToken.accessTokenExpiresAt);
    if (accessTokenValid) return currentToken;

    final refreshTokenValid =
        _isTokenValid(expiresAt: currentToken.refreshTokenExpiresAt);
    if (refreshTokenValid) {
      return _refreshAuthToken(
        refreshToken: currentToken.refreshToken,
        linkToken: linkToken,
      );
    }

    return _getNewAuthToken(linkToken: linkToken);
  }

  Future<AuthToken> _getNewAuthToken({required String linkToken}) async {
    final token = await _kevinRepository.getAuthToken(linkToken);
    await _authRepository.putAuthToken(
      linkToken: linkToken,
      authToken: token,
    );
    return token;
  }

  Future<AuthToken> _refreshAuthToken({
    required String refreshToken,
    required String linkToken,
  }) async {
    final token = await _kevinRepository.refreshAuthToken(
      RefreshAuthTokenRequest(refreshToken: refreshToken),
    );
    await _authRepository.putAuthToken(
      linkToken: linkToken,
      authToken: token,
    );
    return token;
  }

  bool _isTokenValid({required DateTime expiresAt}) {
    final deadline = expiresAt.subtract(_tokenExpirationGap);
    return _timeProvider.now().isBefore(deadline);
  }
}
