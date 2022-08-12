import 'package:kevin_flutter/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter/src/model/kevin_bank.dart';

abstract class KevinSessionResult {
  const KevinSessionResult();
}

class KevinSessionResultLinkingSuccess extends KevinSessionResult {
  final KevinBank? bank;
  final String authorizationCode;
  final KevinAccountLinkingType linkingType;

  const KevinSessionResultLinkingSuccess({
    required this.bank,
    required this.authorizationCode,
    required this.linkingType,
  });
}

class KevinSessionResultPaymentSuccess extends KevinSessionResult {
  final String paymentId;

  const KevinSessionResultPaymentSuccess({
    required this.paymentId,
  });
}

class KevinSessionResultGeneralError extends KevinSessionResult {
  final String message;

  const KevinSessionResultGeneralError({
    required this.message,
  });
}

class KevinSessionResultCancelled extends KevinSessionResult {}
