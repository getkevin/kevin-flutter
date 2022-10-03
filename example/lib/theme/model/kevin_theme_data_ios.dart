import 'package:flutter/material.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/theme/app_theme_mode.dart';
import 'package:kevin_flutter_example/theme/kevin_colors.dart';

class KevinThemeDataIos {
  final KevinThemeIos data;

  const KevinThemeDataIos({
    required this.data,
  });

  const KevinThemeDataIos.light()
      : data = const KevinThemeIos(
          generalStyle: KevinGeneralStyle(
            primaryTextColor: KevinColors.black,
            primaryBackgroundColor: KevinColors.extraLightBlue,
          ),
          navigationBarStyle: KevinNavigationBarStyle(
            backgroundColorDarkMode: KevinColors.blue,
            backgroundColorLightMode: KevinColors.blue,
          ),
          navigationLinkStyle: KevinNavigationLinkStyle(
            backgroundColor: KevinColors.white,
            selectedBackgroundColor: KevinColors.extraLightBlue,
          ),
          gridTableStyle: KevinGridTableStyle(
            cellBackgroundColor: KevinColors.white,
            cellSelectedBackgroundColor: KevinColors.gray5,
          ),
          sheetPresentationStyle: KevinSheetPresentationStyle(
            backgroundColor: KevinColors.extraLightBlue,
          ),
          listTableStyle: KevinListTableStyle(
            cellSelectedBackgroundColor: KevinColors.gray5,
            cellBackgroundColor: KevinColors.white,
          ),
          mainButtonStyle: KevinButtonStyle(
            backgroundColor: KevinColors.blue,
            shadowColor: Colors.transparent,
          ),
          negativeButtonStyle: KevinButtonStyle(
            titleLabelTextColor: KevinColors.blue,
            shadowColor: Colors.transparent,
          ),
          textFieldStyle: KevinTextFieldStyle(
            textColor: KevinColors.black,
            backgroundColor: KevinColors.extraLightBlue,
            borderColor: KevinColors.gray1,
            errorBorderColor: KevinColors.warningRed,
          ),
          emptyStateStyle: KevinEmptyStateStyle(
            titleTextColor: KevinColors.black,
            subtitleTextColor: KevinColors.gray1,
            iconTintColor: KevinColors.black,
          ),
        );

  const KevinThemeDataIos.dark()
      : data = const KevinThemeIos(
          generalStyle: KevinGeneralStyle(
            primaryTextColor: KevinColors.white,
            primaryBackgroundColor: KevinColors.black,
          ),
          navigationBarStyle: KevinNavigationBarStyle(
            backgroundColorDarkMode: KevinColors.blue,
            backgroundColorLightMode: KevinColors.blue,
          ),
          navigationLinkStyle: KevinNavigationLinkStyle(
            backgroundColor: KevinColors.gray0,
            selectedBackgroundColor: KevinColors.black,
          ),
          gridTableStyle: KevinGridTableStyle(
            cellBackgroundColor: KevinColors.gray0,
            cellSelectedBackgroundColor: KevinColors.blue,
          ),
          sheetPresentationStyle: KevinSheetPresentationStyle(
            backgroundColor: KevinColors.black,
          ),
          listTableStyle: KevinListTableStyle(
            cellSelectedBackgroundColor: KevinColors.blue,
            cellBackgroundColor: KevinColors.gray0,
          ),
          mainButtonStyle: KevinButtonStyle(
            backgroundColor: KevinColors.blue,
            shadowColor: Colors.transparent,
          ),
          negativeButtonStyle: KevinButtonStyle(
            titleLabelTextColor: KevinColors.blue,
            shadowColor: Colors.transparent,
          ),
          textFieldStyle: KevinTextFieldStyle(
            textColor: KevinColors.white,
            backgroundColor: KevinColors.black,
            borderColor: KevinColors.gray1,
            errorBorderColor: KevinColors.warningRed,
          ),
          emptyStateStyle: KevinEmptyStateStyle(
            titleTextColor: KevinColors.white,
            subtitleTextColor: KevinColors.gray1,
            iconTintColor: KevinColors.white,
          ),
        );

  static KevinThemeDataIos getKevinThemeDataIos({required AppThemeMode mode}) =>
      mode == AppThemeMode.dark
          ? const KevinThemeDataIos.dark()
          : const KevinThemeDataIos.light();
}
