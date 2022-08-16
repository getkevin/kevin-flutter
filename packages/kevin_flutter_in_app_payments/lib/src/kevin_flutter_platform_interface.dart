import 'package:kevin_flutter_core/kevin.dart';
import 'package:kevin_flutter_in_app_payments/src/kevin_flutter_method_channel.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payments_configuration.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KevinPaymentsFlutterPlatform extends PlatformInterface {
  KevinPaymentsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static KevinPaymentsFlutterPlatform _instance =
      MethodChannelKevinPaymentsFlutter();

  /// The default instance of [KevinPaymentsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelKevinFlutter].
  static KevinPaymentsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinPaymentsFlutterPlatform] when
  /// they register themselves.
  static set instance(KevinPaymentsFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) {
    throw UnimplementedError('Not implemented.');
  }

  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) {
    throw UnimplementedError('Not implemented.');
  }

  Future<String> getCallbackUrl() {
    throw UnimplementedError('Not implemented.');
  }
}
