import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakePaymentsDataRepository extends Fake
    implements PaymentsDataRepository {
  var _supportedCountries = <String>[];
  var _creditors = <Creditor>[];
  final _creditorsCallHistory = <String>[];
  Exception? _supportedCountriesError;
  Exception? _creditorsError;

  @override
  Future<List<String>> getSupportedCountries() async {
    _supportedCountriesError?.let((it) => throw it);

    return _supportedCountries;
  }

  @override
  Future<List<Creditor>> getCreditorsByCountry(String countryCode) async {
    _creditorsCallHistory.add(countryCode);

    _creditorsError?.let((it) => throw it);

    return _creditors;
  }

  void setSupportedCountries({required List<String> supportedCountries}) {
    _supportedCountries = supportedCountries;
  }

  void setCreditors({required List<Creditor> creditors}) {
    _creditors = creditors;
  }

  void setErrors({
    Exception? supportedCountriesError,
    Exception? creditorsError,
  }) {
    _supportedCountriesError = supportedCountriesError;
    _creditorsError = creditorsError;
  }

  List<String> getCreditorsCallHistory() => List.of(_creditorsCallHistory);
}
