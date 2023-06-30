import 'package:flutter/painting.dart';

class KevinGridTableStyle {
  final Color? cellBackgroundColor;

  final double? cellCornerRadius;
  final double? cellBorderWidth;
  final Color? cellBorderColor;

  final Color? cellSelectedBackgroundColor;

  final double? cellSelectedBorderWidth;
  final Color? cellSelectedBorderColor;

  const KevinGridTableStyle({
    this.cellBackgroundColor,
    this.cellCornerRadius,
    this.cellBorderWidth,
    this.cellBorderColor,
    this.cellSelectedBackgroundColor,
    this.cellSelectedBorderWidth,
    this.cellSelectedBorderColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'cellBackgroundColor': cellBackgroundColor?.value,
      'cellCornerRadius': cellCornerRadius,
      'cellBorderWidth': cellBorderWidth,
      'cellBorderColor': cellBorderColor?.value,
      'cellSelectedBackgroundColor': cellSelectedBackgroundColor?.value,
      'cellSelectedBorderWidth': cellSelectedBorderWidth,
      'cellSelectedBorderColor': cellSelectedBorderColor?.value,
    };
  }
}
