import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_bloc.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_event.dart';
import 'package:kevin_flutter_example/country/country_selection/bloc/country_selection_state.dart';
import 'package:kevin_flutter_example/country/country_selection/model/country_item.dart';
import 'package:quiver/core.dart';

import '../../../fakes/fake_get_supported_countries_use_case.dart';
import '../../../test_data.dart';

const _initialState = CountrySelectionState(
  countries: [],
  loading: false,
  error: Optional.absent(),
);

const _lithuaniaItem = CountryItem(country: lithuania, selected: false);
const _latviaItem = CountryItem(country: latvia, selected: false);
const _estoniaItem = CountryItem(country: estonia, selected: false);
const _polandItem = CountryItem(country: poland, selected: false);

void main() {
  EquatableConfig.stringify = true;

  late FakeGetSupportedCountriesUseCase getSupportedCountriesUseCase;
  late CountrySelectionBloc subject;

  setUp(() {
    getSupportedCountriesUseCase = FakeGetSupportedCountriesUseCase();

    getSupportedCountriesUseCase.setCountries(
      countries: [
        lithuania,
        latvia,
        estonia,
      ],
    );

    subject = CountrySelectionBloc(
      getSupportedCountriesUseCase: getSupportedCountriesUseCase,
    );
  });

  blocTest(
    'Initial state test',
    build: () => subject,
    verify: (CountrySelectionBloc bloc) {
      final state = bloc.state;

      expect(state, _initialState);
    },
  );

  blocTest(
    'Initial load success test',
    build: () => subject,
    act: (CountrySelectionBloc bloc) {
      bloc.add(const InitialLoadEvent(selectedCountry: lithuania));
    },
    expect: () {
      final loadingState = _initialState.copyWith(loading: true);
      final countriesState = _initialState.copyWith(
        countries: [
          _estoniaItem,
          _lithuaniaItem.copyWith(selected: true),
          _latviaItem,
        ],
      );

      return [
        loadingState,
        countriesState,
      ];
    },
  );

  blocTest(
    'Initial load no selected country test',
    build: () => subject,
    act: (CountrySelectionBloc bloc) {
      bloc.add(const InitialLoadEvent(selectedCountry: poland));
    },
    verify: (CountrySelectionBloc bloc) {
      final state = bloc.state;

      expect(
        state.countries,
        [
          _estoniaItem,
          _lithuaniaItem,
          _latviaItem,
        ],
      );
    },
  );

  blocTest(
    'Initial load error test',
    build: () {
      getSupportedCountriesUseCase.setError(error: exception);
      return subject;
    },
    act: (CountrySelectionBloc bloc) {
      bloc.add(const InitialLoadEvent(selectedCountry: lithuania));
    },
    verify: (CountrySelectionBloc bloc) {
      final state = bloc.state;

      expect(
        state,
        _initialState.copyWith(error: Optional.of(exception)),
      );
    },
  );

  blocTest(
    'Sort countries test',
    build: () => subject,
    seed: () => _initialState.copyWith(
      countries: [
        _polandItem,
        _latviaItem,
        _lithuaniaItem,
        _estoniaItem,
      ],
    ),
    act: (CountrySelectionBloc bloc) {
      bloc.add(
        const SortCountriesEvent(),
      );
    },
    verify: (CountrySelectionBloc bloc) {
      final state = bloc.state;

      // Sorting depends on localized country names,
      // in test environment localizations are absent,
      // localization keys used instead.
      expect(state.countries, [
        _estoniaItem,
        _lithuaniaItem,
        _latviaItem,
        _polandItem,
      ]);
    },
  );

  blocTest(
    'Clear error test',
    build: () => subject,
    seed: () => _initialState.copyWith(error: Optional.of(exception)),
    act: (CountrySelectionBloc bloc) {
      bloc.add(
        const ClearErrorEvent(),
      );
    },
    verify: (CountrySelectionBloc bloc) {
      final state = bloc.state;

      expect(state.error, const Optional.absent());
    },
  );
}
