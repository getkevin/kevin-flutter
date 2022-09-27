import 'package:data/api/api.dart';
import 'package:data/payments/entity/creditors_entity.dart';
import 'package:data/payments/entity/supported_countries_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/payments/model/creditor.dart';

class PaymentsDataApiClient {
  final Dio _dio;

  const PaymentsDataApiClient({
    required Dio dio,
  }) : _dio = dio;

  Future<List<Creditor>> getCreditorsByCountry(String countryCode) async {
    final result = await makeRequest(
      () =>
          _dio.get('creditors', queryParameters: {'countryCode': countryCode}),
    );
    return CreditorsEntity.fromJson(result.data).toModel();
  }

  Future<List<String>> getSupportedCountries() async {
    final result = await makeRequest(() => _dio.get('countries'));
    return SupportedCountriesEntity.fromJson(result.data).data;
  }
}
