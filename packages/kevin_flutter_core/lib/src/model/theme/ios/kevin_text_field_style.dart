import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_ui_font.dart';

class KevinTextFieldStyle {
  final Color? textColor;
  final KevinUiFont? font;
  final double? cornerRadius;
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;
  final Color? errorBorderColor;
  final KevinUiFont? errorMessageFont;

  const KevinTextFieldStyle({
    this.textColor,
    this.font,
    this.cornerRadius,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.errorBorderColor,
    this.errorMessageFont,
  });
}
