import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/theme/kevin_colors.dart';

class AppColorBottomSheet extends Equatable {
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;

  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;

  final Color error;
  final Color onError;

  final Color surface;
  final Color onSurface;

  final Color controlHighlight;
  final Color controlActivated;

  final Color navigationBar;

  const AppColorBottomSheet({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.controlHighlight,
    required this.controlActivated,
    required this.navigationBar,
  });

  const AppColorBottomSheet.light()
      : primary = KevinColors.blue,
        primaryVariant = KevinColors.darkBlue,
        onPrimary = KevinColors.white,
        secondary = KevinColors.blue,
        secondaryVariant = KevinColors.darkBlue,
        onSecondary = KevinColors.white,
        error = KevinColors.warningRed,
        onError = KevinColors.white,
        surface = KevinColors.white,
        onSurface = KevinColors.black,
        controlHighlight = KevinColors.blue,
        controlActivated = KevinColors.gray5,
        navigationBar = KevinColors.black30;

  const AppColorBottomSheet.dark()
      : primary = KevinColors.blue,
        primaryVariant = KevinColors.darkBlue,
        onPrimary = KevinColors.white,
        secondary = KevinColors.blue,
        secondaryVariant = KevinColors.darkBlue,
        onSecondary = KevinColors.white,
        error = KevinColors.warningRed,
        onError = KevinColors.white,
        surface = KevinColors.gray0,
        onSurface = KevinColors.white,
        controlHighlight = KevinColors.blue,
        controlActivated = KevinColors.blue,
        navigationBar = KevinColors.black30;

  @override
  List<Object?> get props => [
        primary,
        primaryVariant,
        onPrimary,
        secondary,
        secondaryVariant,
        onSecondary,
        error,
        onError,
        surface,
        onSurface,
        controlHighlight,
        controlActivated,
        navigationBar,
      ];
}
