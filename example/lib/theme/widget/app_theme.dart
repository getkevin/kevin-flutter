import 'package:flutter/widgets.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData lightAppThemeData;
  final AppThemeData darkAppThemeData;
  final bool isDarkMode;

  const AppTheme({
    Key? key,
    required this.lightAppThemeData,
    required this.darkAppThemeData,
    required this.isDarkMode,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (result == null) {
      throw 'No AppTheme found in the context';
    }

    return result.isDarkMode
        ? result.darkAppThemeData
        : result.lightAppThemeData;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      lightAppThemeData != oldWidget.lightAppThemeData ||
      darkAppThemeData != oldWidget.darkAppThemeData ||
      isDarkMode != oldWidget.isDarkMode;
}
