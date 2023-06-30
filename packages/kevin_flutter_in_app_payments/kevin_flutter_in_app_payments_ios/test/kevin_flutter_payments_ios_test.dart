import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_ios/src/kevin_flutter_payments_ios.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/kevin_flutter_payments_platform_interface.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/kevin_session_result_payment_success.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payments_configuration.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_payments_ios');
  final log = <MethodCall>[];

  final platform = KevinFlutterPaymentsIos();

  void _setMethodCallReturnData({dynamic Function()? data}) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) {
      log.add(methodCall);
      return data?.call();
    });
  }

  setUp(() {
    _setMethodCallReturnData();
  });

  tearDown(() {
    log.clear();
  });

  test('registers instance', () {
    KevinFlutterPaymentsIos.registerWith();
    expect(
      KevinFlutterPaymentsPlatformInterface.instance,
      isA<KevinFlutterPaymentsIos>(),
    );
  });

  test('setPaymentsConfiguration', () async {
    const configuration = KevinPaymentsConfiguration(
      callbackUrl: KevinCallbackUrl(android: 'android', ios: 'ios'),
    );
    await platform.setPaymentsConfiguration(configuration);
    expect(log, <Matcher>[
      isMethodCall(
        'setPaymentsConfiguration',
        arguments: <String, dynamic>{
          'callbackUrl': 'ios',
        },
      ),
    ]);
  });

  test('startPayment: success', () async {
    const successResult =
        KevinSessionResultPaymentSuccess(paymentId: 'paymentId');

    final mockedResult = jsonEncode(successResult.toMap());

    _setMethodCallReturnData(data: () => mockedResult);

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
      ),
    ]);
  });

  test('startPayment: cancelled', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'cancelled');
      },
    );

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
      ),
    ]);
  });

  test('startPayment: general', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'general');
      },
    );

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
      ),
    ]);
  });

  test('startPayment: unexpected', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'unexpected');
      },
    );

    const configuration =
        KevinPaymentSessionConfiguration(paymentId: 'paymentId');
    final result = await platform.startPayment(configuration);
    expect(result, isInstanceOf<KevinSessionUnexpectedError>());
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
      ),
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
      ),
    ]);
  });

  test('getCallbackUrl: has value', () async {
    _setMethodCallReturnData(data: () => 'callbackUrl');

    final callbackUrl = await platform.getCallbackUrl();
    expect(callbackUrl, 'callbackUrl');
    expect(log, <Matcher>[
      isMethodCall(
        'getCallbackUrl',
        arguments: null,
      ),
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
      ),
    ]);
  });
}
