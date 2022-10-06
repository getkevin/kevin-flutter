import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';

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