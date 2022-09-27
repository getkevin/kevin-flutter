import 'package:flutter/cupertino.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinBottomSheetHeader extends StatelessWidget {
  final String _text;

  const KevinBottomSheetHeader({super.key, required String text}) : _text = text;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    return Positioned.fill(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            _text,
            style: typography.headline3,
          ),
        ),
      ),
    );
  }
}