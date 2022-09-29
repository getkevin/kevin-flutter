import 'package:domain/accounts/model/linked_account.dart';

abstract class AccountsRepository {
  Stream<List<LinkedAccount>> getLinkedAccountsStream();

  Future<List<LinkedAccount>> getLinkedAccounts();

  Future<List<LinkedAccount>> getLinkedAccountsByBankId(String bankId);

  Future<LinkedAccount?> getById(int id);

  Future<void> insert({required LinkedAccount account, bool replace = true});

  Future<void> deleteById(int id);

  Future<void> deleteByBankId(String bankId);
}
