import 'package:dartz/dartz.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/domain/payment_initialization_state/payment_initialization_state.dart';
import 'package:kevin_flutter_example/domain/repository_failure/repository_failure.dart';

abstract class IApiRepository {
  Future<Either<RepositoryFailure, List<String>>> getCountryList();
  Future<Either<RepositoryFailure, List<Creditor>>> getCreditors({
    required String forCountryCode,
  });
  Future<Either<RepositoryFailure, PaymentInitializationState>>
      initializeBankPayment({
    required String amount,
    required String email,
    required String iban,
    required String creditorName,
    required String redirectUrl,
  });
  Future<Either<RepositoryFailure, PaymentInitializationState>>
      initializeCardPayment({
    required String amount,
    required String email,
    required String iban,
    required String creditorName,
    required String redirectUrl,
  });
}
