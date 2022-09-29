import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/app/model/app_routes.dart';
import 'package:kevin_flutter_example/app/widget/app_theme_manager.dart';
import 'package:kevin_flutter_example/main/widget/main_page.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    const lightThemeData = AppThemeData.light();
    const darkThemeData = AppThemeData.dark();

    return AppThemeManager(
      child: MaterialApp(
        builder: (context, widget) => widget!,
        routes: <String, WidgetBuilder>{
          AppRoutes.root: (context) => MainPage.withBloc(),
        },
        theme: _getThemeData(
          themeData: lightThemeData,
          brightness: Brightness.light,
        ),
        darkTheme: _getThemeData(
          themeData: darkThemeData,
          brightness: Brightness.dark,
        ),
      ),
    );
  }

  ThemeData _getThemeData({
    required AppThemeData themeData,
    required Brightness brightness,
  }) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: themeData.color.primaryBackground,
      splashFactory: InkRipple.splashFactory,
      splashColor: themeData.color.controlHighlight.withOpacity(0.5),
      highlightColor: Colors.transparent,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: themeData.color.primary,
        onPrimary: themeData.color.onPrimary,
        secondary: themeData.color.secondary,
        onSecondary: themeData.color.onSecondary,
        error: themeData.color.error,
        onError: themeData.color.onError,
        background: themeData.color.primaryBackground,
        onBackground: themeData.color.onBackground,
        surface: themeData.color.surface,
        onSurface: themeData.color.onSurface,
      ),
    );
  }
}
