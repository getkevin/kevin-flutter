import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';

class GetCreditorsUseCase {
  final PaymentsDataRepository _repository;

  const GetCreditorsUseCase({
    required PaymentsDataRepository repository,
  }) : _repository = repository;

  Future<List<Creditor>> invoke(String countryCode) {
    final countryCodeResult = countryCode != 'LT' ? 'EE' : countryCode;
    return _repository.getCreditorsByCountry(countryCodeResult);
  }
}
