part of 'payments_page.dart';

class _UserInputFields extends StatelessWidget {
  final PaymentsState _state;
  final TextEditingController _emailController;
  final TextEditingController _amountController;
  final FocusNode _amountFocusNode;
  final Function(bool) _onTermsAcceptedChanged;
  final VoidCallback _onAmountSubmitted;

  const _UserInputFields({
    required PaymentsState state,
    required TextEditingController emailController,
    required TextEditingController amountController,
    required FocusNode amountFocusNode,
    required Function(bool) onTermsAcceptedChanged,
    required VoidCallback onAmountSubmitted,
  })  : _state = state,
        _emailController = emailController,
        _amountController = amountController,
        _amountFocusNode = amountFocusNode,
        _onTermsAcceptedChanged = onTermsAcceptedChanged,
        _onAmountSubmitted = onAmountSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _FormFields(
            state: _state,
            emailController: _emailController,
            amountController: _amountController,
            amountFocusNode: _amountFocusNode,
            onAmountSubmitted: _onAmountSubmitted,
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        _CheckBox(
          state: _state,
          onTermsAcceptedChanged: _onTermsAcceptedChanged,
        ),
      ],
    );
  }
}

class _FormFields extends StatelessWidget {
  final PaymentsState _state;
  final TextEditingController _emailController;
  final TextEditingController _amountController;
  final FocusNode _amountFocusNode;
  final VoidCallback _onAmountSubmitted;

  final _decimalFilteringFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'));

  final _filterDigitsAfterZeroFormatter =
      TextInputFormatter.withFunction((oldValue, newValue) {
    final invalid = newValue.text.startsWith(RegExp(r'0[1-9]'));
    return invalid ? oldValue : newValue;
  });

  _FormFields({
    required PaymentsState state,
    required TextEditingController emailController,
    required TextEditingController amountController,
    required FocusNode amountFocusNode,
    required VoidCallback onAmountSubmitted,
  })  : _state = state,
        _emailController = emailController,
        _amountController = amountController,
        _amountFocusNode = amountFocusNode,
        _onAmountSubmitted = onAmountSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.payments_page_details_subtitle.tr(),
          style: typography.title1,
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          LocaleKeys.payments_page_details_email.tr(),
          style: typography.subtitle1.copyWith(color: color.secondaryText),
        ),
        const SizedBox(
          height: 8,
        ),
        KevinFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: KevinFormFieldClearIcon(
            text: _state.email,
            onPressed: () => _emailController.clear(),
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => _amountFocusNode.requestFocus(),
          errorText: _getValidationErrorString(
            validationResult: _state.emailValidationResult.orNull,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          LocaleKeys.payments_page_details_amount.tr(),
          style: typography.subtitle1.copyWith(color: color.secondaryText),
        ),
        const SizedBox(
          height: 8,
        ),
        KevinFormField(
          controller: _amountController,
          textInputAction: TextInputAction.done,
          focusNode: _amountFocusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            _decimalFilteringFormatter,
            _filterDigitsAfterZeroFormatter,
          ],
          suffixIcon: KevinFormFieldClearIcon(
            text: _state.amount,
            onPressed: () => _amountController.clear(),
          ),
          prefixText: '€ ',
          errorText: _getValidationErrorString(
            validationResult: _state.amountValidationResult.orNull,
          ),
          onFieldSubmitted: (_) => _onAmountSubmitted(),
        ),
      ],
    );
  }

  String? _getValidationErrorString({
    required ValidationResult? validationResult,
  }) {
    return validationResult
        ?.takeInstance<ValidationResultInvalid>()
        ?.messageKey
        .tr();
  }
}

class _CheckBox extends StatelessWidget {
  final PaymentsState _state;
  final Function(bool) _onTermsAcceptedChanged;

  const _CheckBox({
    required PaymentsState state,
    required Function(bool) onTermsAcceptedChanged,
  })  : _state = state,
        _onTermsAcceptedChanged = onTermsAcceptedChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 16),
      child: KevinCheckBox(
        value: _state.termsAccepted,
        trailingWidget: Row(
          children: [
            Expanded(
              child: _TermsSpannableText(
                key: ValueKey(context.locale.languageCode),
              ),
            ),
            if (_state.termsError)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(AppImages.errorSmall),
              ),
          ],
        ),
        onChanged: _onTermsAcceptedChanged,
      ),
    );
  }
}

class _TermsSpannableText extends StatelessWidget {
  const _TermsSpannableText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Text.rich(
      TextSpan(
        style: typography.caption2,
        text: LocaleKeys.payments_page_terms_one.tr(),
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: LocaleKeys.payments_page_terms_two.tr(),
            style: typography.caption2.copyWith(color: color.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () => ExternalUrl.openLink(AppUrls.termsAndConditions),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: LocaleKeys.payments_page_terms_three.tr(),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: LocaleKeys.payments_page_terms_four.tr(),
            style: typography.caption2.copyWith(color: color.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () => ExternalUrl.openLink(AppUrls.privacyPolicy),
          ),
        ],
      ),
    );
  }
}
