import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:domain/auth/usecase/get_auth_token_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_auth_repository.dart';
import '../../fakes/fake_kevin_repository.dart';
import '../../fakes/fake_time_provider.dart';
import '../../test_data.dart';

void main() {
  EquatableConfig.stringify = true;

  late FakeAuthRepository authRepository;
  late FakeKevinRepository kevinRepository;
  late FakeTimeProvider timeProvider;
  late GetAuthTokenUseCase subject;

  setUp(() {
    authRepository = FakeAuthRepository();
    kevinRepository = FakeKevinRepository();
    timeProvider = FakeTimeProvider();

    subject = GetAuthTokenUseCase(
      authRepository: authRepository,
      kevinRepository: kevinRepository,
      timeProvider: timeProvider,
      tokenExpirationGap: const Duration(minutes: 5),
    );
  });

  test('Current token does not exist test', () async {
    final result = await subject.invoke('linkToken');

    expect(kevinRepository.getAuthTokenCallHistory(), ['linkToken']);
    expect(await authRepository.getAuthToken('linkToken'), authToken);
    expect(result, authToken);
  });

  test('Current access token is not expired test', () async {
    final validToken = authToken.copyWith(
      accessTokenExpiresAt: DateTime.utc(2022, 1, 1, 12),
    );

    await authRepository.putAuthToken(
      linkToken: 'linkToken',
      authToken: validToken,
    );
    timeProvider.setTime(dateTime: DateTime.utc(2022, 1, 1, 11));

    final result = await subject.invoke('linkToken');

    expect(result, validToken);
  });

  test('Current refresh token is not expired test', () async {
    final token = authToken.copyWith(
      accessTokenExpiresAt: DateTime.utc(2022, 1, 1, 11),
      refreshTokenExpiresAt: DateTime.utc(2022, 1, 1, 20),
    );

    await authRepository.putAuthToken(
      linkToken: 'linkToken',
      authToken: token,
    );
    timeProvider.setTime(dateTime: DateTime.utc(2022, 1, 1, 11));

    final result = await subject.invoke('linkToken');

    expect(
      kevinRepository.getRefreshAuthTokenCallHistory(),
      [const RefreshAuthTokenRequest(refreshToken: 'refreshToken')],
    );
    expect(await authRepository.getAuthToken('linkToken'), authToken);
    expect(result, authToken);
  });

  test('Current refresh token is expired test', () async {
    final token = authToken.copyWith(
      accessTokenExpiresAt: DateTime.utc(2022, 1, 1, 11),
      refreshTokenExpiresAt: DateTime.utc(2022, 1, 1, 11),
    );

    await authRepository.putAuthToken(
      linkToken: 'linkToken',
      authToken: token,
    );
    timeProvider.setTime(dateTime: DateTime.utc(2022, 1, 1, 11));

    final result = await subject.invoke('linkToken');

    expect(kevinRepository.getAuthTokenCallHistory(), ['linkToken']);
    expect(await authRepository.getAuthToken('linkToken'), authToken);
    expect(result, authToken);
  });

  test('Get new auth token error test', () async {
    kevinRepository.setErrors(authTokenError: exception);

    expect(() async => subject.invoke('linkToken'), throwsA(exception));
  });

  test('Refresh token error test', () async {
    kevinRepository.setErrors(refreshAuthTokenError: exception);

    final token = authToken.copyWith(
      accessTokenExpiresAt: DateTime.utc(2022, 1, 1, 11),
      refreshTokenExpiresAt: DateTime.utc(2022, 1, 1, 20),
    );

    await authRepository.putAuthToken(
      linkToken: 'linkToken',
      authToken: token,
    );
    timeProvider.setTime(dateTime: DateTime.utc(2022, 1, 1, 11));

    expect(() async => subject.invoke('linkToken'), throwsA(exception));
  });
}
