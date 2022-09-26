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

/// State
class MainState extends Equatable {
  final MainPageTab tab;

  const MainState({
    required this.tab,
  });

  MainState copyWith({
    MainPageTab? tab,
  }) {
    return MainState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object?> get props => [tab];
}

/// BLoC
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(tab: MainPageTab.accounts)) {
    on<SetMainPageTabEvent>(_onSetMainPageTabEvent);
  }

  void _onSetMainPageTabEvent(
    SetMainPageTabEvent event,
    Emitter<MainState> emitter,
  ) {
    emitter(state.copyWith(tab: event.tab));
  }
}
