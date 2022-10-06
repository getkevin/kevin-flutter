part of 'accounts_page.dart';

class _AccountsHeader extends StatelessWidget {
  final VoidCallback _onLinkAccountPressed;

  const _AccountsHeader({
    required VoidCallback onLinkAccountPressed,
  }) : _onLinkAccountPressed = onLinkAccountPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.accounts_page_title.tr(),
          style: typography.headline1,
        ),
        const SizedBox(
          height: 24,
        ),
        KevinListItem(
          centerWidget: Text(
            LocaleKeys.accounts_page_button_link_account.tr(),
            style: typography.title1.copyWith(color: color.primary),
          ),
          leadingWidget: Center(
            child: SvgPicture.asset(
              AppImages.plus,
              color: color.primary,
            ),
          ),
          type: KevinListItemType.single,
          onPressed: _onLinkAccountPressed,
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          LocaleKeys.accounts_page_linked_accounts_subtitle.tr(),
          style: typography.title1,
        ),
      ],
    );
  }
}
