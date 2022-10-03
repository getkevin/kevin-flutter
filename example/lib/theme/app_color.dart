import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/theme/app_color_bottom_sheet.dart';
import 'package:kevin_flutter_example/theme/kevin_colors.dart';

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
      : primary = KevinColors.blue,
        primaryVariant = KevinColors.darkBlue,
        onPrimary = KevinColors.white,
        secondary = KevinColors.blue,
        secondaryVariant = KevinColors.darkBlue,
        onSecondary = KevinColors.white,
        text = KevinColors.darkBlue,
        controlHighlight = KevinColors.blue,
        statusBar = KevinColors.black30,
        navigationBar = KevinColors.extraLightBlue,
        primaryBackground = KevinColors.extraLightBlue,
        onBackground = KevinColors.black,
        secondaryBackground = KevinColors.white,
        selectedOnSecondary = KevinColors.gray5,
        rippleOnPrimary = KevinColors.blue,
        toolbar = KevinColors.extraLightBlue,
        primaryText = KevinColors.black,
        secondaryText = KevinColors.gray1,
        surface = KevinColors.white,
        onSurface = KevinColors.black,
        error = KevinColors.warningRed,
        onError = KevinColors.white,
        inputUnfocusedBorder = KevinColors.gray5,
        icon = KevinColors.gray2,
        bottomSheet = const AppColorBottomSheet.light();

  const AppColor.dark()
      : primary = KevinColors.blue,
        primaryVariant = KevinColors.darkBlue,
        onPrimary = KevinColors.white,
        secondary = KevinColors.blue,
        secondaryVariant = KevinColors.darkBlue,
        onSecondary = KevinColors.white,
        text = KevinColors.white,
        controlHighlight = KevinColors.blue,
        statusBar = Colors.transparent,
        navigationBar = KevinColors.extraLightBlue,
        primaryBackground = KevinColors.black,
        onBackground = KevinColors.white,
        secondaryBackground = KevinColors.gray0,
        selectedOnSecondary = KevinColors.blue,
        rippleOnPrimary = KevinColors.blue,
        toolbar = KevinColors.black,
        primaryText = KevinColors.white,
        secondaryText = KevinColors.gray1,
        surface = KevinColors.gray0,
        onSurface = KevinColors.white,
        error = KevinColors.warningRed,
        onError = KevinColors.white,
        inputUnfocusedBorder = KevinColors.black30,
        icon = KevinColors.gray2,
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
