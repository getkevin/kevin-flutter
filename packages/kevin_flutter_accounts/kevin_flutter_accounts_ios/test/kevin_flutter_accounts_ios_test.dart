import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts_ios/kevin_flutter_accounts_ios.dart';
import 'package:kevin_flutter_accounts_platform_interface/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_accounts_ios');
  final log = <MethodCall>[];

  final platform = KevinFlutterAccountsIos();

  void _setMethodCallReturnData({dynamic Function()? data}) {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
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
    KevinFlutterAccountsIos.registerWith();
    expect(
      KevinFlutterAccountsPlatformInterface.instance,
      isA<KevinFlutterAccountsIos>(),
    );
  });

  test('setAccountsConfiguration', () async {
    const configuration = KevinAccountsConfiguration(
      callbackUrl: KevinCallbackUrl(android: 'android', ios: 'ios'),
      showUnsupportedBanks: true,
    );
    await platform.setAccountsConfiguration(configuration);
    expect(log, <Matcher>[
      isMethodCall(
        'setAccountsConfiguration',
        arguments: <String, dynamic>{
          'callbackUrl': 'ios',
          'showUnsupportedBanks': true
        },
      )
    ]);
  });

  test('startAccountLinking: success', () async {
    const successResult = KevinSessionResultLinkingSuccess(
      bank: KevinBank(
        id: 'id',
        name: 'name',
        officialName: 'officialName',
        imageUri: 'imageUri',
        bic: 'bic',
      ),
      authorizationCode: 'authorizationCode',
      linkingType: KevinAccountLinkingType.bank,
    );

    final mockedResult = jsonEncode(successResult.toMap());

    _setMethodCallReturnData(data: () => mockedResult);

    const configuration = KevinAccountSessionConfiguration(state: 'state');
    final result = await platform.startAccountLinking(configuration);
    expect(result, isInstanceOf<KevinSessionResultLinkingSuccess>());
    expect(log, <Matcher>[
      isMethodCall(
        'startAccountLinking',
        arguments: <String, dynamic>{
          'state': 'state',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'accountLinkingType': 'bank',
        },
      )
    ]);
  });

  test('startAccountLinking: cancelled', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'cancelled');
      },
    );

    const configuration = KevinAccountSessionConfiguration(state: 'state');
    final result = await platform.startAccountLinking(configuration);
    expect(result, isInstanceOf<KevinSessionResultCancelled>());
    expect(log, <Matcher>[
      isMethodCall(
        'startAccountLinking',
        arguments: <String, dynamic>{
          'state': 'state',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'accountLinkingType': 'bank',
        },
      )
    ]);
  });

  test('startAccountLinking: general', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'general');
      },
    );

    const configuration = KevinAccountSessionConfiguration(state: 'state');
    final result = await platform.startAccountLinking(configuration);
    expect(result, isInstanceOf<KevinSessionResultGeneralError>());
    expect(log, <Matcher>[
      isMethodCall(
        'startAccountLinking',
        arguments: <String, dynamic>{
          'state': 'state',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'accountLinkingType': 'bank',
        },
      )
    ]);
  });

  test('startAccountLinking: unexpected', () async {
    _setMethodCallReturnData(
      data: () {
        throw PlatformException(code: 'unexpected');
      },
    );

    const configuration = KevinAccountSessionConfiguration(state: 'state');
    expect(
      () async {
        await platform.startAccountLinking(configuration);
      },
      throwsA(isA<PlatformException>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'startAccountLinking',
        arguments: <String, dynamic>{
          'state': 'state',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'accountLinkingType': 'bank',
        },
      )
    ]);
  });

  test('startAccountLinking: null', () async {
    const configuration = KevinAccountSessionConfiguration(state: 'state');
    expect(
      () async {
        await platform.startAccountLinking(configuration);
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'startAccountLinking',
        arguments: <String, dynamic>{
          'state': 'state',
          'preselectedCountry': null,
          'disableCountrySelection': false,
          'countryFilter': [],
          'bankFilter': [],
          'preselectedBank': null,
          'skipBankSelection': false,
          'accountLinkingType': 'bank',
        },
      )
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

  test('isShowUnsupportedBanks: has value', () async {
    _setMethodCallReturnData(data: () => true);
    final callbackUrl = await platform.isShowUnsupportedBanks();
    expect(callbackUrl, true);
    expect(log, <Matcher>[
      isMethodCall(
        'isShowUnsupportedBanks',
        arguments: null,
      )
    ]);
  });

  test('isShowUnsupportedBanks: has no value', () async {
    expect(
      () async {
        await platform.isShowUnsupportedBanks();
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isShowUnsupportedBanks',
        arguments: null,
      )
    ]);
  });
}
