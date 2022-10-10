import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';

class FakeAmountValidator extends Fake implements AmountValidator {
  ValidationResult _result = const ValidationResultInvalid(messageKey: 'messageKey');

  @override
  ValidationResult validate(String amount) => _result;

  void setValidationResult({required ValidationResult result}) {
    _result = result;
  }
}
