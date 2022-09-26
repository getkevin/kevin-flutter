part of 'payments_page.dart';

class _AlignedButton extends StatelessWidget {
  final String _amount;
  final VoidCallback? _onPressed;

  const _AlignedButton({
    required String amount,
    required VoidCallback? onPressed,
  })  : _amount = amount,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    final amount = _amount.isNotEmpty ? _amount : '0.00';

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: KevinButton.text(
                context: context,
                // TODO: Localisation
                text: 'PAY • $amount EUR',
                onPressed: _onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
