import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts/src/entity/kevin_bank_entity.dart';
import 'package:kevin_flutter_accounts/src/entity/result/kevin_session_result_linking_success_entity.dart';
import 'package:kevin_flutter_accounts/src/kevin_flutter_method_channel.dart';
import 'package:kevin_flutter_accounts/src/kevin_flutter_platform_interface.dart';
import 'package:kevin_flutter_accounts/src/model/kevin_accounts_models.dart';
import 'package:kevin_flutter_core/kevin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_accounts');
  final log = <MethodCall>[];

  final platform = MethodChannelKevinAccountsFlutter();

  final initialInstance = KevinAccountsFlutterPlatform.instance;

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    log.clear();
  });

  test('$MethodChannelKevinAccountsFlutter() is the default instance', () {
    expect(initialInstance, isInstanceOf<MethodChannelKevinAccountsFlutter>());
  });

  test('Cannot be implemented with `implements`', () {
    expect(
      () {
        KevinAccountsFlutterPlatform.instance =
            ImplementsKevinAccountsFlutterPlatform();
      },
      throwsA(anything),
    );
  });

  test('Can be mocked with `implements`', () {
    final mock = KevinAccountsFlutterPlatformMock();
    KevinAccountsFlutterPlatform.instance = mock;
  });

  test('Can be extended', () {
    KevinAccountsFlutterPlatform.instance =
        ExtendsKevinAccountsFlutterPlatform();
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
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      const success = KevinSessionResultLinkingSuccessEntity(
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

      return jsonEncode(success.toJson());
    });

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
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      throw PlatformException(code: 'cancelled');
    });

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
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);

      throw PlatformException(code: 'general');
    });

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

  test('isShowUnsupportedBanks: has value', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });
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

class KevinAccountsFlutterPlatformMock
    with MockPlatformInterfaceMixin
    implements KevinAccountsFlutterPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ImplementsKevinAccountsFlutterPlatform
    implements KevinAccountsFlutterPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ExtendsKevinAccountsFlutterPlatform extends KevinAccountsFlutterPlatform {
}
