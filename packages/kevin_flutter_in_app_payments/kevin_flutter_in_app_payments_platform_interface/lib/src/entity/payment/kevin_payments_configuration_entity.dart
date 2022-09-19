import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payments_configuration.dart';

part 'kevin_payments_configuration_entity_json.dart';

class KevinPaymentsConfigurationEntity {
  final String callbackUrl;

  const KevinPaymentsConfigurationEntity({
    required this.callbackUrl,
  });

  factory KevinPaymentsConfigurationEntity.fromModel(
    KevinPaymentsConfiguration model,
  ) =>
      KevinPaymentsConfigurationEntity(callbackUrl: model.callbackUrl);

  Map<String, dynamic> toJson() => _toJson(this);
}
