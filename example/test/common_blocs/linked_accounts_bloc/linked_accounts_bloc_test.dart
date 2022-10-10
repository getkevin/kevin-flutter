import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_event.dart';

import '../../fakes/fake_accounts_repository.dart';
import '../../test_data.dart';

final _linkedAccounts = [
  linkedAccount,
  linkedAccount.copyWith(id: 1),
];

void main() {
  EquatableConfig.stringify = true;

  late FakeAccountsRepository accountsRepository;
  late LinkedAccountsBloc subject;

  setUp(() {
    accountsRepository = FakeAccountsRepository();
    subject = LinkedAccountsBloc(accountsRepository: accountsRepository);
  });

  blocTest(
    'Initial state test',
    build: () => subject,
    verify: (LinkedAccountsBloc bloc) {
      final state = bloc.state;

      expect(state.accounts, []);
    },
  );

  blocTest(
    'Load linked accounts test',
    build: () {
      accountsRepository.setAccounts(
        accounts: _linkedAccounts,
      );
      return subject;
    },
    act: (LinkedAccountsBloc bloc) {
      bloc.add(const LoadLinkedAccountsEvent());
    },
    verify: (LinkedAccountsBloc bloc) {
      final state = bloc.state;

      expect(state.accounts, _linkedAccounts);
    },
  );
}
