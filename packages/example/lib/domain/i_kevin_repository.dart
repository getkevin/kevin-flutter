import 'package:dartz/dartz.dart';
import 'package:kevin_flutter_example/domain/repository_failure/repository_failure.dart';

abstract class IKevinRepository {
  Future<Either<RepositoryFailure, String>> startBankPayment(String paymentId);
  Future<Either<RepositoryFailure, String>> startCardPayment(String paymentId);
}
