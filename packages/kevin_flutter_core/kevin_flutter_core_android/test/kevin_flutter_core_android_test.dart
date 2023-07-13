import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core_android/kevin_flutter_core_android.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_core_android');
  final log = <MethodCall>[];

  final platform = KevinFlutterCoreAndroid();

  void _setMethodCallReturnData({dynamic Function()? data}) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
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
    KevinFlutterCoreAndroid.registerWith();
    expect(
      KevinFlutterCorePlatformInterface.instance,
      isA<KevinFlutterCoreAndroid>(),
    );
  });

  test('setLocale', () async {
    await platform.setLocale('en');
    expect(log, <Matcher>[
      isMethodCall(
        'setLocale',
        arguments: <String, String>{'languageCode': 'en'},
      ),
    ]);
  });

  test('setTheme', () async {
    _setMethodCallReturnData(data: () => true);

    final result =
        await platform.setTheme(androidTheme: const KevinThemeAndroid('theme'));
    expect(result, true);
    expect(log, <Matcher>[
      isMethodCall(
        'setTheme',
        arguments: <String, String>{'theme': 'theme'},
      ),
    ]);
  });

  test('setTheme: theme absent', () async {
    final result = await platform.setTheme(androidTheme: null);
    expect(result, false);
  });

  test('setSandbox', () async {
    await platform.setSandbox(true);
    expect(log, <Matcher>[
      isMethodCall(
        'setSandbox',
        arguments: <String, bool>{'sandbox': true},
      ),
    ]);
  });

  test('setDeepLinkingEnabled', () async {
    await platform.setDeepLinkingEnabled(true);
    expect(log, <Matcher>[
      isMethodCall(
        'setDeepLinkingEnabled',
        arguments: <String, bool>{'deepLinkingEnabled': true},
      ),
    ]);
  });

  test('getLocale: has value', () async {
    _setMethodCallReturnData(data: () => 'en');

    final locale = await platform.getLocale();
    expect(locale, 'en');
    expect(log, <Matcher>[
      isMethodCall(
        'getLocale',
        arguments: null,
      ),
    ]);
  });

  test('getLocale: has no value', () async {
    final locale = await platform.getLocale();
    expect(locale, null);
    expect(log, <Matcher>[
      isMethodCall(
        'getLocale',
        arguments: null,
      ),
    ]);
  });

  test('isSandbox: has value', () async {
    _setMethodCallReturnData(data: () => true);

    final sandbox = await platform.isSandbox();
    expect(sandbox, true);
    expect(log, <Matcher>[
      isMethodCall(
        'isSandbox',
        arguments: null,
      ),
    ]);
  });

  test('isSandbox: has no value', () async {
    expect(
      () async {
        await platform.isSandbox();
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isSandbox',
        arguments: null,
      ),
    ]);
  });

  test('isDeepLinkingEnabled: has value', () async {
    _setMethodCallReturnData(data: () => true);

    final deepLinkingEnabled = await platform.isDeepLinkingEnabled();
    expect(deepLinkingEnabled, true);
    expect(log, <Matcher>[
      isMethodCall(
        'isDeepLinkingEnabled',
        arguments: null,
      ),
    ]);
  });

  test('isDeepLinkingEnabled: has no value', () async {
    expect(
      () async {
        await platform.isDeepLinkingEnabled();
      },
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isDeepLinkingEnabled',
        arguments: null,
      ),
    ]);
  });
}
