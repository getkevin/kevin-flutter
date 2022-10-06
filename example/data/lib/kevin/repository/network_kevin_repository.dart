import 'package:data/kevin/api/kevin_api_client.dart';
import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/time/time_provider.dart';

class NetworkKevinRepository extends KevinRepository {
  final KevinApiClient _apiClient;
  final TimeProvider _timeProvider;

  NetworkKevinRepository({
    required KevinApiClient apiClient,
    required TimeProvider timeProvider,
  })  : _apiClient = apiClient,
        _timeProvider = timeProvider;

  @override
  Future<AuthToken> getAuthToken(String authCode) async {
    final entity = await _apiClient.getAuthToken(authCode);
    return entity.toModel(_timeProvider.now());
  }

  @override
  Future<AuthToken> refreshAuthToken(RefreshAuthTokenRequest request) async {
    final entity = await _apiClient.refreshAuthToken(request);
    return entity.toModel(_timeProvider.now());
  }

  @override
  Future<AuthState> getAuthState(LinkingRequest request) =>
      _apiClient.getAuthState(request);

  @override
  Future<Payment> initializeBankPayment(PaymentRequest request) =>
      _apiClient.initializeBankPayment(request);

  @override
  Future<Payment> initializeCardPayment(PaymentRequest request) =>
      _apiClient.initializeCardPayment(request);

  @override
  Future<Payment> initializeLinkedBankPayment({
    required String accessToken,
    required PaymentRequest request,
  }) =>
      _apiClient.initializeLinkedBankPayment(
        accessToken: accessToken,
        request: request,
      );
}
