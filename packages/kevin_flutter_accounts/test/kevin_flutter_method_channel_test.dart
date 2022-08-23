import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts/src/entity/kevin_bank_entity.dart';
import 'package:kevin_flutter_accounts/src/entity/result/kevin_session_result_linking_success_entity.dart';
import 'package:kevin_flutter_accounts/src/kevin_flutter_accounts_method_channel.dart';
import 'package:kevin_flutter_accounts/src/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_accounts/src/model/kevin_accounts_models.dart';
import 'package:kevin_flutter_core/kevin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_accounts');
  final log = <MethodCall>[];

  final platform = KevinFlutterAccountsMethodChannel();

  final initialInstance = KevinFlutterAccountsPlatformInterface.instance;

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

  test('$KevinFlutterAccountsMethodChannel() is the default instance', () {
    expect(initialInstance, isInstanceOf<KevinFlutterAccountsMethodChannel>());
  });

  test('Cannot be implemented with `implements`', () {
    expect(
      () {
        KevinFlutterAccountsPlatformInterface.instance =
            ImplementsKevinFlutterAccountsPlatform();
      },
      throwsA(anything),
    );
  });

  test('Can be mocked with `implements`', () {
    final mock = KevinFlutterAccountsPlatformMock();
    KevinFlutterAccountsPlatformInterface.instance = mock;
  });

  test('Can be extended', () {
    KevinFlutterAccountsPlatformInterface.instance =
        ExtendsKevinFlutterAccountsPlatform();
  });

  test('setAccountsConfiguration', () async {
    const configuration = KevinAccountsConfiguration(
      callbackUrl: 'callbackUrl',
      showUnsupportedBanks: true,
    );
    await platform.setAccountsConfiguration(configuration);
    expect(log, <Matcher>[
      isMethodCall(
        'setAccountsConfiguration',
        arguments: <String, dynamic>{
          'callbackUrl': 'callbackUrl',
          'showUnsupportedBanks': true
        },
      )
    ]);
  });

  test('startAccountLinking: success', () async {
    const successResult = KevinSessionResultLinkingSuccessEntity(
      bank: KevinBankEntity(
        id: 'id',
        name: 'name',
        officialName: 'officialName',
        imageUri: 'imageUri',
        bic: 'bic',
      ),
      authorizationCode: 'authorizationCode',
      linkingType: 'bank',
    );

    final mockedResult = jsonEncode(successResult.toJson());

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

class KevinFlutterAccountsPlatformMock
    with MockPlatformInterfaceMixin
    implements KevinFlutterAccountsPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ImplementsKevinFlutterAccountsPlatform
    implements KevinFlutterAccountsPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ExtendsKevinFlutterAccountsPlatform
    extends KevinFlutterAccountsPlatformInterface {}
