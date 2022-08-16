import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kevin_flutter_platform_interface.dart';

class MethodChannelKevinFlutter implements KevinFlutterPlatform {
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

  @override
  Future<String?> getLocale() async {
    return await methodChannel.invokeMethod(_Methods.getLocale);
  }

  @override
  Future<bool> isSandbox() async {
    return await methodChannel.invokeMethod(_Methods.isSandbox);
  }

  @override
  Future<bool> isDeepLinkingEnabled() async {
    return await methodChannel.invokeMethod(_Methods.isDeepLinkingEnabled);
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
  static const sandbox = 'sandbox';
  static const deepLinkingEnabled = 'deepLinkingEnabled';
}
