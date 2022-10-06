import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';

abstract class KevinRepository {
  Future<AuthToken> getAuthToken(String authCode);

  Future<AuthToken> refreshAuthToken(RefreshAuthTokenRequest request);

  Future<AuthState> getAuthState(LinkingRequest request);

  Future<Payment> initializeBankPayment(PaymentRequest request);

  Future<Payment> initializeCardPayment(PaymentRequest request);

  Future<Payment> initializeLinkedBankPayment({
    required String accessToken,
    required PaymentRequest request,
  });
}
