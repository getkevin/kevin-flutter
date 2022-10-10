import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';

class FakeEmailValidator extends Fake implements EmailValidator {
  ValidationResult _result = const ValidationResultInvalid(messageKey: 'messageKey');

  @override
  ValidationResult validate(String amount) => _result;

  void setValidationResult({required ValidationResult result}) {
    _result = result;
  }
}
