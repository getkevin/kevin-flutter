import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

enum KevinSnackBarType {
  error,
  success;

  bool get isError => this == error;
}

class KevinSnackBar extends SnackBar {
  const KevinSnackBar({
    super.key,
    required super.content,
    super.padding,
    super.backgroundColor,
    super.behavior,
    super.shape,
  });

  factory KevinSnackBar.themed({
    required BuildContext context,
    required Widget content,
    KevinSnackBarType type = KevinSnackBarType.error,
  }) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return KevinSnackBar(
      content: content,
      padding: const EdgeInsets.all(16),
      backgroundColor: type.isError ? color.error : color.primaryVariant,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  factory KevinSnackBar.text({
    required BuildContext context,
    required String text,
    KevinSnackBarType type = KevinSnackBarType.error,
  }) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return KevinSnackBar.themed(
      context: context,
      type: type,
      content: Text(
        text,
        style: typography.title2.copyWith(
          color: type.isError ? color.onError : color.onPrimary,
        ),
      ),
    );
  }
}
