import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_color_bottom_sheet.dart';

class AppColor extends Equatable {
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;

  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;

  final Color text;
  final Color controlHighlight;

  final Color statusBar;
  final Color navigationBar;

  final Color primaryBackground;
  final Color onBackground;
  final Color secondaryBackground;
  final Color selectedOnSecondary;
  final Color rippleOnPrimary;
  final Color toolbar;
  final Color primaryText;
  final Color secondaryText;

  final Color surface;
  final Color onSurface;

  final Color error;
  final Color onError;

  final Color inputUnfocusedBorder;

  final Color icon;

  final AppColorBottomSheet bottomSheet;

  const AppColor.light()
      : primary = _KevinColors.blue,
        primaryVariant = _KevinColors.darkBlue,
        onPrimary = _KevinColors.white,
        secondary = _KevinColors.blue,
        secondaryVariant = _KevinColors.darkBlue,
        onSecondary = _KevinColors.white,
        text = _KevinColors.darkBlue,
        controlHighlight = _KevinColors.blue,
        statusBar = _KevinColors.black30,
        navigationBar = _KevinColors.extraLightBlue,
        primaryBackground = _KevinColors.extraLightBlue,
        onBackground = _KevinColors.black,
        secondaryBackground = _KevinColors.white,
        selectedOnSecondary = _KevinColors.gray5,
        rippleOnPrimary = _KevinColors.blue,
        toolbar = _KevinColors.extraLightBlue,
        primaryText = _KevinColors.black,
        secondaryText = _KevinColors.gray1,
        surface = _KevinColors.white,
        onSurface = _KevinColors.black,
        error = _KevinColors.warningRed,
        onError = _KevinColors.white,
        inputUnfocusedBorder = _KevinColors.gray5,
        icon = _KevinColors.gray2,
        bottomSheet = const AppColorBottomSheet.light();

  const AppColor.dark()
      : primary = _KevinColors.blue,
        primaryVariant = _KevinColors.darkBlue,
        onPrimary = _KevinColors.white,
        secondary = _KevinColors.blue,
        secondaryVariant = _KevinColors.darkBlue,
        onSecondary = _KevinColors.white,
        text = _KevinColors.white,
        controlHighlight = _KevinColors.blue,
        statusBar = Colors.transparent,
        navigationBar = _KevinColors.extraLightBlue,
        primaryBackground = _KevinColors.black,
        onBackground = _KevinColors.white,
        secondaryBackground = _KevinColors.gray0,
        selectedOnSecondary = _KevinColors.blue,
        rippleOnPrimary = _KevinColors.blue,
        toolbar = _KevinColors.black,
        primaryText = _KevinColors.white,
        secondaryText = _KevinColors.gray1,
        surface = _KevinColors.gray0,
        onSurface = _KevinColors.white,
        error = _KevinColors.warningRed,
        onError = _KevinColors.white,
        inputUnfocusedBorder = _KevinColors.black30,
        icon = _KevinColors.gray2,
        bottomSheet = const AppColorBottomSheet.dark();

  const AppColor({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.text,
    required this.controlHighlight,
    required this.statusBar,
    required this.navigationBar,
    required this.primaryBackground,
    required this.onBackground,
    required this.secondaryBackground,
    required this.selectedOnSecondary,
    required this.rippleOnPrimary,
    required this.toolbar,
    required this.primaryText,
    required this.secondaryText,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.inputUnfocusedBorder,
    required this.icon,
    required this.bottomSheet,
  });

  @override
  List<Object?> get props => [
        primary,
        primaryVariant,
        onPrimary,
        secondary,
        secondaryVariant,
        onSecondary,
        text,
        controlHighlight,
        statusBar,
        navigationBar,
        primaryBackground,
        onBackground,
        secondaryBackground,
        selectedOnSecondary,
        rippleOnPrimary,
        toolbar,
        primaryText,
        secondaryText,
        surface,
        onSurface,
        error,
        onError,
        inputUnfocusedBorder,
        icon,
        bottomSheet,
      ];
}

class _KevinColors {
  static const black = Color(0xFF121212);
  static const black30 = Color(0x4DFFFFFF);

  static const white = Colors.white;

  static const warningRed = Color(0xFFFF3B30);

  static const blue = Color(0xFF5D80FE);
  static const darkBlue = Color(0xFF0B1E42);
  static const extraLightBlue = Color(0xFFF2F2F7);

  static const gray0 = Color(0xFF373C42);
  static const gray1 = Color(0xFF7C8894);
  static const gray2 = Color(0xFFBCC4CC);
  static const gray5 = Color(0xFFE6E7EE);
// TODO: Not used now, maybe can be deleted
// static const metallicGray = Color(0xFF90A4AE);
}
