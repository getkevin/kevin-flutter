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
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: lightThemeData.color.primaryBackground,
          splashFactory: InkRipple.splashFactory,
          splashColor: lightThemeData.color.controlHighlight.withOpacity(0.5),
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: lightThemeData.color.primary,
            onPrimary: lightThemeData.color.onPrimary,
            secondary: lightThemeData.color.secondary,
            onSecondary: lightThemeData.color.onSecondary,
            error: lightThemeData.color.error,
            onError: lightThemeData.color.onError,
            background: lightThemeData.color.primaryBackground,
            onBackground: lightThemeData.color.onBackground,
            surface: lightThemeData.color.surface,
            onSurface: lightThemeData.color.onSurface,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: darkThemeData.color.primaryBackground,
          splashFactory: InkRipple.splashFactory,
          splashColor: darkThemeData.color.controlHighlight.withOpacity(0.5),
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: darkThemeData.color.primary,
            onPrimary: darkThemeData.color.onPrimary,
            secondary: darkThemeData.color.secondary,
            onSecondary: darkThemeData.color.onSecondary,
            error: darkThemeData.color.error,
            onError: darkThemeData.color.onError,
            background: darkThemeData.color.primaryBackground,
            onBackground: darkThemeData.color.onBackground,
            surface: darkThemeData.color.surface,
            onSurface: darkThemeData.color.onSurface,
          ),
        ),
      ),
    );
  }
}
