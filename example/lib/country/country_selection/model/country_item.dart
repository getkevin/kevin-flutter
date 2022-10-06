import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';

class CountryItem extends Equatable {
  final Country country;
  final bool selected;

  const CountryItem({
    required this.country,
    required this.selected,
  });

  @override
  List<Object?> get props => [country, selected];
}
