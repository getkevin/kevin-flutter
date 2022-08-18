import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kevin_flutter_platform_interface.dart';

class MethodChannelKevinFlutter extends KevinFlutterPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('kevin_flutter_core');

  @override
  Future<void> setLocale(String languageCode) async {
    await methodChannel.invokeMethod(_Methods.setLocale, {
      _Arguments.languageCode: languageCode,
    });
  }

  @override
  Future<void> setTheme() async {
    await methodChannel.invokeMethod(_Methods.setTheme);
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
}

class _Methods {
  static const setLocale = 'setLocale';
  static const setTheme = 'setTheme';
  static const setSandbox = 'setSandbox';
  static const setDeepLinkingEnabled = 'setDeepLinkingEnabled';
}

class _Arguments {
  static const languageCode = 'languageCode';
  static const sandbox = 'sandbox';
  static const deepLinkingEnabled = 'deepLinkingEnabled';
}

