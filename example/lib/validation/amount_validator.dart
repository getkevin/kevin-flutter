import 'package:kevin_flutter_example/validation/model/validation_result.dart';

class AmountValidator {
  ValidationResult validate(String amount) {
    final amountDouble = double.tryParse(amount) ?? 0;

    if (amountDouble <= 0) {
      return const ValidationResultInvalid(message: 'Invalid');
    }

    return const ValidationResultValid();
  }
}
