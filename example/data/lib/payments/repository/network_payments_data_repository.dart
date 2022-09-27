import 'package:data/payments/api/payments_data_api_client.dart';
import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';

class NetworkPaymentsDataRepository extends PaymentsDataRepository {
  final PaymentsDataApiClient _apiClient;

  NetworkPaymentsDataRepository({
    required PaymentsDataApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<String>> getSupportedCountries() =>
      _apiClient.getSupportedCountries();

  @override
  Future<List<Creditor>> getCreditorsByCountry(String countryCode) =>
      _apiClient.getCreditorsByCountry(countryCode);
}
