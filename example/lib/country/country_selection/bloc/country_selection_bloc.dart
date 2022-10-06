import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
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
      emitter(
        state.copyWith(
          countries: countryItems,
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

  Future<void> _onClearErrorEvent(
    ClearErrorEvent event,
    Emitter<CountrySelectionState> emitter,
  ) async {
    emitter(state.copyWith(error: const Optional.absent()));
  }
}
