import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';

/// Events
abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class SetMainPageTabEvent extends MainEvent {
  final MainPageTab tab;

  const SetMainPageTabEvent({
    required this.tab,
  });

  @override
  List<Object?> get props => [tab];
}

class SetLoadingEvent extends MainEvent {
  final bool loading;

  const SetLoadingEvent({
    required this.loading,
  });

  @override
  List<Object?> get props => [loading];
}

/// State
class MainState extends Equatable {
  final MainPageTab tab;
  final bool loading;

  const MainState({
    required this.tab,
    required this.loading,
  });

  MainState copyWith({
    MainPageTab? tab,
    bool? loading,
  }) {
    return MainState(
      tab: tab ?? this.tab,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        tab,
        loading,
      ];
}

/// BLoC
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          const MainState(
            tab: MainPageTab.accounts,
            loading: false,
          ),
        ) {
    on<MainEvent>((event, emitter) async {
      if (event is SetMainPageTabEvent) {
        await _onSetMainPageTabEvent(event, emitter);
      } else if (event is SetLoadingEvent) {
        await _onSetLoadingEvent(event, emitter);
      }
    });
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
