import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter/kevin_flutter.dart';

part 'kevin_payments_configuration_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class KevinPaymentsConfigurationEntity {
  final String callbackUrl;

  const KevinPaymentsConfigurationEntity({
    required this.callbackUrl,
  });

  factory KevinPaymentsConfigurationEntity.fromModel(
    KevinPaymentsConfiguration model,
  ) =>
      KevinPaymentsConfigurationEntity(callbackUrl: model.callbackUrl);

  Map<String, dynamic> toJson() =>
      _$KevinPaymentsConfigurationEntityToJson(this);
}
