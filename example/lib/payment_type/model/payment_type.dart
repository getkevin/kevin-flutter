import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

enum PaymentType {
  bank,
  linked,
  card;

  KevinPaymentType get toKevinPaymentType {
    switch (this) {
      case PaymentType.bank:
      case PaymentType.linked:
        return KevinPaymentType.bank;
      case PaymentType.card:
        return KevinPaymentType.card;
    }
  }
}
