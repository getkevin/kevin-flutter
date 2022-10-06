import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/kevin/model/auth_scope.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';

abstract class AccountsEvent extends Equatable {
  const AccountsEvent();

  @override
  List<Object?> get props => [];
}

class ObserveLinkedAccountsEvent extends AccountsEvent {
  final bool observe;

  const ObserveLinkedAccountsEvent({required this.observe});

  @override
  List<Object?> get props => [observe];
}

class InitializeLinkingEvent extends AccountsEvent {
  final List<AuthScope> authScopes;
  final String redirectUrl;

  const InitializeLinkingEvent({
    required this.authScopes,
    required this.redirectUrl,
  });

  @override
  List<Object?> get props => [authScopes, redirectUrl];
}

class SetLinkingSuccessResultEvent extends AccountsEvent {
  final KevinSessionResultLinkingSuccess result;

  const SetLinkingSuccessResultEvent({
    required this.result,
  });

  @override
  List<Object?> get props => [result];
}

class RemoveLinkedAccountEvent extends AccountsEvent {
  final LinkedAccount account;

  const RemoveLinkedAccountEvent({
    required this.account,
  });

  @override
  List<Object?> get props => [account];
}

class ClearInitializeLinkingResultEvent extends AccountsEvent {
  const ClearInitializeLinkingResultEvent();
}

class ClearGeneralErrorEvent extends AccountsEvent {
  const ClearGeneralErrorEvent();
}
