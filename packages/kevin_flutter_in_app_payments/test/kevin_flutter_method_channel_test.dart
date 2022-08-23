import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin.dart';
import 'package:kevin_flutter_in_app_payments/src/entity/result/kevin_session_result_payment_success_entity.dart';
import 'package:kevin_flutter_in_app_payments/src/kevin_flutter_payments_method_channel.dart';
import 'package:kevin_flutter_in_app_payments/src/kevin_flutter_payments_platform_interface.dart';
import 'package:kevin_flutter_in_app_payments/src/model/kevin_session_result_payment_success.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payments_configuration.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_payments');
  final log = <MethodCall>[];

  final platform = KevinFlutterPaymentsMethodChannel();

  final initialInstance = KevinFlutterPaymentsPlatformInterface.instance;

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    log.clear();
  });

  test('$KevinFlutterPaymentsMethodChannel() is the default instance', () {
    expect(initialInstance, isInstanceOf<KevinFlutterPaymentsMethodChannel>());
  });

  test('Cannot be implemented with `implements`', () {
    expect(
      () {
        KevinFlutterPaymentsPlatformInterface.instance =
            ImplementsKevinFlutterPaymentsPlatform();
      },
      throwsA(anything),
    );
  });

  test('Can be mocked with `implements`', () {
    final mock = KevinFlutterPaymentsPlatformMock();
    KevinFlutterPaymentsPlatformInterface.instance = mock;
  });

  test('Can be extended', () {
    KevinFlutterPaymentsPlatformInterface.instance =
        ExtendsKevinFlutterPaymentsPlatform();
  });

  test('setPaymentsConfiguration', () async {
    const configuration = KevinPaymentsConfiguration(
      callbackUrl: 'callbackUrl',
    );
    await platform.setPaymentsConfiguration(configuration);
    expect(log, <Matcher>[
      isMethodCall(
        'setPaymentsConfiguration',
        arguments: <String, dynamic>{
          'callbackUrl': 'callbackUrl',
        },
      )
    ]);
  });

  test('startPayment: success', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      const success = KevinSessionResultPaymentSuccessEntity(
        paymentId: 'paymentId',
      );

      return jsonEncode(success.toJson());
    });

    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    final result = await platform.startPayment(configuration);
    expect(result, isInstanceOf<KevinSessionResultPaymentSuccess>());
    expect(log, <Matcher>[
      isMethodCall(
        'startPayment',
        arguments: <String, dynamic>{
          'paymentId': 'paymentId',
          'paymentType': 'bank',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'skipAuthentication': false,
        },
      )
    ]);
  });

  test('startPayment: cancelled', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      throw PlatformException(code: 'cancelled');
    });

    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    final result = await platform.startPayment(configuration);
    expect(result, isInstanceOf<KevinSessionResultCancelled>());
    expect(log, <Matcher>[
      isMethodCall(
        'startPayment',
        arguments: <String, dynamic>{
          'paymentId': 'paymentId',
          'paymentType': 'bank',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'skipAuthentication': false,
        },
      )
    ]);
  });

  test('startPayment: general', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      throw PlatformException(code: 'general');
    });

    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    final result = await platform.startPayment(configuration);
    expect(result, isInstanceOf<KevinSessionResultGeneralError>());
    expect(log, <Matcher>[
      isMethodCall(
        'startPayment',
        arguments: <String, dynamic>{
          'paymentId': 'paymentId',
          'paymentType': 'bank',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'skipAuthentication': false,
        },
      )
    ]);
  });

  test('startPayment: unexpected', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      throw PlatformException(code: 'unexpected');
    });

    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    expect(
      () async {
        await platform.startPayment(configuration);
      },
      throwsA(isA<PlatformException>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'startPayment',
        arguments: <String, dynamic>{
          'paymentId': 'paymentId',
          'paymentType': 'bank',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'skipAuthentication': false,
        },
      )
    ]);
  });

  test('startPayment: null', () async {
    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    expect(
      () async {
        await platform.startPayment(configuration);
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'startPayment',
        arguments: <String, dynamic>{
          'paymentId': 'paymentId',
          'paymentType': 'bank',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'skipAuthentication': false,
        },
      )
    ]);
  });

  test('getCallbackUrl: has value', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return 'callbackUrl';
    });
    final callbackUrl = await platform.getCallbackUrl();
    expect(callbackUrl, 'callbackUrl');
    expect(log, <Matcher>[
      isMethodCall(
        'getCallbackUrl',
        arguments: null,
      )
    ]);
  });

  test('getCallbackUrl: has no value', () async {
    expect(
      () async {
        await platform.getCallbackUrl();
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'getCallbackUrl',
        arguments: null,
      )
    ]);
  });
}

class KevinFlutterPaymentsPlatformMock
    with MockPlatformInterfaceMixin
    implements KevinFlutterPaymentsPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ImplementsKevinFlutterPaymentsPlatform
    implements KevinFlutterPaymentsPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ExtendsKevinFlutterPaymentsPlatform
    extends KevinFlutterPaymentsPlatformInterface {}
