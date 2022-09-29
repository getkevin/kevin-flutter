import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/main/bloc/main_event.dart';
import 'package:kevin_flutter_example/main/bloc/main_state.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          const MainState(
            tab: MainPageTab.accounts,
            loading: false,
          ),
        ) {
    on<MainEvent>(
      (event, emitter) async {
        if (event is SetMainPageTabEvent) {
          await _onSetMainPageTabEvent(event, emitter);
        } else if (event is SetLoadingEvent) {
          await _onSetLoadingEvent(event, emitter);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _onSetMainPageTabEvent(
    SetMainPageTabEvent event,
    Emitter<MainState> emitter,
  ) async {
    emitter(state.copyWith(tab: event.tab));
  }

  Future<void> _onSetLoadingEvent(
    SetLoadingEvent event,
    Emitter<MainState> emitter,
  ) async {
    emitter(state.copyWith(loading: event.loading));
  }
}
