import 'package:flutter/material.dart';

AppThemeMode getCurrentAppThemeMode() {
  final window = WidgetsBinding.instance.window;

  if (window.platformBrightness == Brightness.dark) {
    return AppThemeMode.dark;
  } else {
    return AppThemeMode.light;
  }
}

enum AppThemeMode { light, dark }
