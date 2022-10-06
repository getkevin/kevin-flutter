import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/kevin_flutter_in_app_payments_platform_interface.dart';

@visibleForTesting
const methodChannel = MethodChannel('kevin_flutter_payments_ios');

class KevinFlutterPaymentsIos extends KevinFlutterPaymentsPlatformInterface {
  static void registerWith() {
    KevinFlutterPaymentsPlatformInterface.instance = KevinFlutterPaymentsIos();
  }

  @override
  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) async {
    await methodChannel.invokeMethod(
      KevinFlutterPaymentsMethods.setPaymentsConfiguration,
      {
        'callbackUrl': configuration.callbackUrl.ios,
      },
    );
  }

  @override
  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) async {
    try {
      final resultJsonString = await methodChannel.invokeMethod<String>(
        KevinFlutterPaymentsMethods.startPayment,
        configuration.toMap(),
      );

      final result = jsonDecode(resultJsonString!);

      return KevinSessionResultPaymentSuccess.fromMap(result);
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
        .invokeMethod<String>(KevinFlutterPaymentsMethods.getCallbackUrl);
    return callbackUrl!;
  }
}
