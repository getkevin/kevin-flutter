part of 'main_page.dart';

class _BottomNavigationBar extends StatelessWidget {
  final MainPageTab _tab;
  final Function(MainPageTab) _onTabSelected;

  const _BottomNavigationBar({
    required MainPageTab tab,
    required Function(MainPageTab) onTabSelected,
  })  : _tab = tab,
        _onTabSelected = onTabSelected;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: color.rippleOnPrimary.withOpacity(0.2),
      ),
      child: BottomNavigationBar(
        currentIndex: _tab.index,
        onTap: (index) => _onTabSelected.call(MainPageTab.values[index]),
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
                currentTab: _tab,
              ),
            ),
            label: LocaleKeys.main_page_nav_bar_accounts.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.navPayments,
              color: _getIconColor(
                context: context,
                tab: MainPageTab.payments,
                currentTab: _tab,
              ),
            ),
            label: LocaleKeys.main_page_nav_bar_payments.tr(),
          ),
        ],
      ),
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
