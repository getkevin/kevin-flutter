import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';

void main() {
  EquatableConfig.stringify = true;

  late AmountValidator subject;

  setUp(() {
    subject = AmountValidator();
  });

  test('Validate invalid string test', () {
    final result = subject.validate('');
    final result1 = subject.validate('amount');

    expect(result, isA<ValidationResultInvalid>());
    expect(result1, isA<ValidationResultInvalid>());
  });

  test('Validate invalid double value test', () {
    final result = subject.validate('0,1');

    expect(result, isA<ValidationResultInvalid>());
  });

  test('Validate zero test', () {
    final result = subject.validate('0');

    expect(result, isA<ValidationResultInvalid>());
  });

  test('Validate double test', () {
    final result = subject.validate('2');
    final result1 = subject.validate('2.0');

    expect(result, isA<ValidationResultValid>());
    expect(result1, isA<ValidationResultValid>());
  });
}
