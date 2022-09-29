enum AuthScope {
  payments('payments'),
  accountsBasic('accounts_basic');

  final String key;

  const AuthScope(this.key);
}
