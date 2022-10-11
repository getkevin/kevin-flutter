import 'package:data/payments/api/payments_data_api_client.dart';
import 'package:domain/payments/model/creditor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakePaymentsDataApiClient extends Fake implements PaymentsDataApiClient {
  Exception? _creditorsError;
  Exception? _supportedCountriesError;

  @override
  Future<List<Creditor>> getCreditorsByCountry(String countryCode) async {
    _creditorsError?.let((it) => throw it);

    return [const Creditor(logo: 'logo', name: 'name', accounts: [])];
  }

  @override
  Future<List<String>> getSupportedCountries() async {
    _supportedCountriesError?.let((it) => throw it);

    return ['LT', 'LV', 'EE'];
  }

  void setErrors({
    Exception? creditorsError,
    Exception? supportedCountriesError,
  }) {
    _creditorsError = creditorsError;
    _supportedCountriesError = supportedCountriesError;
  }
}
