import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

class KevinEmptyStateStyle {
  final Color? titleTextColor;
  final KevinUiFont? titleFont;
  final Color? subtitleTextColor;
  final KevinUiFont? subtitleFont;
  final double? cornerRadius;
  final Color? iconTintColor;

  const KevinEmptyStateStyle({
    this.titleTextColor,
    this.titleFont,
    this.subtitleTextColor,
    this.subtitleFont,
    this.cornerRadius,
    this.iconTintColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'titleTextColor': titleTextColor?.value,
      'titleFont': titleFont?.toMap(),
      'subtitleTextColor': subtitleTextColor?.value,
      'subtitleFont': subtitleFont?.toMap(),
      'cornerRadius': cornerRadius,
      'iconTintColor': iconTintColor?.value,
    };
  }
}
