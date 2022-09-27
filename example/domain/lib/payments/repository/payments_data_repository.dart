import 'package:domain/payments/model/creditor.dart';

abstract class PaymentsDataRepository {
  Future<List<String>> getSupportedCountries();

  Future<List<Creditor>> getCreditorsByCountry(String countryCode);
}
