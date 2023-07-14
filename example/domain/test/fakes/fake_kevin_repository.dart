import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

import '../test_data.dart';

class FakeKevinRepository extends Fake implements KevinRepository {
  final _authTokenCallHistory = <String>[];
  final _refreshAuthTokenCallHistory = <RefreshAuthTokenRequest>[];
  final _authStateCallHistory = <LinkingRequest>[];
  final _bankCallHistory = <PaymentRequest>[];
  final _cardCallHistory = <PaymentRequest>[];
  final _linkedCallHistory = <PaymentRequest>[];
  var _authToken = authToken;
  var _refreshedAuthToken = authToken;
  Exception? _authTokenError;
  Exception? _refreshAuthTokenError;
  Exception? _authStateError;
  Exception? _bankError;
  Exception? _linkedError;

  @override
  Future<AuthToken> getAuthToken(String authCode) async {
    _authTokenCallHistory.add(authCode);

    _authTokenError?.let((it) => throw it);

    return _authToken;
  }

  @override
  Future<AuthToken> refreshAuthToken(RefreshAuthTokenRequest request) async {
    _refreshAuthTokenCallHistory.add(request);

    _refreshAuthTokenError?.let((it) => throw it);

    return _refreshedAuthToken;
  }

  @override
  Future<AuthState> getAuthState(LinkingRequest request) async {
    _authStateCallHistory.add(request);

    _authStateError?.let((it) => throw it);

    return const AuthState(
      authorizationLink: 'authorizationLink',
      state: 'state',
    );
  }

  @override
  Future<Payment> initializeBankPayment(PaymentRequest request) async {
    _bankCallHistory.add(request);

    _bankError?.let((it) => throw it);

    return const Payment(id: 'bankPaymentId');
  }

  @override
  Future<Payment> initializeLinkedBankPayment({
    required String accessToken,
    required PaymentRequest request,
  }) async {
    _linkedCallHistory.add(request);

    _linkedError?.let((it) => throw it);

    return const Payment(id: 'linkedPaymentId');
  }

  void setAuthToken({required AuthToken authToken}) {
    _authToken = authToken;
  }

  void setRefreshedToken({required AuthToken authToken}) {
    _refreshedAuthToken = authToken;
  }

  void setErrors({
    Exception? authTokenError,
    Exception? refreshAuthTokenError,
    Exception? authStateError,
    Exception? bankError,
    Exception? cardError,
    Exception? linkedError,
  }) {
    _authTokenError = authTokenError;
    _refreshAuthTokenError = refreshAuthTokenError;
    _authStateError = authStateError;
    _bankError = bankError;
    _linkedError = linkedError;
  }

  List<String> getAuthTokenCallHistory() => List.of(_authTokenCallHistory);

  List<RefreshAuthTokenRequest> getRefreshAuthTokenCallHistory() =>
      List.of(_refreshAuthTokenCallHistory);

  List<LinkingRequest> getAuthStateCallHistory() =>
      List.of(_authStateCallHistory);

  List<PaymentRequest> getBankCallHistory() => List.of(_bankCallHistory);

  List<PaymentRequest> getCardCallHistory() => List.of(_cardCallHistory);

  List<PaymentRequest> getLinkedCallHistory() => List.of(_linkedCallHistory);
}
