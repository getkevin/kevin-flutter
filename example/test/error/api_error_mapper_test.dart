import 'dart:io';

import 'package:domain/error/model/api_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';

import '../test_data.dart';

void main() {
  EquatableConfig.stringify = true;

  late ApiErrorMapper subject;

  setUp(() {
    subject = ApiErrorMapper();
  });

  test('Not an ApiError test', () {
    final result = subject.map(exception);

    expect(result, LocaleKeys.general_error_unknown);
  });

  test('No internet connection test', () {
    final result =
        subject.map(const ApiError(cause: SocketException('message')));

    expect(result, LocaleKeys.general_error_no_internet);
  });

  test('General ApiError with description test', () {
    final result = subject.map(const ApiError(description: 'description'));

    expect(result, 'description');
  });

  test('General ApiError without description test', () {
    final result = subject.map(const ApiError());

    expect(result, LocaleKeys.general_error_unknown);
  });
}
