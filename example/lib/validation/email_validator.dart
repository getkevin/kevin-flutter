import 'package:kevin_flutter_example/validation/model/validation_result.dart';

class EmailValidator {
  ValidationResult validate(String email) {
    if (email.isEmpty) {
      return const ValidationResultInvalid(message: 'Empty');
    } else if (!_isValidEmail(email)) {
      return const ValidationResultInvalid(message: 'Invalid');
    }

    return const ValidationResultValid();
  }

  bool _isValidEmail(String email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email);
}
