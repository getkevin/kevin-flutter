import 'package:flutter/painting.dart';

class KevinGridTableStyle {
  final Color? cellBackgroundColor;
  final Color? cellSelectedBackgroundColor;
  final double? cellCornerRadius;

  const KevinGridTableStyle({
    this.cellBackgroundColor,
    this.cellSelectedBackgroundColor,
    this.cellCornerRadius,
  });

  Map<String, dynamic> toMap() {
    return {
      'cellBackgroundColor': cellBackgroundColor?.value,
      'cellSelectedBackgroundColor': cellSelectedBackgroundColor?.value,
      'cellCornerRadius': cellCornerRadius,
    };
  }
}
