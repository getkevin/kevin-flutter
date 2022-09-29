part of 'payments_page.dart';

class _CreditorsSection extends StatelessWidget {
  final PaymentsState _state;
  final Function(CreditorListItem) _onCreditorPressed;

  const _CreditorsSection({
    required PaymentsState state,
    required Function(CreditorListItem) onCreditorPressed,
  })  : _state = state,
        _onCreditorPressed = onCreditorPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            // TODO: Localisation
            'Select charity',
            style: typography.title1,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        _CreditorList(
          state: _state,
          onCreditorPressed: _onCreditorPressed,
        ),
      ],
    );
  }
}

class _CreditorList extends StatelessWidget {
  final PaymentsState _state;
  final Function(CreditorListItem) _onCreditorPressed;

  const _CreditorList({
    required PaymentsState state,
    required Function(CreditorListItem) onCreditorPressed,
  })  : _state = state,
        _onCreditorPressed = onCreditorPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final decoration = theme.animation;

    final itemWidth = _getCharityWidth(context: context);

    return SizedBox(
      height: itemWidth / _creditorItemAspectRatio,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: _state.creditorsLoading ? 1 : 0,
            duration: decoration.duration.defaultDuration,
            child: const KevinProgressIndicator.center(),
          ),
          AnimatedOpacity(
            opacity: _state.creditorsLoading ? 0 : 1,
            duration: decoration.duration.defaultDuration,
            child: ScrollSnapList(
              selectedItemAnchor: SelectedItemAnchor.START,
              listViewPadding: const EdgeInsets.symmetric(horizontal: 8),
              itemSize: itemWidth + 16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final creditor = _state.creditors[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _Creditor(
                    creditor: creditor,
                    onPressed: (creditor) => _onCreditorPressed(creditor),
                    width: itemWidth,
                  ),
                );
              },
              itemCount: _state.creditors.length,
              onItemFocus: (_) {},
            ),
          ),
        ],
      ),
    );
  }

  double _getCharityWidth({required BuildContext context}) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 3 items should be visible on the screen.
    // 64 == sum of all visible paddings (4 * 16).
    final itemWidth = (screenWidth - 64) / 3;

    return itemWidth;
  }
}

class _Creditor extends StatelessWidget {
  final CreditorListItem _creditor;
  final Function(CreditorListItem) _onPressed;
  final double _width;

  const _Creditor({
    required CreditorListItem creditor,
    required Function(CreditorListItem) onPressed,
    required double width,
  })  : _creditor = creditor,
        _onPressed = onPressed,
        _width = width;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final decoration = theme.animation;

    return Stack(
      children: [
        AnimatedContainer(
          duration: decoration.duration.longDuration,
          curve: decoration.animationCurve.defaultCurve,
          clipBehavior: Clip.antiAlias,
          width: _width,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _creditor.selected ? color.primary : Colors.transparent,
              width: 2,
            ),
          ),
          decoration: BoxDecoration(
            color: color.secondaryBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: AspectRatio(
            aspectRatio: _creditorItemAspectRatio,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(_creditor.logo),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => _onPressed(_creditor),
            ),
          ),
        ),
      ],
    );
  }
}
