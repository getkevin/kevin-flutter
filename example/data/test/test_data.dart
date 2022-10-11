import 'package:dio/dio.dart';
import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/kevin/model/payment_request.dart';

/// Commonly used data across the tests

final exception = Exception('exception');

final _requestOptions = RequestOptions(path: '');

Response dioResponse<T>({T? data, int? statusCode}) => Response(
      requestOptions: _requestOptions,
      data: data,
      statusCode: statusCode,
    );

DioError dioError<T>({Response? response}) => DioError(
      requestOptions: _requestOptions,
      response: response,
    );

final authToken = AuthToken(
  tokenType: 'tokenType',
  accessToken: 'accessToken',
  accessTokenExpiresAt: DateTime.utc(2022),
  refreshToken: 'refreshToken',
  refreshTokenExpiresAt: DateTime.utc(2023),
);

const linkedAccount = LinkedAccount(
  id: 0,
  bankName: 'bankName',
  logoUrl: 'logoUrl',
  linkToken: 'linkToken',
  bankId: 'bankId',
);

const paymentRequest = PaymentRequest(
  amount: '1',
  email: 'test@test.com',
  creditorName: 'name',
  redirectUrl: 'callbackUrl',
);
