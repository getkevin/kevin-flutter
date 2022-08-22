import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_flutter_example/domain/auth_state/auth_state.dart';

part 'auth_state_dto.freezed.dart';
part 'auth_state_dto.g.dart';

@freezed
class AuthStateDTO with _$AuthStateDTO {
  const AuthStateDTO._();

  const factory AuthStateDTO({
    required String authorizationLink,
    required String state,
  }) = _AuthStateDTO;

  factory AuthStateDTO.fromDomain(AuthState authState) {
    return AuthStateDTO(
      authorizationLink: authState.authorizationLink,
      state: authState.state,
    );
  }

  AuthState toDomain() {
    return AuthState(
      authorizationLink: authorizationLink,
      state: state,
    );
  }

  factory AuthStateDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthStateDTOFromJson(json);
}
