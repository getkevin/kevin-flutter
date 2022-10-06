import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';

abstract class CountrySelectionEvent extends Equatable {
  const CountrySelectionEvent();

  @override
  List<Object?> get props => [];
}

class InitialLoadEvent extends CountrySelectionEvent {
  final Country selectedCountry;

  const InitialLoadEvent({
    required this.selectedCountry,
  });

  @override
  List<Object?> get props => [selectedCountry];
}

class SetSortedCountriesEvent extends CountrySelectionEvent {
  final List<CountryItem> countries;

  const SetSortedCountriesEvent({
    required this.countries,
  });

  @override
  List<Object?> get props => [countries];
}

class SetShouldSortCountriesEvent extends CountrySelectionEvent {
  final bool shouldSortCountries;

  const SetShouldSortCountriesEvent({required this.shouldSortCountries});

  @override
  List<Object?> get props => [shouldSortCountries];
}

class ClearErrorEvent extends CountrySelectionEvent {
  const ClearErrorEvent();
}
