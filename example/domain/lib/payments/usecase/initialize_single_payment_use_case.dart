import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/payments/model/payment_type.dart';

class InitializeSinglePaymentUseCase {
  final KevinRepository _kevinRepository;

  const InitializeSinglePaymentUseCase({
    required KevinRepository kevinRepository,
  }) : _kevinRepository = kevinRepository;

  Future<Payment> invoke({
    required PaymentType paymentType,
    required PaymentRequest paymentRequest,
  }) {
    switch (paymentType) {
      case PaymentType.bank:
        return _kevinRepository.initializeBankPayment(paymentRequest);
      case PaymentType.card:
        return _kevinRepository.initializeCardPayment(paymentRequest);
      case PaymentType.linked:
        throw StateError('Wrong payment type: $paymentType');
    }
  }
}
