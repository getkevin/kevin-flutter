import 'package:domain/auth/model/auth_token.dart';

abstract class AuthRepository {
  Future<void> putAuthToken({
    required String linkToken,
    required AuthToken authToken,
  });

  Future<AuthToken?> getAuthToken(String linkToken);

  Future<void> removeAuthToken(linkToken);
}
