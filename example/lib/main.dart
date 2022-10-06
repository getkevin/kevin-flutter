import 'dart:async';

import 'package:data/payments/api/payments_data_api_client.dart';
import 'package:data/payments/repository/network_payments_data_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/country/country_helper.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/analytics/bloc_error_observer.dart';
import 'package:kevin_flutter_example/app/widget/app.dart';
import 'package:kevin_flutter_example/country/local_resources_country_helper.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';

const _defaultTimeOutDuration = 120000;
const _kevinApiUrl = 'https://api.getkevin.eu/demo/';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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

    final kevinApiClient = await _httpClient(
      baseUrl: _kevinApiUrl,
      enableLogging: true,
    );

    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => ApiErrorMapper()),
          RepositoryProvider<CountryHelper>(
            create: (context) => LocalResourcesCountryHelper(),
          ),
          RepositoryProvider(create: (context) => AmountValidator()),
          RepositoryProvider(create: (context) => EmailValidator()),
          RepositoryProvider(
            create: (context) => PaymentsDataApiClient(dio: kevinApiClient),
          ),
          RepositoryProvider<PaymentsDataRepository>(
            create: (context) =>
                NetworkPaymentsDataRepository(apiClient: context.read()),
          ),
          RepositoryProvider(
            create: (context) => GetSupportedCountriesUseCase(
              repository: context.read(),
              countryHelper: context.read(),
            ),
          ),
          RepositoryProvider(
            create: (context) => GetCreditorsUseCase(
              repository: context.read(),
            ),
          ),
        ],
        child: const App(),
      ),
    );
  }, (error, stack) {
    Fimber.e('main() error', ex: error, stacktrace: stack);
  });
}

Future<Dio> _httpClient({
  required String baseUrl,
  bool enableLogging = false,
}) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _defaultTimeOutDuration,
      receiveTimeout: _defaultTimeOutDuration,
      sendTimeout: _defaultTimeOutDuration,
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ),
  );

  if (enableLogging) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  return dio;
}
