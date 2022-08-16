import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_example/injectable.dart';
import 'package:kevin_flutter_example/presentation/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  runApp(const AppWidget());
}
