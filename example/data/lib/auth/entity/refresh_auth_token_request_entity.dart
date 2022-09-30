import 'package:domain/auth/model/refresh_auth_token_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_auth_token_request_entity.g.dart';

@JsonSerializable(createFactory: false)
class RefreshAuthTokenRequestEntity {
  final String refreshToken;

  const RefreshAuthTokenRequestEntity({
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => _$RefreshAuthTokenRequestEntityToJson(this);

  factory RefreshAuthTokenRequestEntity.fromModel(
    RefreshAuthTokenRequest request,
  ) =>
      RefreshAuthTokenRequestEntity(refreshToken: request.refreshToken);
}
