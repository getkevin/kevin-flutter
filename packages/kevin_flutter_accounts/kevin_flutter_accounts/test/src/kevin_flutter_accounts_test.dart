import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';
import 'package:kevin_flutter_accounts_platform_interface/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

import '../mocks/mock_kevin_flutter_accounts_platform.dart';

void main() {
  setUp(() {
    KevinFlutterAccountsPlatformInterface.instance =
        MockKevinFlutterAccountsPlatform();
  });

  test('setAccountsConfiguration/get config data', () async {
    await KevinAccounts.setAccountsConfiguration(
      const KevinAccountsConfiguration(
        callbackUrl: KevinCallbackUrl(android: 'android', ios: 'ios'),
        showUnsupportedBanks: true,
      ),
    );
    final callbackUrl = await KevinAccounts.getCallbackUrl();
    final isShowUnsupportedBanks = await KevinAccounts.isShowUnsupportedBanks();

    expect(callbackUrl, 'android');
    expect(isShowUnsupportedBanks, true);
  });

  test('startAccountLinking', () async {
    final result = await KevinAccounts.startAccountLinking(
      const KevinAccountSessionConfiguration(state: 'state'),
    );

    expect(result, isA<KevinSessionResultCancelled>());
  });
}
