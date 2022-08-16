import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/domain/i_api_repository.dart';
import 'package:kevin_flutter_example/domain/payment_initialization_state/payment_initialization_state.dart';
import 'package:kevin_flutter_example/domain/repository_failure/repository_failure.dart';
import 'package:kevin_flutter_example/infrastructure/creditor_dto/creditor_dto.dart';
import 'package:kevin_flutter_example/infrastructure/payment_initialization_state_dto/payment_initialization_state_dto.dart';

@LazySingleton(as: IApiRepository)
class ApiRepository implements IApiRepository {
  final Dio _dio;

  final String kevinDemoBaseUrl = 'https://api.getkevin.eu/demo';
  final String kevinMobileDemoBaseUrl = 'https://mobile-demo.kevin.eu/api/v1';

  ApiRepository(
    this._dio,
  );

  @override
  Future<Either<RepositoryFailure, List<String>>> getCountryList() async {
    try {
      final response = await _dio.get(
        '$kevinDemoBaseUrl/countries',
      );

      if (response.data != null) {
        final countryCodes = response.data['data'].map<String>((item) {
          return item as String;
        }).toList();
        return right(countryCodes);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, List<Creditor>>> getCreditors({
    required String forCountryCode,
  }) async {
    try {
      final countryCode = forCountryCode.toUpperCase() == 'LT' ? 'LT' : 'EE';
      final response = await _dio.get(
        '$kevinDemoBaseUrl/creditors',
        queryParameters: {
          'countryCode': countryCode,
        },
      );

      if (response.data != null) {
        final responseList = response.data['data'] as List<dynamic>;

        final creditors = responseList.map((e) {
          return CreditorDTO.fromJson(e).toDomain();
        }).toList();

        return right(creditors);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, PaymentInitializationState>>
      initializeBankPayment({
    required String amount,
    required String email,
    required String iban,
    required String creditorName,
  }) async {
    try {
      final url = '$kevinMobileDemoBaseUrl/payments/bank/';

      final response = await _dio.post(
        url,
        data: {
          'amount': amount,
          'email': email,
          'iban': iban,
          'creditorName': creditorName,
        },
      );

      if (response.data != null) {
        final paymentState = PaymentInitializationStateDTO.fromJson(
          response.data as Map<String, dynamic>,
        ).toDomain();

        return right(paymentState);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }

  @override
  Future<Either<RepositoryFailure, PaymentInitializationState>>
      initializeCardPayment({
    required String amount,
    required String email,
    required String iban,
    required String creditorName,
  }) async {
    try {
      final response = await _dio.post(
        '$kevinMobileDemoBaseUrl/payments/card/',
        data: {
          'amount': amount,
          'email': email,
          'iban': iban,
          'creditorName': creditorName,
        },
      );

      if (response.data != null) {
        final paymentState = PaymentInitializationStateDTO.fromJson(
          response.data as Map<String, dynamic>,
        ).toDomain();

        return right(paymentState);
      } else {
        return left(const RepositoryFailure.emptyResponse());
      }
    } catch (e) {
      return left(const RepositoryFailure.unexpected());
    }
  }
}
