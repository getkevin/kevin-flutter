import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String authorizationLink;
  final String state;

  const AuthState({
    required this.authorizationLink,
    required this.state,
  });

  @override
  List<Object?> get props => [authorizationLink, state];
}
