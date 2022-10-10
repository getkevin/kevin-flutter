import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/main/bloc/main_bloc.dart';
import 'package:kevin_flutter_example/main/bloc/main_event.dart';
import 'package:kevin_flutter_example/main/bloc/main_state.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';

const _initialState = MainState(tab: MainPageTab.accounts, loading: false);

void main() {
  EquatableConfig.stringify = true;

  late MainBloc subject;

  setUp(() {
    subject = MainBloc();
  });

  blocTest(
    'Initial state test',
    build: () => subject,
    verify: (MainBloc bloc) {
      final state = bloc.state;

      expect(state, _initialState);
    },
  );

  blocTest(
    'Set main page tab test',
    build: () => subject,
    act: (MainBloc bloc) {
      bloc.add(const SetMainPageTabEvent(tab: MainPageTab.payments));
      bloc.add(const SetMainPageTabEvent(tab: MainPageTab.accounts));
    },
    expect: () => [
      _initialState.copyWith(tab: MainPageTab.payments),
      _initialState.copyWith(tab: MainPageTab.accounts),
    ],
  );

  blocTest(
    'Set loading test',
    build: () => subject,
    act: (MainBloc bloc) {
      bloc.add(const SetLoadingEvent(loading: true));
      bloc.add(const SetLoadingEvent(loading: false));
    },
    expect: () => [
      _initialState.copyWith(loading: true),
      _initialState.copyWith(loading: false),
    ],
  );
}
