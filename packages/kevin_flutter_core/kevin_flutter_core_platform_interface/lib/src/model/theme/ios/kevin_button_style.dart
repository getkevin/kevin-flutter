import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

class KevinButtonStyle {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? titleLabelTextColor;
  final KevinUiFont? titleLabelFont;
  final double? cornerRadius;
  final double? shadowRadius;
  final double? shadowOpacity;
  final Size? shadowOffset;
  final Color? shadowColor;

  const KevinButtonStyle({
    this.width,
    this.height,
    this.backgroundColor,
    this.titleLabelTextColor,
    this.titleLabelFont,
    this.cornerRadius,
    this.shadowRadius,
    this.shadowOpacity,
    this.shadowOffset,
    this.shadowColor,
  });
}
