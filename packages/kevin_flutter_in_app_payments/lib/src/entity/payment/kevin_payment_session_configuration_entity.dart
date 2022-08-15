import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_type.dart';

part 'kevin_payment_session_configuration_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class KevinPaymentSessionConfigurationEntity {
  final String paymentId;
  final KevinPaymentType paymentType;
  final String? preselectedCountry;
  final bool disableCountrySelection;
  final List<String> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;
  final bool skipAuthentication;

  const KevinPaymentSessionConfigurationEntity({
    required this.paymentId,
    this.paymentType = KevinPaymentType.bank,
    this.preselectedCountry,
    this.disableCountrySelection = false,
    this.countryFilter = const [],
    this.bankFilter = const [],
    this.preselectedBank,
    this.skipBankSelection = false,
    this.skipAuthentication = false,
  });

  factory KevinPaymentSessionConfigurationEntity.fromModel(
    KevinPaymentSessionConfiguration model,
  ) =>
      KevinPaymentSessionConfigurationEntity(
        paymentId: model.paymentId,
        paymentType: model.paymentType,
        preselectedCountry: model.preselectedCountry?.iso,
        disableCountrySelection: model.disableCountrySelection,
        countryFilter: model.countryFilter.map((c) => c.iso).toList(),
        bankFilter: model.bankFilter,
        preselectedBank: model.preselectedBank,
        skipBankSelection: model.skipBankSelection,
        skipAuthentication: model.skipAuthentication,
      );

  Map<String, dynamic> toJson() =>
      _$KevinPaymentSessionConfigurationEntityToJson(this);
}
