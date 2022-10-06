import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts_platform_interface/kevin_flutter_accounts_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKevinFlutterAccountsPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements KevinFlutterAccountsPlatformInterface {
  KevinCallbackUrl? _callbackUrl;
  bool? _isShowUnsupportedBanks;

  @override
  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) async {
    _callbackUrl = configuration.callbackUrl;
    _isShowUnsupportedBanks = configuration.showUnsupportedBanks;
  }

  @override
  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) async {
    return KevinSessionResultCancelled();
  }

  @override
  Future<String> getCallbackUrl() async {
    return _callbackUrl!.android;
  }

  @override
  Future<bool> isShowUnsupportedBanks() async {
    return _isShowUnsupportedBanks!;
  }
}
