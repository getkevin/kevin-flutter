import 'dart:async';

import 'package:data/accounts/entity/linked_account_entity.dart';
import 'package:data/accounts/repository/persistent_accounts_repository.dart';
import 'package:data/auth/repository/persisted_auth_repository.dart';
import 'package:data/kevin/api/kevin_api_client.dart';
import 'package:data/kevin/repository/network_kevin_repository.dart';
import 'package:data/payments/api/payments_data_api_client.dart';
import 'package:data/payments/repository/network_payments_data_repository.dart';
import 'package:data/storage/secure_key_value_storage.dart';
import 'package:dio/dio.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:domain/auth/repository/auth_repository.dart';
import 'package:domain/auth/usecase/get_auth_token_use_case.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:domain/payments/usecase/initialize_linked_payment_use_case.dart';
import 'package:domain/payments/usecase/initialize_single_payment_use_case.dart';
import 'package:domain/storage/key_value_storage.dart';
import 'package:domain/time/time_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/analytics/bloc_error_observer.dart';
import 'package:kevin_flutter_example/app/widget/app.dart';
import 'package:kevin_flutter_example/country/local_resources_country_helper.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/theme/app_theme_mode.dart';
import 'package:kevin_flutter_example/theme/model/kevin_theme_data_ios.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

const _defaultTimeOutDuration = 120000;
const _kevinApiUrl = 'https://api.getkevin.eu/demo/';
const _kevinMobileDemoApiUrl = 'https://mobile-demo.kevin.eu/api/v1/';

const _kevinPaymentsCallbackUrlAndroid = 'kevin://redirect.payment';
const _kevinPaymentsCallbackUrlIos = 'https://redirect.kevin.eu/payment.html';

const _kevinAccountsCallbackUrlAndroid = 'kevin://redirect.authorization';
const _kevinAccountsCallbackUrlIos =
    'https://redirect.kevin.eu/authorization.html';

const _kevinThemeAndroid = 'KevinTheme';

const _accountsBox = 'accountsBox';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();

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

    await _initHive();

    await _initKevinSdk();

    final kevinApiHttpClient = await _httpClient(
      baseUrl: _kevinApiUrl,
      enableLogging: true,
    );
    final kevinDemoApiHttpClient = await _httpClient(
      baseUrl: _kevinMobileDemoApiUrl,
      enableLogging: true,
    );

    final accountsBox = await Hive.openBox<LinkedAccountEntity>(_accountsBox);

    const timeProvider = TimeProvider();

    final keyValueStorage =
        SecureKeyValueStorage(storage: const FlutterSecureStorage());

    final countryHelper = LocalResourcesCountryHelper();

    final paymentsDataApiClient =
        PaymentsDataApiClient(dio: kevinApiHttpClient);
    final paymentsDataRepository =
        NetworkPaymentsDataRepository(apiClient: paymentsDataApiClient);

    final kevinApiClient = KevinApiClient(dio: kevinDemoApiHttpClient);
    final kevinRepository = NetworkKevinRepository(
      apiClient: kevinApiClient,
      timeProvider: timeProvider,
    );

    final accountsRepository = PersistentAccountsRepository(
      accountsBox: accountsBox,
    );

    final authRepository = PersistedAuthRepository(storage: keyValueStorage);

    final getAuthTokenUseCase = GetAuthTokenUseCase(
      authRepository: authRepository,
      kevinRepository: kevinRepository,
      timeProvider: timeProvider,
      tokenExpirationGap: const Duration(minutes: 5),
    );

    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => timeProvider),
          RepositoryProvider(create: (context) => ApiErrorMapper()),
          RepositoryProvider(create: (context) => AmountValidator()),
          RepositoryProvider(create: (context) => EmailValidator()),
          RepositoryProvider<KeyValueStorage>(
            create: (context) => keyValueStorage,
          ),

          /// Repositories
          RepositoryProvider<PaymentsDataRepository>(
            create: (context) => paymentsDataRepository,
          ),
          RepositoryProvider<KevinRepository>(
            create: (context) => kevinRepository,
          ),
          RepositoryProvider<AccountsRepository>(
            create: (context) => accountsRepository,
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => authRepository,
          ),

          /// UseCases
          RepositoryProvider(
            create: (context) => GetSupportedCountriesUseCase(
              repository: paymentsDataRepository,
              countryHelper: countryHelper,
            ),
          ),
          RepositoryProvider(
            create: (context) => GetCreditorsUseCase(
              repository: paymentsDataRepository,
            ),
          ),
          RepositoryProvider(
            create: (context) => getAuthTokenUseCase,
          ),
          RepositoryProvider(
            create: (context) => InitializeSinglePaymentUseCase(
              kevinRepository: kevinRepository,
            ),
          ),
          RepositoryProvider(
            create: (context) => InitializeLinkedPaymentUseCase(
              getAuthTokenUseCase: getAuthTokenUseCase,
              kevinRepository: kevinRepository,
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
  await Kevin.setTheme(
    androidTheme: const KevinThemeAndroid(_kevinThemeAndroid),
    iosTheme:
        KevinThemeDataIos.getKevinThemeDataIos(mode: getCurrentAppThemeMode())
            .data,
  );
  await Kevin.setDeepLinkingEnabled(true);
  await KevinPayments.setPaymentsConfiguration(
    const KevinPaymentsConfiguration(
      callbackUrl: KevinCallbackUrl(
        android: _kevinPaymentsCallbackUrlAndroid,
        ios: _kevinPaymentsCallbackUrlIos,
      ),
    ),
  );
  await KevinAccounts.setAccountsConfiguration(
    const KevinAccountsConfiguration(
      callbackUrl: KevinCallbackUrl(
        android: _kevinAccountsCallbackUrlAndroid,
        ios: _kevinAccountsCallbackUrlIos,
      ),
    ),
  );
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LinkedAccountEntityAdapter());
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
