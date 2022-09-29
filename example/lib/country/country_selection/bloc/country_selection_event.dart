import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';

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

class ClearErrorEvent extends CountrySelectionEvent {
  const ClearErrorEvent();
}