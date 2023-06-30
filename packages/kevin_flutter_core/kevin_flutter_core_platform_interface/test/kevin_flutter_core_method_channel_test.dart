import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core_platform_interface/src/kevin_flutter_core_method_channel.dart';
import 'package:kevin_flutter_core_platform_interface/src/kevin_flutter_core_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_core');
  final log = <MethodCall>[];

  final platform = KevinFlutterCoreMethodChannel();

  final initialInstance = KevinFlutterCorePlatformInterface.instance;

  void _setMethodCallReturnData({dynamic Function()? data}) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        log.add(methodCall);
        return data?.call();
      },
    );
  }

  setUp(() {
    _setMethodCallReturnData();
  });

  tearDown(() {
    log.clear();
  });

  test('$KevinFlutterCoreMethodChannel() is the default instance', () {
    expect(initialInstance, isInstanceOf<KevinFlutterCoreMethodChannel>());
  });

  test('Cannot be implemented with `implements`', () {
    expect(
      () {
        KevinFlutterCorePlatformInterface.instance =
            ImplementsKevinFlutterCorePlatform();
      },
      throwsA(anything),
    );
  });

  test('Can be mocked with `implements`', () {
    final mock = KevinFlutterCorePlatformMock();
    KevinFlutterCorePlatformInterface.instance = mock;
  });

  test('Can be extended', () {
    KevinFlutterCorePlatformInterface.instance =
        ExtendsKevinFlutterCorePlatform();
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
    expect(
      () async {
        await platform.setTheme();
      },
      throwsA(isA<UnimplementedError>()),
    );
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

class KevinFlutterCorePlatformMock
    with MockPlatformInterfaceMixin
    implements KevinFlutterCorePlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ImplementsKevinFlutterCorePlatform
    implements KevinFlutterCorePlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ExtendsKevinFlutterCorePlatform
    extends KevinFlutterCorePlatformInterface {}
