import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments/src/entity/payment/kevin_payment_session_configuration_entity.dart';
import 'package:kevin_flutter_in_app_payments/src/entity/payment/kevin_payments_configuration_entity.dart';
import 'package:kevin_flutter_in_app_payments/src/entity/result/kevin_session_result_payment_success_entity.dart';
import 'package:kevin_flutter_in_app_payments/src/kevin_flutter_payments_platform_interface.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payments_configuration.dart';

class KevinFlutterPaymentsMethodChannel
    extends KevinFlutterPaymentsPlatformInterface {
  @visibleForTesting
  final methodChannel = const MethodChannel('kevin_flutter_payments');

  @override
  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) async {
    final data =
        KevinPaymentsConfigurationEntity.fromModel(configuration).toJson();

    await methodChannel.invokeMethod(
      _Methods.setPaymentsConfiguration,
      data,
    );
  }

  @override
  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) async {
    try {
      final data =
          KevinPaymentSessionConfigurationEntity.fromModel(configuration)
              .toJson();

      final resultJsonString = await methodChannel.invokeMethod<String>(
        _Methods.startPayment,
        data,
      );

      final result = jsonDecode(resultJsonString!);

      return KevinSessionResultPaymentSuccessEntity.fromJson(result).toModel();
    } on PlatformException catch (error) {
      final parsedError = _parseError(error);

      if (parsedError != null) {
        return parsedError;
      }

      rethrow;
    }
  }

  @override
  Future<String> getCallbackUrl() async {
    final callbackUrl =
        await methodChannel.invokeMethod<String>(_Methods.getCallbackUrl);
    return callbackUrl!;
  }

  KevinSessionResult? _parseError(PlatformException error) {
    switch (error.code) {
      case _Errors.cancelled:
        return KevinSessionResultCancelled();
      case _Errors.general:
        return KevinSessionResultGeneralError(
          message: error.message,
        );
      default:
        return null;
    }
  }
}

class _Methods {
  static const setPaymentsConfiguration = 'setPaymentsConfiguration';
  static const startPayment = 'startPayment';
  static const getCallbackUrl = 'getCallbackUrl';
}

class _Errors {
  static const general = 'general';
  static const cancelled = 'cancelled';
}
