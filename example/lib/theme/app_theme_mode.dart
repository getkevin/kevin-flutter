import 'dart:ui';

AppThemeMode getCurrentAppThemeMode() {
  final dispatcher = PlatformDispatcher.instance;

  if (dispatcher.platformBrightness == Brightness.dark) {
    return AppThemeMode.dark;
  } else {
    return AppThemeMode.light;
  }
}

enum AppThemeMode { light, dark }
