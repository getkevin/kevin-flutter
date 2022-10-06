import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

void main() {
  test('Parses cancelled', () {
    final result =
        KevinErrorHelper.parseError(PlatformException(code: 'cancelled'));
    expect(result, isA<KevinSessionResultCancelled>());
  });

  test('Parses general', () {
    final result = KevinErrorHelper.parseError(
      PlatformException(code: 'general', message: 'message'),
    );
    expect((result as KevinSessionResultGeneralError).message, 'message');
  });

  test('Returns null on unknown error', () {
    final result =
        KevinErrorHelper.parseError(PlatformException(code: 'unknown'));
    expect(result, null);
  });
}
