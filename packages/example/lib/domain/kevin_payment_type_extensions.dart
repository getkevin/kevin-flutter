import 'package:kevin_flutter_in_app_payments/kevin_payments.dart';

extension PaymentTypeExtension on KevinPaymentType {
  String getTabName() {
    switch (this) {
      case KevinPaymentType.bank:
        return 'Bank payment';
      case KevinPaymentType.card:
        return 'Card payment';
    }
  }
}
