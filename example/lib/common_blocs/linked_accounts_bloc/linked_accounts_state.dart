import 'package:domain/accounts/model/linked_account.dart';
import 'package:equatable/equatable.dart';

class LinkedAccountsState extends Equatable {
  final List<LinkedAccount> accounts;

  const LinkedAccountsState({
    required this.accounts,
  });

  LinkedAccountsState copyWith({
    List<LinkedAccount>? accounts,
  }) {
    return LinkedAccountsState(
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [accounts];
}
