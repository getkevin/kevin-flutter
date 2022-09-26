import 'package:equatable/equatable.dart';

abstract class ValidationResult extends Equatable {
  final String? message;

  const ValidationResult({required this.message});

  bool get isValid => this is ValidationResultValid;

  @override
  List<Object?> get props => [message];
}

class ValidationResultValid extends ValidationResult {
  const ValidationResultValid() : super(message: null);
}

class ValidationResultInvalid extends ValidationResult {
  const ValidationResultInvalid({required String message})
      : super(message: message);
}
