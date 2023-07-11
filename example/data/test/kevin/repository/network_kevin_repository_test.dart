import 'package:data/kevin/repository/network_kevin_repository.dart';
import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_kevin_api_client.dart';
import '../../fakes/fake_time_provider.dart';
import '../../test_data.dart';

void main() {
  late FakeKevinApiClient apiClient;
  late FakeTimeProvider timeProvider;
  late NetworkKevinRepository subject;

  setUp(() {
    apiClient = FakeKevinApiClient();
    timeProvider = FakeTimeProvider();
    subject = NetworkKevinRepository(
      apiClient: apiClient,
      timeProvider: timeProvider,
    );
  });

  test('Get auth token success', () async {
    final result = await subject.getAuthToken('authCode');

    expect(
      result,
      AuthToken(
        tokenType: 'tokenType',
        accessToken: 'accessToken',
        accessTokenExpiresAt:
            timeProvider.now().add(const Duration(seconds: 3600)),
        refreshToken: 'refreshToken',
        refreshTokenExpiresAt:
            timeProvider.now().add(const Duration(seconds: 7200)),
      ),
    );
  });

  test('Get auth token error', () async {
    apiClient.setErrors(authTokenError: exception);

    expect(
      () async => subject.getAuthToken('authCode'),
      throwsA(exception),
    );
  });

  test('Refresh auth token success', () async {
    final result = await subject.refreshAuthToken(
      const RefreshAuthTokenRequest(refreshToken: 'refreshToken'),
    );

    expect(
      result,
      AuthToken(
        tokenType: 'tokenType',
        accessToken: 'accessToken',
        accessTokenExpiresAt:
            timeProvider.now().add(const Duration(seconds: 3600)),
        refreshToken: 'refreshToken',
        refreshTokenExpiresAt:
            timeProvider.now().add(const Duration(seconds: 7200)),
      ),
    );
  });

  test('Refresh auth token error', () async {
    apiClient.setErrors(refreshAuthTokenError: exception);

    expect(
      () async => subject.refreshAuthToken(
        const RefreshAuthTokenRequest(refreshToken: 'refreshToken'),
      ),
      throwsA(exception),
    );
  });

  test('Get auth state success', () async {
    final result = await subject.getAuthState(
      const LinkingRequest(scopes: [], redirectUrl: 'redirectUrl'),
    );

    expect(
      result,
      const AuthState(authorizationLink: 'authorizationLink', state: 'state'),
    );
  });

  test('Get auth state error', () async {
    apiClient.setErrors(authStateError: exception);

    expect(
      () async => subject.getAuthState(
        const LinkingRequest(scopes: [], redirectUrl: 'redirectUrl'),
      ),
      throwsA(exception),
    );
  });

  test('Initialize bank payment success', () async {
    final result = await subject.initializeBankPayment(
      paymentRequest,
    );

    expect(
      result,
      const Payment(id: 'bankPaymentId'),
    );
  });

  test('Initialize bank payment error', () async {
    apiClient.setErrors(bankPaymentError: exception);

    expect(
      () async => subject.initializeBankPayment(
        paymentRequest,
      ),
      throwsA(exception),
    );
  });

  test('Initialize linked payment success', () async {
    final result = await subject.initializeLinkedBankPayment(
      accessToken: 'accessToken',
      request: paymentRequest,
    );

    expect(
      result,
      const Payment(id: 'linkedPaymentId'),
    );
  });

  test('Initialize linked payment error', () async {
    apiClient.setErrors(linkedPaymentError: exception);

    expect(
      () async => subject.initializeLinkedBankPayment(
        accessToken: 'accessToken',
        request: paymentRequest,
      ),
      throwsA(exception),
    );
  });
}
