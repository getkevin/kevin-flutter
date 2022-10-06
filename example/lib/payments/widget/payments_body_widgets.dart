part of 'payments_page.dart';

class _Body extends StatelessWidget {
  final PaymentsState _state;
  final TextEditingController _emailController;
  final TextEditingController _amountController;
  final FocusNode _amountFocusNode;
  final Function(Country) _onCountryPressed;
  final Function(CreditorListItem) _onCreditorPressed;
  final Function(bool) _onTermsAcceptedChanged;
  final VoidCallback _onAmountSubmitted;

  const _Body({
    required PaymentsState state,
    required TextEditingController emailController,
    required TextEditingController amountController,
    required FocusNode amountFocusNode,
    required Function(Country) onCountryPressed,
    required Function(CreditorListItem) onCreditorPressed,
    required Function(bool) onTermsAcceptedChanged,
    required VoidCallback onAmountSubmitted,
  })  : _state = state,
        _emailController = emailController,
        _amountController = amountController,
        _amountFocusNode = amountFocusNode,
        _onCountryPressed = onCountryPressed,
        _onCreditorPressed = onCreditorPressed,
        _onTermsAcceptedChanged = onTermsAcceptedChanged,
        _onAmountSubmitted = onAmountSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(),
        const SizedBox(
          height: 18,
        ),
        _CountrySection(
          state: _state,
          onCountryPressed: _onCountryPressed,
        ),
        const SizedBox(
          height: 28,
        ),
        _CreditorsSection(
          state: _state,
          onCreditorPressed: _onCreditorPressed,
        ),
        const SizedBox(
          height: 28,
        ),
        _UserInputFields(
          state: _state,
          emailController: _emailController,
          amountController: _amountController,
          amountFocusNode: _amountFocusNode,
          onTermsAcceptedChanged: _onTermsAcceptedChanged,
          onAmountSubmitted: _onAmountSubmitted,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        LocaleKeys.payments_page_title.tr(),
        style: typography.headline1,
      ),
    );
  }
}
