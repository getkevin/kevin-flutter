import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/accounts/widget/accounts_page.dart';
import 'package:kevin_flutter_example/main/bloc/main_bloc.dart';
import 'package:kevin_flutter_example/main/model/main_page_tab.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_bloc.dart';
import 'package:kevin_flutter_example/payments/widget/payments_page.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

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
              countryHelper: context.read(),
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
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.tab.index,
            children: const [
              AccountsPage(),
              PaymentsPage(),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: color.rippleOnPrimary.withOpacity(0.2),
            ),
            child: BottomNavigationBar(
              currentIndex: state.tab.index,
              onTap: (index) {
                final tab = MainPageTab.values[index];
                _bloc.add(SetMainPageTabEvent(tab: tab));
              },
              selectedItemColor: color.primary,
              selectedLabelStyle: typography.caption2,
              unselectedItemColor: color.secondaryText,
              unselectedLabelStyle: typography.caption2,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.navAccounts,
                    color: _getIconColor(
                      context: context,
                      tab: MainPageTab.accounts,
                      currentTab: state.tab,
                    ),
                  ),
                  // TODO: Localisation
                  label: 'Accounts',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.navPayments,
                    color: _getIconColor(
                      context: context,
                      tab: MainPageTab.payments,
                      currentTab: state.tab,
                    ),
                  ),
                  // TODO: Localisation
                  label: 'Payments',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getIconColor({
    required BuildContext context,
    required MainPageTab tab,
    required MainPageTab currentTab,
  }) {
    final color = AppTheme.of(context).color;
    return tab == currentTab ? color.primary : color.secondaryText;
  }
}
