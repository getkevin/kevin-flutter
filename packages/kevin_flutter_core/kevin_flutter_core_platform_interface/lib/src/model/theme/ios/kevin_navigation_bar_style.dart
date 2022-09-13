import 'dart:typed_data';

import 'package:flutter/painting.dart';

class KevinNavigationBarStyle {
  final Color? titleColor;
  final Color? tintColor;
  final Color? backgroundColorLightMode;
  final Color? backgroundColorDarkMode;
  final Uint8List? backButtonImage;
  final Uint8List? closeButtonImage;

  const KevinNavigationBarStyle({
    this.titleColor,
    this.tintColor,
    this.backgroundColorLightMode,
    this.backgroundColorDarkMode,
    this.backButtonImage,
    this.closeButtonImage,
  });
}
