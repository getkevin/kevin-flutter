import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/kevin/model/payment_request.dart';

/// Commonly used data across the tests

final exception = Exception('exception');

const linkedAccount = LinkedAccount(
  id: 0,
  bankName: 'bankName',
  logoUrl: 'logoUrl',
  linkToken: 'linkToken',
  bankId: 'bankId',
);

final authToken = AuthToken(
  tokenType: 'tokenType',
  accessToken: 'accessToken',
  accessTokenExpiresAt: DateTime.utc(2022),
  refreshToken: 'refreshToken',
  refreshTokenExpiresAt: DateTime.utc(2023),
);

const paymentRequest = PaymentRequest(
  amount: '1',
  email: 'test@test.com',
  creditorName: 'name',
  redirectUrl: 'callbackUrl',
);

const lithuania = Country(code: 'LT', flagKey: 'LT', nameKey: 'LT');
const latvia = Country(code: 'LV', flagKey: 'LV', nameKey: 'LV');
const estonia = Country(code: 'EE', flagKey: 'EE', nameKey: 'EE');
const poland = Country(code: 'PL', flagKey: 'PL', nameKey: 'PL');
