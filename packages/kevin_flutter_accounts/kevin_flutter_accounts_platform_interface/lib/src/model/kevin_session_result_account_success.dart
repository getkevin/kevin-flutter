import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/kevin_bank.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

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
