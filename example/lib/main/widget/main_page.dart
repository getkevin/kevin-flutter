import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/accounts/widget/accounts_page.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_progress_indicator.dart';
import 'package:kevin_flutter_example/main/bloc/main_bloc.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_bloc.dart';
import 'package:kevin_flutter_example/payments/widget/payments_page.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

part 'main_page_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();

  static Widget withBloc() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainBloc(),
            child: const MainPage(),
          ),
          BlocProvider(
            create: (context) => PaymentsBloc(
              kevinRepository: context.read(),
              getCreditorsUseCase: context.read(),
              emailValidator: context.read(),
              amountValidator: context.read(),
            )..add(const InitialLoadEvent()),
          ),
        ],
        child: const MainPage(),
      );
}

class _MainPageState extends State<MainPage> {
  late final MainBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: IndexedStack(
                index: state.tab.index,
                children: [
                  const AccountsPage(),
                  PaymentsPage(
                    onSetGlobalLoading: _onSetLoading,
                  ),
                ],
              ),
              bottomNavigationBar: _BottomNavigationBar(
                tab: state.tab,
                onTabSelected: _onTabSelected,
              ),
            ),
            _LoadingOverlay(loading: state.loading),
          ],
        );
      },
    );
  }

  void _onTabSelected(MainPageTab tab) {
    _bloc.add(SetMainPageTabEvent(tab: tab));
  }

  void _onSetLoading(bool loading) {
    _bloc.add(SetLoadingEvent(loading: loading));
  }
}

class _LoadingOverlay extends StatelessWidget {
  final bool _loading;

  const _LoadingOverlay({
    required bool loading,
  }) : _loading = loading;

  @override
  Widget build(BuildContext context) {
    if (!_loading) return const SizedBox.shrink();

    return AbsorbPointer(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: const KevinProgressIndicator.center(),
      ),
    );
  }
}
