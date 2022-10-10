import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_event.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_state.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';
import 'package:quiver/core.dart';

class CountrySelectionBloc
    extends Bloc<CountrySelectionEvent, CountrySelectionState> {
  final GetSupportedCountriesUseCase _getSupportedCountriesUseCase;

  CountrySelectionBloc({
    required GetSupportedCountriesUseCase getSupportedCountriesUseCase,
  })  : _getSupportedCountriesUseCase = getSupportedCountriesUseCase,
        super(
          const CountrySelectionState(
            countries: [],
            loading: false,
            error: Optional.absent(),
          ),
        ) {
    on<CountrySelectionEvent>(
      (event, emitter) async {
        if (event is InitialLoadEvent) {
          await _onInitialLoadEvent(event, emitter);
        } else if (event is SortCountriesEvent) {
          await _onSortCountriesEvent(event, emitter);
        } else if (event is ClearErrorEvent) {
          await _onClearErrorEvent(event, emitter);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _onInitialLoadEvent(
    InitialLoadEvent event,
    Emitter<CountrySelectionState> emitter,
  ) async {
    emitter(state.copyWith(loading: true));

    try {
      final countries = await _getSupportedCountriesUseCase.invoke();
      final countryItems = countries
          .map(
            (c) => CountryItem(
              country: c,
              selected: c.code == event.selectedCountry.code,
            ),
          )
          .toList();
      final sortedCountries = _sortCountries(countries: countryItems);
      emitter(
        state.copyWith(
          countries: sortedCountries,
          loading: false,
        ),
      );
    } on Exception catch (error, st) {
      Fimber.e('Error loading supported countries', ex: error, stacktrace: st);
      emitter(
        state.copyWith(
          loading: false,
          error: Optional.of(error),
        ),
      );
    }
  }

  Future<void> _onSortCountriesEvent(
    SortCountriesEvent event,
    Emitter<CountrySelectionState> emitter,
  ) async {
    final sortedCountries = _sortCountries(countries: state.countries);
    emitter(
      state.copyWith(
        countries: sortedCountries,
      ),
    );
  }

  Future<void> _onClearErrorEvent(
    ClearErrorEvent event,
    Emitter<CountrySelectionState> emitter,
  ) async {
    emitter(state.copyWith(error: const Optional.absent()));
  }

  // .tr() method should be called from the widget's build() method,
  // though in this case sorting depends on localized strings, therefore
  // calling .tr() from inside the BLoC.
  // Countries must be sorted on each locale change.
  static List<CountryItem> _sortCountries({
    required List<CountryItem> countries,
  }) {
    return countries.sorted((first, second) {
      final firstName = first.country.nameKey.tr();
      final secondName = second.country.nameKey.tr();

      return firstName.compareTo(secondName);
    }).toList();
  }
}
