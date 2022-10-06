class KevinCallbackUrl {
  final String android;
  final String ios;

  const KevinCallbackUrl({
    required this.android,
    required this.ios,
  });

  KevinCallbackUrl.single({required String callbackUrl})
      : android = callbackUrl,
        ios = callbackUrl;
}
