import 'dart:async';
import 'dart:io';

import 'package:data/kevin/api/kevin_api_client.dart';
import 'package:data/kevin/repository/network_kevin_repository.dart';
import 'package:data/payments/api/payments_data_api_client.dart';
import 'package:data/payments/repository/network_payments_data_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/country/country_helper.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/analytics/bloc_error_observer.dart';
import 'package:kevin_flutter_example/app/widget/app.dart';
import 'package:kevin_flutter_example/country/local_resources_country_helper.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

const _defaultTimeOutDuration = 120000;
const _kevinApiUrl = 'https://api.getkevin.eu/demo/';
const _kevinMobileDemoApiUrl = 'https://mobile-demo.kevin.eu/api/v1/';

// TODO: Rework after plugin supports specific ios/android callbacks
const _kevinPaymentsCallbackUrlAndroid = 'kevin://redirect.payment';
const _kevinPaymentsCallbackUrlIos = 'https://redirect.kevin.eu/payment.html';

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

    await _initKevinSdk();

    final kevinApiClient = await _httpClient(
      baseUrl: _kevinApiUrl,
      enableLogging: true,
    );
    final kevinDemoApiClient = await _httpClient(
      baseUrl: _kevinMobileDemoApiUrl,
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
            create: (context) => KevinApiClient(dio: kevinDemoApiClient),
          ),
          RepositoryProvider<KevinRepository>(
            create: (context) =>
                NetworkKevinRepository(apiClient: context.read()),
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

Future<void> _initKevinSdk() async {
  // TODO: Rework after plugin supports specific ios/android callbacks
  final callbackUrl = Platform.isIOS
      ? _kevinPaymentsCallbackUrlIos
      : _kevinPaymentsCallbackUrlAndroid;

  await Kevin.setDeepLinkingEnabled(true);
  await KevinPayments.setPaymentsConfiguration(
    KevinPaymentsConfiguration(callbackUrl: callbackUrl),
  );
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
