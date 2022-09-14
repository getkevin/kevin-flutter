import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/injectable.dart';
import 'package:kevin_flutter_example/presentation/app_widget.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  // Kevin plugin initial configuration
  await _setTheme();
  await Kevin.setLocale('en');
  await KevinAccounts.setAccountsConfiguration(
    const KevinAccountsConfiguration(
      callbackUrl: 'https://redirect.kevin.eu/authorization.html',
    ),
  );
  await KevinPayments.setPaymentsConfiguration(
    const KevinPaymentsConfiguration(
      callbackUrl: 'https://redirect.kevin.eu/payment.html',
    ),
  );

  runApp(const AppWidget());
}

Future<void> _setTheme() async {
  const androidTheme = KevinThemeAndroid('TestTheme');
  const iosTheme = KevinThemeIos();

  await Kevin.setTheme(
    androidTheme: androidTheme,
    iosTheme: iosTheme,
  );
}
