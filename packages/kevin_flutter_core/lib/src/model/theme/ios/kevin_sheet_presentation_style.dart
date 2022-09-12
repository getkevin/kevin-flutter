import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_ui_font.dart';

class KevinSheetPresentationStyle {
  final Color? dragIndicatorTintColor;
  final Color? backgroundColor;
  final KevinUiFont? titleLabelFont;
  final double? cornerRadius;

  const KevinSheetPresentationStyle({
    this.dragIndicatorTintColor,
    this.backgroundColor,
    this.titleLabelFont,
    this.cornerRadius,
  });
}
