import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/analytics/bloc_error_observer.dart';
import 'package:kevin_flutter_example/app/widget/app.dart';
import 'package:kevin_flutter_example/country/country_helper.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    EquatableConfig.stringify = true;

    Bloc.observer = BlocErrorObserver();

    Fimber.plantTree(DebugTree());

    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      Fimber.e(
        'FlutterError',
        ex: errorDetails.exception,
        stacktrace: errorDetails.stack,
      );
    };

    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => CountryHelper()),
          RepositoryProvider(create: (context) => AmountValidator()),
          RepositoryProvider(create: (context) => EmailValidator()),
        ],
        child: const App(),
      ),
    );
  }, (error, stack) {
    Fimber.e('main() error', ex: error, stacktrace: stack);
  });
}
