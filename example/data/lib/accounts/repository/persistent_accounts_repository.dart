import 'package:data/accounts/entity/linked_account_entity.dart';
import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synchronized/extension.dart';

typedef LinkedAccountTransformCallback<T> = T Function(
  dynamic,
  LinkedAccountEntity,
);
typedef LinkedAccountFilterCallback = bool Function(
  dynamic,
  LinkedAccountEntity,
);

class PersistentAccountsRepository extends AccountsRepository {
  final Box<LinkedAccountEntity> _accountsBox;

  PersistentAccountsRepository({
    required Box<LinkedAccountEntity> accountsBox,
  }) : _accountsBox = accountsBox;

  @override
  Stream<List<LinkedAccount>> getLinkedAccountsStream() async* {
    yield _getLinkedAccounts();
    yield* _accountsBox.watch().map((_) => _getLinkedAccounts());
  }

  @override
  Future<List<LinkedAccount>> getLinkedAccounts() async {
    return synchronized(() => _getLinkedAccounts());
  }

  @override
  Future<List<LinkedAccount>> getLinkedAccountsByBankId(String bankId) async {
    return synchronized(
      () =>
          _getLinkedAccounts(filter: (_, account) => account.bankId == bankId),
    );
  }

  @override
  Future<LinkedAccount?> getById(int id) async {
    return synchronized(() => _accountsBox.get(id)?.toModel(id: id));
  }

  @override
  Future<void> insert({
    required LinkedAccount account,
    bool replace = true,
  }) async {
    return synchronized(
      () => _insert(
        account: account,
        replace: replace,
      ),
    );
  }

  @override
  Future<void> deleteById(int id) async {
    return synchronized(() async {
      await _accountsBox.delete(id);
    });
  }

  @override
  Future<void> deleteByBankId(String bankId) async {
    return synchronized(() => _deleteByBankId(bankId));
  }

  @override
  Future<void> deleteByBankIdAndInsert({
    required String bankId,
    required LinkedAccount account,
  }) async {
    return synchronized(() async {
      await _deleteByBankId(bankId);
      await _insert(account: account);
    });
  }

  Future<void> _insert({
    required LinkedAccount account,
    bool replace = true,
  }) async {
    final entity = LinkedAccountEntity.fromModel(account);

    if (replace && account.id != -1) {
      await _accountsBox.put(account.id, entity);
      return;
    }

    await _accountsBox.add(entity);
  }

  Future<void> _deleteByBankId(String bankId) async {
    final ids = _getLinkedAccountsData(
      transform: (key, _) => key,
      filter: (_, account) => account.bankId == bankId,
    );

    await _accountsBox.deleteAll(ids);
  }

  List<LinkedAccount> _getLinkedAccounts({
    LinkedAccountFilterCallback? filter,
  }) {
    return _getLinkedAccountsData(
      transform: (key, account) => account.toModel(id: key),
      filter: filter,
    );
  }

  List<T> _getLinkedAccountsData<T>({
    required LinkedAccountTransformCallback transform,
    LinkedAccountFilterCallback? filter,
  }) {
    final result = <T>[];

    final map = _accountsBox.toMap();

    map.forEach((key, value) {
      final include = filter?.call(key, value) ?? true;

      if (include) {
        result.add(transform(key, value));
      }
    });

    return result;
  }
}
