import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinAccountsConfiguration {
  final KevinCallbackUrl callbackUrl;
  final bool showUnsupportedBanks;

  const KevinAccountsConfiguration({
    required this.callbackUrl,
    this.showUnsupportedBanks = false,
  });
}
