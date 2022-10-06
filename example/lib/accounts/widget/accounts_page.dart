import 'package:flutter/cupertino.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('ACCOUNTS'),
    );
  }
}
