import 'package:domain/accounts/model/linked_account.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/accounts/model/linking_session.dart';
import 'package:quiver/core.dart';

class AccountsState extends Equatable {
  final List<LinkedAccount> accounts;

  final Optional<LinkingSession> initializeLinkingResult;
  final bool initializeLinkingLoading;

  final Optional<Exception> generalError;

  const AccountsState({
    required this.accounts,
    required this.initializeLinkingResult,
    required this.initializeLinkingLoading,
    required this.generalError,
  });

  AccountsState copyWith({
    List<LinkedAccount>? accounts,
    Optional<LinkingSession>? initializeLinkingResult,
    bool? initializeLinkingLoading,
    Optional<Exception>? generalError,
  }) {
    return AccountsState(
      accounts: accounts ?? this.accounts,
      initializeLinkingResult:
          initializeLinkingResult ?? this.initializeLinkingResult,
      initializeLinkingLoading:
          initializeLinkingLoading ?? this.initializeLinkingLoading,
      generalError: generalError ?? this.generalError,
    );
  }

  @override
  List<Object?> get props => [
        accounts,
        initializeLinkingResult,
        initializeLinkingLoading,
        generalError,
      ];
}
