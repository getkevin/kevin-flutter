import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String code;
  final String flagKey;
  final String nameKey;

  const Country({
    required this.code,
    required this.flagKey,
    required this.nameKey,
  });

  @override
  List<Object?> get props => [code, flagKey, nameKey];
}
