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
          // TODO: Localisation
          'Account linking',
          style: typography.headline1,
        ),
        const SizedBox(
          height: 24,
        ),
        KevinListItem(
          centerWidget: Text(
            // TODO: Localisation
            'Link new account',
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
          // TODO: Localisation
          'Linked accounts',
          style: typography.title1,
        ),
      ],
    );
  }
}
