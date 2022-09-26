import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback? _onPressed;

  const KevinButton({
    super.key,
    required Widget child,
    required VoidCallback? onPressed,
  })  : _child = child,
        _onPressed = onPressed;

  factory KevinButton.text({
    Key? key,
    required BuildContext context,
    required String text,
    required VoidCallback? onPressed,
  }) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return KevinButton(
      key: key,
      onPressed: onPressed,
      child: Text(
        text,
        style: typography.button.copyWith(color: color.onPrimary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return ElevatedButton(
      onPressed: _onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return color.primary.withOpacity(0.4);
          } else {
            return color.primary;
          }
        }),
        overlayColor:
            MaterialStateProperty.all(color.onPrimary.withOpacity(0.2)),
        fixedSize: MaterialStateProperty.all(
          const Size.fromHeight(48),
        ),
      ),
      child: _child,
    );
  }
}
