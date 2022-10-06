import 'package:data/kevin/entity/auth_state_entity.dart';
import 'package:data/kevin/entity/linking_request_entity.dart';
import 'package:data/kevin/entity/payment_entity.dart';
import 'package:data/kevin/entity/payment_request_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';

class KevinApiClient {
  final Dio _dio;

  const KevinApiClient({
    required Dio dio,
  }) : _dio = dio;

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

  Future<Payment> _initializePayment({
    required String path,
    required PaymentRequest request,
  }) async {
    final result = await _dio.post(
      path,
      data: PaymentRequestEntity.fromModel(request).toJson(),
    );

    return PaymentEntity.fromJson(result.data).toModel();
  }
}
