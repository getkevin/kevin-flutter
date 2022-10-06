import 'package:flutter/cupertino.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinBottomSheetHeader extends StatelessWidget {
  final String _text;
  final bool _positioned;

  const KevinBottomSheetHeader({
    super.key,
    required String text,
    bool positioned = false,
  })  : _text = text,
        _positioned = positioned;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    final child = Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          _text,
          style: typography.headline3,
        ),
      ),
    );

    if (_positioned) {
      return Positioned.fill(child: child);
    }

    return child;
  }
}
