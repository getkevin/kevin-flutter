import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_core/src/kevin_flutter_core_platform_interface.dart';
import 'package:kevin_flutter_core/src/model/theme/kevin_theme_android.dart';
import 'package:kevin_flutter_core/src/model/theme/kevin_theme_ios.dart';

class KevinFlutterCoreMethodChannel extends KevinFlutterCorePlatformInterface {
  @visibleForTesting
  final methodChannel = const MethodChannel('kevin_flutter_core');

  @override
  Future<void> setLocale(String languageCode) async {
    await methodChannel.invokeMethod(_Methods.setLocale, {
      _Arguments.languageCode: languageCode,
    });
  }

  @override
  Future<bool> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) async {
    final arguments = <String, String>{};

    if (androidTheme != null) {
      arguments.addAll({_Arguments.themeAndroid: androidTheme.themeName});
    }

    if (iosTheme != null) {
      arguments.addAll({_Arguments.themeIos: 'iosTheme'});
    }

    final themeSet = await methodChannel.invokeMethod<bool>(
      _Methods.setTheme,
      arguments,
    );

    return themeSet!;
  }

  @override
  Future<void> setSandbox(bool sandbox) async {
    await methodChannel.invokeMethod(_Methods.setSandbox, {
      _Arguments.sandbox: sandbox,
    });
  }

  @override
  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) async {
    await methodChannel.invokeMethod(_Methods.setDeepLinkingEnabled, {
      _Arguments.deepLinkingEnabled: deepLinkingEnabled,
    });
  }

  @override
  Future<String?> getLocale() async {
    return methodChannel.invokeMethod<String?>(_Methods.getLocale);
  }

  @override
  Future<bool> isSandbox() async {
    final isSandbox =
        await methodChannel.invokeMethod<bool>(_Methods.isSandbox);
    return isSandbox!;
  }

  @override
  Future<bool> isDeepLinkingEnabled() async {
    final isDeepLinkingEnabled =
        await methodChannel.invokeMethod(_Methods.isDeepLinkingEnabled);
    return isDeepLinkingEnabled!;
  }
}

class _Methods {
  static const setLocale = 'setLocale';
  static const setTheme = 'setTheme';
  static const setSandbox = 'setSandbox';
  static const setDeepLinkingEnabled = 'setDeepLinkingEnabled';
  static const getLocale = 'getLocale';
  static const isSandbox = 'isSandbox';
  static const isDeepLinkingEnabled = 'isDeepLinkingEnabled';
}

class _Arguments {
  static const languageCode = 'languageCode';
  static const themeAndroid = 'themeAndroid';
  static const themeIos = 'themeIos';
  static const sandbox = 'sandbox';
  static const deepLinkingEnabled = 'deepLinkingEnabled';
}
