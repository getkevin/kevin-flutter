import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'dragIndicatorTintColor': dragIndicatorTintColor?.value,
      'backgroundColor': backgroundColor?.value,
      'titleLabelFont': titleLabelFont?.toMap(),
      'cornerRadius': cornerRadius,
    };
  }
}
