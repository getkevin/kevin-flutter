import 'package:domain/payments/model/payment_type.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

extension PaymentTypeExtensions on PaymentType {
  KevinPaymentType get toKevinPaymentType {
    switch (this) {
      case PaymentType.bank:
      case PaymentType.linked:
        return KevinPaymentType.bank;
    }
  }
}
