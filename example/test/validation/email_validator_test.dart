import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';

void main() {
  EquatableConfig.stringify = true;

  late EmailValidator subject;

  setUp(() {
    subject = EmailValidator();
  });

  test('Validate empty email test', () {
    final result = subject.validate('');

    expect(
      result,
      const ValidationResultInvalid(
        messageKey: LocaleKeys.payments_page_details_email_error_empty,
      ),
    );
  });

  // Does not cover all valid email cases
  test('Validate basic emails test', () {
    final result = subject.validate('a@b.c');
    final result1 = subject.validate('1@2.c');
    final result2 = subject.validate('1d.a%@2.cV');

    expect(result, isA<ValidationResultValid>());
    expect(result1, isA<ValidationResultValid>());
    expect(result2, isA<ValidationResultValid>());
  });

  // Does not cover all invalid email cases
  test('Validate invalid emails test', () {
    final result = subject.validate('@b.c');
    final result1 = subject.validate('1@2.1');
    final result2 = subject.validate('1d.a%@2-c.cV');

    const invalidResult = ValidationResultInvalid(
      messageKey: LocaleKeys.payments_page_details_email_error_invalid,
    );

    expect(result, invalidResult);
    expect(result1, invalidResult);
    expect(result2, invalidResult);
  });
}
