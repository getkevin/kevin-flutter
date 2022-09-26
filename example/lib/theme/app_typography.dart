import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';

const _kevinFontFamily = 'kevin_circular_std';

class AppTypography extends Equatable {
  final TextStyle headline1;
  final TextStyle headline3;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle subtitle1;
  final TextStyle caption2;
  final TextStyle button;
  final TextStyle error;

  const AppTypography({
    required this.headline1,
    required this.headline3,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.caption2,
    required this.button,
    required this.error,
  });

  static const defaultTypography = AppTypography(
    headline1: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.2,
      fontFamily: _kevinFontFamily,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      height: 1.28,
      fontFamily: _kevinFontFamily,
    ),
    title1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.31,
      fontFamily: _kevinFontFamily,
    ),
    title2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.31,
      fontFamily: _kevinFontFamily,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.36,
      fontFamily: _kevinFontFamily,
    ),
    caption2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.33,
      fontFamily: _kevinFontFamily,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      height: 1.29,
      fontFamily: _kevinFontFamily,
    ),
    error: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      height: 1.36,
      fontFamily: _kevinFontFamily,
    ),
  );

  @override
  List<Object?> get props => [
        headline1,
        headline3,
        title1,
        title2,
        subtitle1,
        caption2,
        button,
        error,
      ];
}
