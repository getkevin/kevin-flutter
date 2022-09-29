import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';

abstract class KevinRepository {
  Future<AuthState> getAuthState(LinkingRequest request);

  Future<Payment> initializeBankPayment(PaymentRequest request);

  Future<Payment> initializeCardPayment(PaymentRequest request);
}
