import 'package:flutter/material.dart';
import 'package:kevin_flutter_accounts/kevin_accounts.dart';
import 'package:kevin_flutter_in_app_payments/kevin_payments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _kevinPayments = KevinPayments();
  final _kevinAccounts = KevinAccounts();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () async {
                  await _kevinAccounts.setAccountsConfiguration(
                    const KevinAccountsConfiguration(
                      callbackUrl: 'callbackUrl',
                    ),
                  );
                },
                child: const Text('SETUP LINKING'),
              ),
              MaterialButton(
                onPressed: () async {
                  await _kevinAccounts.startAccountLinking(
                    const KevinAccountSessionConfiguration(state: 'state'),
                  );
                },
                child: const Text('LINKING'),
              ),
              MaterialButton(
                onPressed: () async {
                  await _kevinPayments.setPaymentsConfiguration(
                    const KevinPaymentsConfiguration(
                      callbackUrl: 'callbackUrl',
                    ),
                  );
                },
                child: const Text('SETUP PAYMENTS'),
              ),
              MaterialButton(
                onPressed: () async {
                  await _kevinPayments.startPayment(
                    const KevinPaymentSessionConfiguration(
                      paymentId: 'paymentId',
                      paymentType: KevinPaymentType.card,
                    ),
                  );
                },
                child: const Text('CARD PAYMENT'),
              ),
              MaterialButton(
                onPressed: () async {
                  await _kevinPayments.startPayment(
                    const KevinPaymentSessionConfiguration(
                      paymentId: 'paymentId',
                    ),
                  );
                },
                child: const Text('BANK PAYMENT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
