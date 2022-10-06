import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinIconButton extends StatelessWidget {
  final String _icon;
  final VoidCallback _onPressed;
  final Color? _iconColor;
  final double? _splashRadius;

  const KevinIconButton({
    super.key,
    required String icon,
    required VoidCallback onPressed,
    Color? iconColor,
    double? splashRadius,
  })  : _icon = icon,
        _onPressed = onPressed,
        _iconColor = iconColor,
        _splashRadius = splashRadius;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    final iconColor = _iconColor ?? color.icon;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        radius: _splashRadius,
        onTap: _onPressed,
        child: Center(
          child: SvgPicture.asset(
            _icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
