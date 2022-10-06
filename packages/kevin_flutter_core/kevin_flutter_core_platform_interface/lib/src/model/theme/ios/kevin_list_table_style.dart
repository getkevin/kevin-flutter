import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

class KevinListTableStyle {
  final double? cornerRadius;
  final bool? isOccupyingFullWidth;
  final Color? cellBackgroundColor;
  final Color? cellSelectedBackgroundColor;
  final KevinUiFont? titleLabelFont;
  final Uint8List? chevronImage;

  const KevinListTableStyle({
    this.cornerRadius,
    this.isOccupyingFullWidth,
    this.cellBackgroundColor,
    this.cellSelectedBackgroundColor,
    this.titleLabelFont,
    this.chevronImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'cornerRadius': cornerRadius,
      'isOccupyingFullWidth': isOccupyingFullWidth,
      'cellBackgroundColor': cellBackgroundColor?.value,
      'cellSelectedBackgroundColor': cellSelectedBackgroundColor?.value,
      'titleLabelFont': titleLabelFont?.toMap(),
      'chevronImage': chevronImage?.toList(),
    };
  }
}
