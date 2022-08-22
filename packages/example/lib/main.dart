import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_accounts/kevin_accounts.dart';
import 'package:kevin_flutter_core/kevin.dart';
import 'package:kevin_flutter_example/injectable.dart';
import 'package:kevin_flutter_example/presentation/app_widget.dart';
import 'package:kevin_flutter_in_app_payments/kevin_payments.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  // Kevin plugin initial configuration
  await Kevin.instance.setLocale('en');
  await KevinAccounts.instance.setAccountsConfiguration(
    const KevinAccountsConfiguration(
      callbackUrl: 'https://redirect.kevin.eu/authorization.html',
    ),
  );
  await KevinPayments.instance.setPaymentsConfiguration(
    const KevinPaymentsConfiguration(
      callbackUrl: 'https://redirect.kevin.eu/payment.html',
    ),
  );

  runApp(const AppWidget());
}
