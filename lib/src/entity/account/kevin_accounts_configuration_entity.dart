import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter/kevin_flutter.dart';

part 'kevin_accounts_configuration_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
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
