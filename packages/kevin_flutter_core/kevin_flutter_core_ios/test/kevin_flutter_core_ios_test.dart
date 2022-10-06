import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core_ios/kevin_flutter_core_ios.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('kevin_flutter_core_ios');
  final log = <MethodCall>[];

  final platform = KevinFlutterCoreIos();

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
    KevinFlutterCoreIos.registerWith();
    expect(
      KevinFlutterCorePlatformInterface.instance,
      isA<KevinFlutterCoreIos>(),
    );
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
    _setMethodCallReturnData(data: () => true);

    final themeIos = KevinThemeIos(
      insets: const KevinInsets(left: 4, top: 4, right: 4, bottom: 4),
      generalStyle: const KevinGeneralStyle(
        primaryBackgroundColor: Colors.blue,
        primaryTextColor: Colors.black,
        secondaryTextColor: Colors.blue,
        actionTextColor: Colors.black,
        primaryFont: KevinUiFont(
          size: 12,
          weight: KevinUiFontWeight.medium,
        ),
        secondaryFont: KevinUiFont(size: 14, weight: KevinUiFontWeight.black),
      ),
      navigationBarStyle: KevinNavigationBarStyle(
        titleColor: Colors.black,
        tintColor: Colors.blue,
        backgroundColorLightMode: Colors.black,
        backgroundColorDarkMode: Colors.blue,
        backButtonImage: Uint8List.fromList([0, 1, 2]),
        closeButtonImage: Uint8List.fromList([2, 1, 0]),
      ),
      sheetPresentationStyle: const KevinSheetPresentationStyle(
        dragIndicatorTintColor: Colors.black,
        backgroundColor: Colors.blue,
        titleLabelFont:
            KevinUiFont(size: 10, weight: KevinUiFontWeight.ultraLight),
        cornerRadius: 10,
      ),
      sectionStyle: const KevinSectionStyle(
        titleLabelFont: KevinUiFont(size: 16, weight: KevinUiFontWeight.black),
      ),
      gridTableStyle: const KevinGridTableStyle(
        cellBackgroundColor: Colors.black,
        cellSelectedBackgroundColor: Colors.blue,
        cellCornerRadius: 16,
      ),
      listTableStyle: KevinListTableStyle(
        cornerRadius: 10,
        isOccupyingFullWidth: false,
        cellBackgroundColor: Colors.black,
        cellSelectedBackgroundColor: Colors.blue,
        titleLabelFont:
            const KevinUiFont(size: 10, weight: KevinUiFontWeight.bold),
        chevronImage: Uint8List.fromList([0, 1, 2]),
      ),
      navigationLinkStyle: KevinNavigationLinkStyle(
        backgroundColor: Colors.black,
        titleLabelFont:
            const KevinUiFont(size: 8, weight: KevinUiFontWeight.semibold),
        selectedBackgroundColor: Colors.black,
        cornerRadius: 6,
        borderWidth: 10,
        borderColor: Colors.blue,
        chevronImage: Uint8List.fromList([0, 1, 2]),
      ),
      mainButtonStyle: const KevinButtonStyle(
        width: 2,
        height: 2,
        backgroundColor: Colors.black,
        titleLabelTextColor: Colors.blue,
        titleLabelFont: KevinUiFont(size: 2, weight: KevinUiFontWeight.heavy),
        cornerRadius: 2,
        shadowRadius: 2,
        shadowOpacity: 2,
        shadowOffset: KevinSize(width: 4, height: 4),
        shadowColor: Colors.black,
      ),
      negativeButtonStyle: const KevinButtonStyle(
        width: 2,
        height: 2,
        backgroundColor: Colors.black,
        titleLabelTextColor: Colors.blue,
        titleLabelFont: KevinUiFont(size: 2, weight: KevinUiFontWeight.heavy),
        cornerRadius: 2,
        shadowRadius: 2,
        shadowOpacity: 2,
        shadowOffset: KevinSize(width: 4, height: 4),
        shadowColor: Colors.black,
      ),
      textFieldStyle: const KevinTextFieldStyle(
        textColor: Colors.black,
        font: KevinUiFont(size: 2, weight: KevinUiFontWeight.thin),
        cornerRadius: 2,
        backgroundColor: Colors.blue,
        borderWidth: 2,
        borderColor: Colors.blue,
        errorBorderColor: Colors.red,
        errorMessageFont: KevinUiFont(size: 10, weight: KevinUiFontWeight.thin),
      ),
      emptyStateStyle: const KevinEmptyStateStyle(
        titleTextColor: Colors.black,
        titleFont: KevinUiFont(size: 2, weight: KevinUiFontWeight.black),
        subtitleTextColor: Colors.blue,
        subtitleFont: KevinUiFont(size: 4, weight: KevinUiFontWeight.medium),
        cornerRadius: 2,
        iconTintColor: Colors.blue,
      ),
    );

    final result = await platform.setTheme(iosTheme: themeIos);
    expect(result, true);
    expect(log, <Matcher>[
      isMethodCall(
        'setTheme',
        arguments: <String, dynamic>{'theme': themeIos.toMap()},
      )
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
    _setMethodCallReturnData(data: () => 'en');

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
    _setMethodCallReturnData(data: () => true);

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
      throwsA(isA<TypeError>()),
    );
    expect(log, <Matcher>[
      isMethodCall(
        'isSandbox',
        arguments: null,
      )
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
      )
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
      )
    ]);
  });
}
