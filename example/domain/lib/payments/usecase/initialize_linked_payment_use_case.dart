import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/auth/usecase/get_auth_token_use_case.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';

class InitializeLinkedPaymentUseCase {
  final KevinRepository _kevinRepository;
  final GetAuthTokenUseCase _getAuthTokenUseCase;

  const InitializeLinkedPaymentUseCase({
    required KevinRepository kevinRepository,
    required GetAuthTokenUseCase getAuthTokenUseCase,
  })  : _kevinRepository = kevinRepository,
        _getAuthTokenUseCase = getAuthTokenUseCase;

  Future<Payment> invoke({
    required LinkedAccount linkedAccount,
    required PaymentRequest paymentRequest,
  }) async {
    final authToken =
        await _getAuthTokenUseCase.invoke(linkedAccount.linkToken);

    return _kevinRepository.initializeLinkedBankPayment(
      accessToken: authToken.accessToken,
      request: paymentRequest,
    );
  }
}
