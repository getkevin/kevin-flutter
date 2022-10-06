import 'package:flutter/services.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

/// Used by kevin. accounts/in_app_payments flutter plugins
class KevinErrorHelper {
  static KevinSessionResult? parseError(PlatformException error) {
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

class _Errors {
  static const general = 'general';
  static const cancelled = 'cancelled';
}
