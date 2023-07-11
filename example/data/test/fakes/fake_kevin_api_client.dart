import 'package:data/auth/entity/api_auth_token_entity.dart';
import 'package:data/kevin/api/kevin_api_client.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

const _authTokenEntity = ApiAuthTokenEntity(
  tokenType: 'tokenType',
  accessToken: 'accessToken',
  accessTokenExpiresIn: 3600000,
  refreshToken: 'refreshToken',
  refreshTokenExpiresIn: 7200000,
);

class FakeKevinApiClient extends Fake implements KevinApiClient {
  Exception? _authTokenError;
  Exception? _refreshAuthTokenError;
  Exception? _authStateError;
  Exception? _bankPaymentError;
  Exception? _linkedPaymentError;

  @override
  Future<ApiAuthTokenEntity> getAuthToken(String authCode) async {
    _authTokenError?.let((it) => throw it);

    return _authTokenEntity;
  }

  @override
  Future<ApiAuthTokenEntity> refreshAuthToken(
    RefreshAuthTokenRequest request,
  ) async {
    _refreshAuthTokenError?.let((it) => throw it);

    return _authTokenEntity;
  }

  @override
  Future<AuthState> getAuthState(LinkingRequest request) async {
    _authStateError?.let((it) => throw it);

    return const AuthState(
      authorizationLink: 'authorizationLink',
      state: 'state',
    );
  }

  @override
  Future<Payment> initializeBankPayment(PaymentRequest request) async {
    _bankPaymentError?.let((it) => throw it);

    return const Payment(id: 'bankPaymentId');
  }

  @override
  Future<Payment> initializeLinkedBankPayment({
    required String accessToken,
    required PaymentRequest request,
  }) async {
    _linkedPaymentError?.let((it) => throw it);

    return const Payment(id: 'linkedPaymentId');
  }

  void setErrors({
    Exception? authTokenError,
    Exception? refreshAuthTokenError,
    Exception? authStateError,
    Exception? bankPaymentError,
    Exception? linkedPaymentError,
  }) {
    _authTokenError = authTokenError;
    _refreshAuthTokenError = refreshAuthTokenError;
    _authStateError = authStateError;
    _bankPaymentError = bankPaymentError;
    _linkedPaymentError = linkedPaymentError;
  }
}
