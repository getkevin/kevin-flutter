import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakeGetCreditorsUseCase extends Fake implements GetCreditorsUseCase {
  var _creditors = <Creditor>[];
  final _countryCodeHistory = <String>[];
  Exception? _error;

  @override
  Future<List<Creditor>> invoke(String countryCode) async {
    _countryCodeHistory.add(countryCode);

    _error?.let((it) => throw it);

    return _creditors;
  }

  void setCreditors({required List<Creditor> creditors}) {
    _creditors = creditors;
  }

  void setError({required Exception error}) {
    _error = error;
  }

  List<String> getCountryCodes() => List.of(_countryCodeHistory);
}
