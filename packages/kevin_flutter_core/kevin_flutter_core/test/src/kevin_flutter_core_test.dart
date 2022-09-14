import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

import '../mocks/mock_kevin_flutter_core_platform.dart';

void main() {
  setUp(() {
    KevinFlutterCorePlatformInterface.instance = MockKevinFlutterCorePlatform();
  });

  test('setLocale/getLocale', () async {
    await Kevin.setLocale('languageCode');
    final locale = await Kevin.getLocale();
    expect(locale, 'languageCode');
  });

  test('setTheme', () async {
    final themeSet = await Kevin.setTheme();
    expect(themeSet, true);
  });

  test('setSandbox/isSandbox', () async {
    await Kevin.setSandbox(true);
    final isSandbox = await Kevin.isSandbox();
    expect(isSandbox, true);
  });

  test('setDeepLinkingEnabled/isDeepLinkingEnabled', () async {
    await Kevin.setDeepLinkingEnabled(true);
    final isDeepLinkingEnabled = await Kevin.isDeepLinkingEnabled();
    expect(isDeepLinkingEnabled, true);
  });
}
