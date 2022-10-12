import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/usecase/get_auth_token_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_data.dart';

class FakeGetAuthTokenUseCase extends Fake implements GetAuthTokenUseCase {
  @override
  Future<AuthToken> invoke(String linkToken) async {
    return authToken;
  }
}
