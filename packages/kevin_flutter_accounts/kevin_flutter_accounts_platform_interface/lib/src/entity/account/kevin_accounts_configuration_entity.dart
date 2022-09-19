import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_accounts_configuration.dart';

part 'kevin_accounts_configuration_entity_json.dart';

class KevinAccountsConfigurationEntity {
  final String callbackUrl;
  final bool showUnsupportedBanks;

  const KevinAccountsConfigurationEntity({
    required this.callbackUrl,
    this.showUnsupportedBanks = false,
  });

  factory KevinAccountsConfigurationEntity.fromModel(
    KevinAccountsConfiguration model,
  ) =>
      KevinAccountsConfigurationEntity(
        callbackUrl: model.callbackUrl,
        showUnsupportedBanks: model.showUnsupportedBanks,
      );

  Map<String, dynamic> toJson() =>
      _$KevinAccountsConfigurationEntityToJson(this);
}
