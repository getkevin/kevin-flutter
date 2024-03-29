import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_accounts_platform_interface/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

@visibleForTesting
const methodChannel = MethodChannel('kevin_flutter_accounts_ios');

class KevinFlutterAccountsIos extends KevinFlutterAccountsPlatformInterface {
  static void registerWith() {
    KevinFlutterAccountsPlatformInterface.instance = KevinFlutterAccountsIos();
  }

  @override
  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) async {
    await methodChannel.invokeMethod(
      KevinFlutterAccountsMethods.setAccountsConfiguration,
      {
        'callbackUrl': configuration.callbackUrl.ios,
        'showUnsupportedBanks': configuration.showUnsupportedBanks,
      },
    );
  }

  @override
  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) async {
    try {
      final resultJsonString = await methodChannel.invokeMethod<String>(
        KevinFlutterAccountsMethods.startAccountLinking,
        configuration.toMap(),
      );

      final result = jsonDecode(resultJsonString!);

      return KevinSessionResultLinkingSuccess.fromMap(result);
    } on PlatformException catch (error) {
      final parsedError = KevinErrorHelper.parseError(error);

      if (parsedError != null) {
        return parsedError;
      }

      rethrow;
    }
  }

  @override
  Future<String> getCallbackUrl() async {
    final callbackUrl = await methodChannel
        .invokeMethod<String>(KevinFlutterAccountsMethods.getCallbackUrl);
    return callbackUrl!;
  }

  @override
  Future<bool> isShowUnsupportedBanks() async {
    final isShowUnsupportedBanks = await methodChannel
        .invokeMethod<bool>(KevinFlutterAccountsMethods.isShowUnsupportedBanks);
    return isShowUnsupportedBanks!;
  }
}
