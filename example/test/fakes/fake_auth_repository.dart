import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAuthRepository extends Fake implements AuthRepository {
  final _tokens = <String, AuthToken>{};

  @override
  Future<void> putAuthToken({
    required String linkToken,
    required AuthToken authToken,
  }) async {
    _tokens[linkToken] = authToken;
  }

  @override
  Future<AuthToken?> getAuthToken(String linkToken) async {
    return _tokens[linkToken];
  }

  @override
  Future<void> removeAuthToken(linkToken) async {
    _tokens.remove(linkToken);
  }
}
