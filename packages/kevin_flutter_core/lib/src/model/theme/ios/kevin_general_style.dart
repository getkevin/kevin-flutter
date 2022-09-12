import 'package:flutter/painting.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_ui_font.dart';

class KevinGeneralStyle {
  final Color? primaryBackgroundColor;
  final Color? primaryTextColor;
  final Color? secondaryTextColor;
  final Color? actionTextColor;
  final KevinUiFont? primaryFont;
  final KevinUiFont? secondaryFont;

  const KevinGeneralStyle({
    this.primaryBackgroundColor,
    this.primaryTextColor,
    this.secondaryTextColor,
    this.actionTextColor,
    this.primaryFont,
    this.secondaryFont,
  });
}
