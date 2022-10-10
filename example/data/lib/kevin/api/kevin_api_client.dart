import 'package:data/auth/entity/api_auth_token_entity.dart';
import 'package:data/auth/entity/refresh_auth_token_request_entity.dart';
import 'package:data/kevin/entity/auth_state_entity.dart';
import 'package:data/kevin/entity/linking_request_entity.dart';
import 'package:data/kevin/entity/payment_entity.dart';
import 'package:data/kevin/entity/payment_request_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';

class KevinApiClient {
  final Dio _dio;

  const KevinApiClient({
    required Dio dio,
  }) : _dio = dio;

  Future<ApiAuthTokenEntity> getAuthToken(String authCode) async {
    final result = await _dio
        .get('auth/tokens/', queryParameters: {'authorizationCode': authCode});

    return ApiAuthTokenEntity.fromJson(result.data);
  }

  Future<ApiAuthTokenEntity> refreshAuthToken(
    RefreshAuthTokenRequest request,
  ) async {
    final result = await _dio.post(
      'auth/refreshToken/',
      data: RefreshAuthTokenRequestEntity.fromModel(request).toJson(),
    );

    return ApiAuthTokenEntity.fromJson(result.data);
  }

  Future<AuthState> getAuthState(LinkingRequest request) async {
    final result = await _dio.post(
      'auth/initiate/',
      data: LinkingRequestEntity.fromModel(request).toJson(),
    );

    return AuthStateEntity.fromJson(result.data).toModel();
  }

  Future<Payment> initializeBankPayment(PaymentRequest request) =>
      _initializePayment(path: 'payments/bank/', request: request);

  Future<Payment> initializeCardPayment(PaymentRequest request) =>
      _initializePayment(path: 'payments/card/', request: request);

  Future<Payment> initializeLinkedBankPayment({
    required String accessToken,
    required PaymentRequest request,
  }) =>
      _initializePayment(
        path: 'payments/bank/linked/',
        request: request,
        accessToken: accessToken,
      );

  Future<Payment> _initializePayment({
    required String path,
    required PaymentRequest request,
    String? accessToken,
  }) async {
    final headers = <String, String>{};

    if (accessToken != null) {
      headers.addAll(
        {'Authorization': 'Bearer $accessToken'},
      );
    }

    final result = await _dio.post(
      path,
      data: PaymentRequestEntity.fromModel(request).toJson(),
      options: Options(headers: headers),
    );

    return PaymentEntity.fromJson(result.data).toModel();
  }
}
