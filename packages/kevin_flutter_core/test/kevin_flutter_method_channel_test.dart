import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/src/kevin_flutter_method_channel.dart';
import 'package:kevin_flutter_core/src/kevin_flutter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_core');
  final log = <MethodCall>[];

  final platform = MethodChannelKevinFlutter();

  final initialInstance = KevinFlutterPlatform.instance;

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    log.clear();
  });

  test('$MethodChannelKevinFlutter() is the default instance', () {
    expect(initialInstance, isInstanceOf<MethodChannelKevinFlutter>());
  });

  test('Cannot be implemented with `implements`', () {
    expect(
      () {
        KevinFlutterPlatform.instance = ImplementsKevinFlutterPlatform();
      },
      throwsA(anything),
    );
  });

  test('Can be mocked with `implements`', () {
    final mock = KevinFlutterPlatformMock();
    KevinFlutterPlatform.instance = mock;
  });

  test('Can be extended', () {
    KevinFlutterPlatform.instance = ExtendsKevinFlutterPlatform();
  });

  test('setLocale', () async {
    await platform.setLocale('en');
    expect(log, <Matcher>[
      isMethodCall(
        'setLocale',
        arguments: <String, String>{'languageCode': 'en'},
      )
    ]);
  });

  test('setTheme', () async {
    await platform.setTheme();
    expect(log, <Matcher>[
      isMethodCall(
        'setTheme',
        arguments: null,
      )
    ]);
  });

  test('setSandbox', () async {
    await platform.setSandbox(true);
    expect(log, <Matcher>[
      isMethodCall(
        'setSandbox',
        arguments: <String, bool>{'sandbox': true},
      )
    ]);
  });

  test('setDeepLinkingEnabled', () async {
    await platform.setDeepLinkingEnabled(true);
    expect(log, <Matcher>[
      isMethodCall(
        'setDeepLinkingEnabled',
        arguments: <String, bool>{'deepLinkingEnabled': true},
      )
    ]);
  });

  test('getLocale: has value', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return 'en';
    });

    final locale = await platform.getLocale();
    expect(locale, 'en');
    expect(log, <Matcher>[
      isMethodCall(
        'getLocale',
        arguments: null,
      )
    ]);
  });

  test('getLocale: has no value', () async {
    final locale = await platform.getLocale();
    expect(locale, null);
    expect(log, <Matcher>[
      isMethodCall(
        'getLocale',
        arguments: null,
      )
    ]);
  });

  test('isSandbox: has value', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });

    final sandbox = await platform.isSandbox();
    expect(sandbox, true);
    expect(log, <Matcher>[
      isMethodCall(
        'isSandbox',
        arguments: null,
      )
    ]);
  });

  test('isSandbox: has no value', () async {
    expect(
      () async {
        await platform.isSandbox();
      },
      throwsA(anything),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isSandbox',
        arguments: null,
      )
    ]);
  });

  test('isDeepLinkingEnabled: has value', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });

    final deepLinkingEnabled = await platform.isDeepLinkingEnabled();
    expect(deepLinkingEnabled, true);
    expect(log, <Matcher>[
      isMethodCall(
        'isDeepLinkingEnabled',
        arguments: null,
      )
    ]);
  });

  test('isDeepLinkingEnabled: has no value', () async {
    expect(
      () async {
        await platform.isDeepLinkingEnabled();
      },
      throwsA(anything),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isDeepLinkingEnabled',
        arguments: null,
      )
    ]);
  });
}

class KevinFlutterPlatformMock
    with MockPlatformInterfaceMixin
    implements KevinFlutterPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ImplementsKevinFlutterPlatform implements KevinFlutterPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ExtendsKevinFlutterPlatform extends KevinFlutterPlatform {}
