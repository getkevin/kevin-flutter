import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/auth/model/auth_token.dart';

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
