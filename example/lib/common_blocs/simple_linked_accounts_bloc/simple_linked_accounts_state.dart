import 'package:domain/accounts/model/linked_account.dart';
import 'package:equatable/equatable.dart';

class SimpleLinkedAccountsState extends Equatable {
  final List<LinkedAccount> accounts;

  const SimpleLinkedAccountsState({
    required this.accounts,
  });

  SimpleLinkedAccountsState copyWith({
    List<LinkedAccount>? accounts,
  }) {
    return SimpleLinkedAccountsState(
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [accounts];
}
