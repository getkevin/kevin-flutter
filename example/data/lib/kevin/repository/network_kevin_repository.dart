import 'package:data/kevin/api/kevin_api_client.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';

class NetworkKevinRepository extends KevinRepository {
  final KevinApiClient _apiClient;

  NetworkKevinRepository({
    required KevinApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<AuthState> getAuthState(LinkingRequest request) =>
      _apiClient.getAuthState(request);

  @override
  Future<Payment> initializeBankPayment(PaymentRequest request) =>
      _apiClient.initializeBankPayment(request);

  @override
  Future<Payment> initializeCardPayment(PaymentRequest request) =>
      _apiClient.initializeCardPayment(request);
}
