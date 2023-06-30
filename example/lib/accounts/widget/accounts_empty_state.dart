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
            key: ValueKey(context.locale.languageCode),
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                LocaleKeys.accounts_page_empty_state_title.tr(),
                style: typography.headline3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                LocaleKeys.accounts_page_empty_state_subtitle.tr(),
                style: typography.title2.copyWith(color: color.secondaryText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              KevinButton.text(
                context: context,
                text: LocaleKeys.accounts_page_empty_state_button.tr(),
                onPressed: _onLinkAccountPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
