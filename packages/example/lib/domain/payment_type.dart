enum PaymentType {
  bank,
  card,
}

extension PaymentTypeExtension on PaymentType {
  String getTabName() {
    switch (this) {
      case PaymentType.bank:
        return 'Bank payment';
      case PaymentType.card:
        return 'Card payment';
    }
  }
}
