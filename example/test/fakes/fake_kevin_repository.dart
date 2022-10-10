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
  final _authStateCallHistory = <LinkingRequest>[];
  final _bankCallHistory = <PaymentRequest>[];
  final _cardCallHistory = <PaymentRequest>[];
  final _linkedCallHistory = <PaymentRequest>[];
  Exception? _authStateError;
  Exception? _bankError;
  Exception? _cardError;
  Exception? _linkedError;

  @override
  Future<AuthToken> getAuthToken(String authCode) async {
    return authToken;
  }

  @override
  Future<AuthToken> refreshAuthToken(RefreshAuthTokenRequest request) async {
    return authToken;
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
  Future<Payment> initializeCardPayment(PaymentRequest request) async {
    _cardCallHistory.add(request);

    _cardError?.let((it) => throw it);

    return const Payment(id: 'cardPaymentId');
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

  void setErrors({
    Exception? authStateError,
    Exception? bankError,
    Exception? cardError,
    Exception? linkedError,
  }) {
    _authStateError = authStateError;
    _bankError = bankError;
    _cardError = cardError;
    _linkedError = linkedError;
  }

  List<LinkingRequest> getAuthStateCallHistory() =>
      List.of(_authStateCallHistory);

  List<PaymentRequest> getBankCallHistory() => List.of(_bankCallHistory);

  List<PaymentRequest> getCardCallHistory() => List.of(_cardCallHistory);

  List<PaymentRequest> getLinkedCallHistory() => List.of(_linkedCallHistory);
}
