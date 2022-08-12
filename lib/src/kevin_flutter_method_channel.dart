import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter/src/entity/account/kevin_account_session_configuration_entity.dart';
import 'package:kevin_flutter/src/entity/account/kevin_accounts_configuration_entity.dart';
import 'package:kevin_flutter/src/entity/payment/kevin_payment_session_configuration_entity.dart';
import 'package:kevin_flutter/src/entity/payment/kevin_payments_configuration_entity.dart';
import 'package:kevin_flutter/src/entity/result/kevin_session_result_linking_success_entity.dart';
import 'package:kevin_flutter/src/entity/result/kevin_session_result_payment_success_entity.dart';
import 'package:kevin_flutter/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter/src/model/kevin_session_result.dart';
import 'package:kevin_flutter/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter/src/model/payment/kevin_payments_configuration.dart';

import 'kevin_flutter_platform_interface.dart';

class MethodChannelKevinFlutter extends KevinFlutterPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('kevin_flutter');

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
  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) async {
    final data =
        KevinAccountsConfigurationEntity.fromModel(configuration).toJson();

    await methodChannel.invokeMethod(
      _Methods.setAccountsConfiguration,
      data,
    );
  }

  @override
  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) async {
    try {
      final data =
          KevinAccountSessionConfigurationEntity.fromModel(configuration)
              .toJson();

      final resultJsonString = await methodChannel.invokeMethod<String>(
        _Methods.startAccountLinking,
        data,
      );

      final result = jsonDecode(resultJsonString!);

      return KevinSessionResultLinkingSuccessEntity.fromJson(result).toModel();
    } on PlatformException catch (error) {
      return _parseError(error);
    }
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
      return _parseError(error);
    }
  }

  KevinSessionResult _parseError(PlatformException error) {
    if (error.code == _Errors.cancelled) {
      return KevinSessionResultCancelled();
    }

    return KevinSessionResultGeneralError(
      message: error.message ?? _Errors.general,
    );
  }
}

class _Methods {
  static const setLocale = 'setLocale';
  static const setTheme = 'setTheme';
  static const setSandbox = 'setSandbox';
  static const setDeepLinkingEnabled = 'setDeepLinkingEnabled';
  static const setPaymentsConfiguration = 'setPaymentsConfiguration';
  static const setAccountsConfiguration = 'setAccountsConfiguration';
  static const startAccountLinking = 'startAccountLinking';
  static const startPayment = 'startPayment';
}

class _Arguments {
  static const languageCode = 'languageCode';
  static const sandbox = 'sandbox';
  static const deepLinkingEnabled = 'deepLinkingEnabled';
}

class _Errors {
  static const general = 'general';
  static const cancelled = 'cancelled';
}
