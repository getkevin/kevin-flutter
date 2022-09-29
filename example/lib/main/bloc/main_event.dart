import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';

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