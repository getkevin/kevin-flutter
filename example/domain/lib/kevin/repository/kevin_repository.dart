import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';

abstract class KevinRepository {
  Future<Payment> initializeBankPayment(PaymentRequest request);

  Future<Payment> initializeCardPayment(PaymentRequest request);
}
