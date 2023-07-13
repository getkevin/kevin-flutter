import 'package:kevin_flutter_accounts_platform_interface/src/model/kevin_bank.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinSessionResultLinkingSuccess extends KevinSessionResult {
  final KevinBank? bank;
  final String authorizationCode;

  const KevinSessionResultLinkingSuccess({
    required this.bank,
    required this.authorizationCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'bank': bank?.toMap(),
      'authorizationCode': authorizationCode,
    };
  }

  factory KevinSessionResultLinkingSuccess.fromMap(Map<String, dynamic> map) {
    return KevinSessionResultLinkingSuccess(
      bank: map['bank'] == null
          ? null
          : KevinBank.fromMap(map['bank'] as Map<String, dynamic>),
      authorizationCode: map['authorizationCode'] as String,
    );
  }
}
