import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/kevin_flutter_payments_method_channel.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payments_configuration.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of kevin_flutter_in_app_payments must implement.
///
/// Platform implementations should extend this class rather than implement it as `kevin_flutter_in_app_payments`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [KevinFlutterPaymentsMethodChannel] methods.
abstract class KevinFlutterPaymentsPlatformInterface extends PlatformInterface {
  KevinFlutterPaymentsPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static KevinFlutterPaymentsPlatformInterface _instance =
      KevinFlutterPaymentsMethodChannel();

  /// The default instance of [KevinFlutterPaymentsPlatformInterface] to use.
  ///
  /// Defaults to [KevinFlutterPaymentsMethodChannel].
  static KevinFlutterPaymentsPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinFlutterPaymentsPlatformInterface] when
  /// they register themselves.
  static set instance(KevinFlutterPaymentsPlatformInterface instance) {
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
