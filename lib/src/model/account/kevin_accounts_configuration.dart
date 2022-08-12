class KevinAccountsConfiguration {
  final String callbackUrl;
  final bool showUnsupportedBanks;

  const KevinAccountsConfiguration({
    required this.callbackUrl,
    this.showUnsupportedBanks = false,
  });
}
