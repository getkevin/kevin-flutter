import 'package:equatable/equatable.dart';

class CountryItem extends Equatable {
  final String code;
  final String flag;
  final String name;

  const CountryItem({
    required this.code,
    required this.flag,
    required this.name,
  });

  @override
  List<Object?> get props => [code, flag, name];
}
