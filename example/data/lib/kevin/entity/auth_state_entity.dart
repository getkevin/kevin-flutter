import 'package:domain/kevin/model/auth_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_state_entity.g.dart';

@JsonSerializable(createToJson: false)
class AuthStateEntity {
  final String authorizationLink;
  final String state;

  const AuthStateEntity({
    required this.authorizationLink,
    required this.state,
  });

  factory AuthStateEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthStateEntityFromJson(json);

  AuthState toModel() =>
      AuthState(authorizationLink: authorizationLink, state: state);
}
