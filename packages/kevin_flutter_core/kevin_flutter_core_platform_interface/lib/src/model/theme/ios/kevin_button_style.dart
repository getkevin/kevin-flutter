import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_size.dart';
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
  final KevinSize? shadowOffset;
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

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'backgroundColor': backgroundColor?.value,
      'titleLabelTextColor': titleLabelTextColor?.value,
      'titleLabelFont': titleLabelFont?.toMap(),
      'cornerRadius': cornerRadius,
      'shadowRadius': shadowRadius,
      'shadowOpacity': shadowOpacity,
      'shadowOffset': shadowOffset?.toMap(),
      'shadowColor': shadowColor?.value,
    };
  }
}
