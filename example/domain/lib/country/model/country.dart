import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String code;
  final String flag;
  final String name;

  const Country({
    required this.code,
    required this.flag,
    required this.name,
  });

  @override
  List<Object?> get props => [code, flag, name];
}
