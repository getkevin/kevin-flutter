import 'package:equatable/equatable.dart';

abstract class ValidationResult extends Equatable {
  const ValidationResult();

  bool get isValid => this is ValidationResultValid;

  @override
  List<Object?> get props => [];
}

class ValidationResultValid extends ValidationResult {
  const ValidationResultValid();
}

class ValidationResultInvalid extends ValidationResult {
  final String messageKey;

  const ValidationResultInvalid({required this.messageKey});

  @override
  List<Object?> get props => [messageKey];
}
