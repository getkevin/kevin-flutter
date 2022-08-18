import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_accounts/src/entity/account/kevin_account_session_configuration_entity.dart';
import 'package:kevin_flutter_accounts/src/entity/account/kevin_accounts_configuration_entity.dart';
import 'package:kevin_flutter_accounts/src/entity/result/kevin_session_result_linking_success_entity.dart';
import 'package:kevin_flutter_accounts/src/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter_core/kevin.dart';

import 'kevin_flutter_platform_interface.dart';

class KevinFlutterAccountsMethodChannel extends KevinFlutterAccountsPlatformInterface {
  @visibleForTesting
  final methodChannel = const MethodChannel('kevin_flutter_accounts');

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
  Future<String> getCallbackUrl() async {
    final callbackUrl =
        await methodChannel.invokeMethod<String>(_Methods.getCallbackUrl);
    return callbackUrl!;
  }

  @override
  Future<bool> isShowUnsupportedBanks() async {
    final isShowUnsupportedBanks =
        await methodChannel.invokeMethod<bool>(_Methods.isShowUnsupportedBanks);
    return isShowUnsupportedBanks!;
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
  static const setAccountsConfiguration = 'setAccountsConfiguration';
  static const startAccountLinking = 'startAccountLinking';
  static const getCallbackUrl = 'getCallbackUrl';
  static const isShowUnsupportedBanks = 'isShowUnsupportedBanks';
}

class _Errors {
  static const general = 'general';
  static const cancelled = 'cancelled';
}
