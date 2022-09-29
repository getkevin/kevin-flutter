part of 'accounts_page.dart';

class _AccountsEmptyState extends StatelessWidget {
  final VoidCallback _onLinkAccountPressed;

  const _AccountsEmptyState({
    required VoidCallback onLinkAccountPressed,
  }) : _onLinkAccountPressed = onLinkAccountPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                AppImages.accountsBanner,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                // TODO: Localisation
                'Link your first bank account',
                style: typography.headline3,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                // TODO: Localisation
                'Subtitle',
                style: typography.title2.copyWith(color: color.secondaryText),
              ),
              const SizedBox(
                height: 32,
              ),
              KevinButton.text(
                context: context,
                // TODO: Localisation
                text: 'Link Bank Account',
                onPressed: _onLinkAccountPressed,
              ),
            ],
          ),
        )
      ],
    );
  }
}
