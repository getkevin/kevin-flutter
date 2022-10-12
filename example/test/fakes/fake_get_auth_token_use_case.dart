import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/usecase/get_auth_token_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

import '../test_data.dart';

class FakeGetAuthTokenUseCase extends Fake implements GetAuthTokenUseCase {
  var _authToken = authToken;
  final _callHistory = <String>[];
  Exception? _error;

  @override
  Future<AuthToken> invoke(String linkToken) async {
    _callHistory.add(linkToken);

    _error?.let((it) => throw it);

    return _authToken;
  }

  void setAuthToken({required AuthToken authToken}) {
    _authToken = authToken;
  }

  void setError({required Exception error}) {
    _error = error;
  }

  List<String> getCallHistory() => List.of(_callHistory);
}
