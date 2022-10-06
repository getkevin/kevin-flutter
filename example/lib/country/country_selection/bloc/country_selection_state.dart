import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';
import 'package:quiver/core.dart';

class CountrySelectionState extends Equatable {
  final List<CountryItem> countries;
  final bool loading;
  final Optional<Exception> error;

  const CountrySelectionState({
    required this.countries,
    required this.loading,
    required this.error,
  });

  CountrySelectionState copyWith({
    List<CountryItem>? countries,
    bool? loading,
    Optional<Exception>? error,
  }) {
    return CountrySelectionState(
      countries: countries ?? this.countries,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [countries, loading, error];
}