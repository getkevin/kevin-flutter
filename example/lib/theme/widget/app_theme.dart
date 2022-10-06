import 'package:flutter/widgets.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';
import 'package:kevin_flutter_example/theme/app_theme_mode.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData lightAppThemeData;
  final AppThemeData darkAppThemeData;
  final AppThemeMode mode;

  const AppTheme({
    Key? key,
    required this.lightAppThemeData,
    required this.darkAppThemeData,
    required this.mode,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (result == null) {
      throw 'No AppTheme found in the context';
    }

    return result.mode == AppThemeMode.dark
        ? result.darkAppThemeData
        : result.lightAppThemeData;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      lightAppThemeData != oldWidget.lightAppThemeData ||
      darkAppThemeData != oldWidget.darkAppThemeData ||
      mode != oldWidget.mode;
}
