import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';
import 'package:quiver/core.dart';

class CountrySelectionState extends Equatable {
  final List<CountryItem> unsortedCountries;
  final List<CountryItem> sortedCountries;
  final bool countriesLoaded;
  final bool loading;
  final Optional<Exception> error;

  const CountrySelectionState({
    required this.unsortedCountries,
    required this.sortedCountries,
    required this.countriesLoaded,
    required this.loading,
    required this.error,
  });

  CountrySelectionState copyWith({
    List<CountryItem>? unsortedCountries,
    List<CountryItem>? sortedCountries,
    bool? countriesLoaded,
    bool? loading,
    Optional<Exception>? error,
  }) {
    return CountrySelectionState(
      unsortedCountries: unsortedCountries ?? this.unsortedCountries,
      sortedCountries: sortedCountries ?? this.sortedCountries,
      countriesLoaded: countriesLoaded ?? this.countriesLoaded,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [unsortedCountries, sortedCountries, countriesLoaded, loading, error];
}
