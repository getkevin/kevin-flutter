import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/payment/kevin_payment_type.dart';

class KevinPaymentSessionConfiguration {
  final String paymentId;
  final KevinPaymentType paymentType;
  final KevinCountry? preselectedCountry;
  final bool disableCountrySelection;
  final List<KevinCountry> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;
  final bool skipAuthentication;

  const KevinPaymentSessionConfiguration({
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

  Map<String, dynamic> toMap() {
    return {
      'paymentId': paymentId,
      'paymentType': paymentType.name,
      'preselectedCountry': preselectedCountry?.iso,
      'disableCountrySelection': disableCountrySelection,
      'countryFilter': countryFilter.map((c) => c.iso).toList(),
      'bankFilter': bankFilter,
      'preselectedBank': preselectedBank,
      'skipBankSelection': skipBankSelection,
      'skipAuthentication': skipAuthentication,
    };
  }
}
