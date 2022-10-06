part of 'payments_page.dart';

class _CountrySection extends StatelessWidget {
  final PaymentsState _state;
  final Function(Country) _onCountryPressed;

  const _CountrySection({
    required PaymentsState state,
    required Function(Country) onCountryPressed,
  })  : _state = state,
        _onCountryPressed = onCountryPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // TODO: Localisation
            'Country',
            style: typography.title1,
          ),
          const SizedBox(
            height: 12,
          ),
          _Country(
            country: _state.country,
            onCountryPressed: _onCountryPressed,
          ),
        ],
      ),
    );
  }
}

class _Country extends StatelessWidget {
  final Country _country;
  final Function(Country) _onCountryPressed;

  const _Country({
    required Country country,
    required Function(Country) onCountryPressed,
  })  : _country = country,
        _onCountryPressed = onCountryPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(11),
      color: color.secondaryBackground,
      child: InkWell(
        onTap: () => _onCountryPressed(_country),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color.inputUnfocusedBorder),
                ),
                child: SvgPicture.asset(
                  _country.flag,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  // TODO: Localisation
                  'Country',
                  style: typography.title1,
                ),
              ),
              Text(_country.name, style: typography.title1),
              SvgPicture.asset(AppImages.chevronRight),
            ],
          ),
        ),
      ),
    );
  }
}
