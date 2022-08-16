import 'package:flutter/services.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_example/domain/i_kevin_repository.dart';
import 'package:kevin_flutter_example/domain/repository_failure/repository_failure.dart';

@LazySingleton(as: IKevinRepository)
class KevinRepository implements IKevinRepository {
  KevinRepository();

  static const MethodChannel _channel = MethodChannel(
    'eu.kevin.kevin_demo_app/sdkChannel',
  );

  @override
  Future<Either<RepositoryFailure, String>> startBankPayment(
    String paymentId,
  ) async {
    final args = {
      'id': paymentId,
    };

    final result = await _channel.invokeMethod(
      'OpenKevinBankPayment',
      args,
    );

    if (result['isSuccess']) {
      return right(result['paymentId']);
    } else {
      return left(RepositoryFailure.sdkError(result['error']));
    }
  }

  @override
  Future<Either<RepositoryFailure, String>> startCardPayment(
    String paymentId,
  ) async {
    final args = {
      'id': paymentId,
    };

    final result = await _channel.invokeMethod(
      'OpenKevinCardPayment',
      args,
    );

    if (result['isSuccess']) {
      return right(result['paymentId']);
    } else {
      return left(RepositoryFailure.sdkError(result['error']));
    }
  }
}
