import 'package:equatable/equatable.dart';

class RefreshAuthTokenRequest extends Equatable {
  final String refreshToken;

  const RefreshAuthTokenRequest({
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [refreshToken];
}
