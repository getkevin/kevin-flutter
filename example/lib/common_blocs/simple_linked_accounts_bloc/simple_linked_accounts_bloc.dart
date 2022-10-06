import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/simple_linked_accounts_bloc/simple_linked_accounts_event.dart';
import 'package:kevin_flutter_example/common_blocs/simple_linked_accounts_bloc/simple_linked_accounts_state.dart';

class SimpleLinkedAccountsBloc
    extends Bloc<SimpleLinkedAccountsEvent, SimpleLinkedAccountsState> {
  final AccountsRepository _accountsRepository;

  SimpleLinkedAccountsBloc({
    required AccountsRepository accountsRepository,
  })  : _accountsRepository = accountsRepository,
        super(const SimpleLinkedAccountsState(accounts: [])) {
    on<LoadLinkedAccountsEvent>(
      _onObserveLinkedAccountsEvent,
      transformer: sequential(),
    );
  }

  Future<void> _onObserveLinkedAccountsEvent(
    LoadLinkedAccountsEvent event,
    Emitter<SimpleLinkedAccountsState> emitter,
  ) async {
    final accounts = await _accountsRepository.getLinkedAccounts();
    emitter(state.copyWith(accounts: accounts));
  }
}
