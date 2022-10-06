import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

class KevinNavigationLinkStyle {
  final Color? backgroundColor;
  final KevinUiFont? titleLabelFont;
  final Color? selectedBackgroundColor;
  final double? cornerRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Uint8List? chevronImage;

  const KevinNavigationLinkStyle({
    this.backgroundColor,
    this.titleLabelFont,
    this.selectedBackgroundColor,
    this.cornerRadius,
    this.borderWidth,
    this.borderColor,
    this.chevronImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'backgroundColor': backgroundColor?.value,
      'titleLabelFont': titleLabelFont?.toMap(),
      'selectedBackgroundColor': selectedBackgroundColor?.value,
      'cornerRadius': cornerRadius,
      'borderWidth': borderWidth,
      'borderColor': borderColor?.value,
      'chevronImage': chevronImage?.toList(),
    };
  }
}
