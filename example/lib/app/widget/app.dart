import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/app/model/app_routes.dart';
import 'package:kevin_flutter_example/app/widget/app_theme_manager.dart';
import 'package:kevin_flutter_example/generated/codegen_loader.g.dart';
import 'package:kevin_flutter_example/main/widget/main_page.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';

part 'device_locale_observer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      useOnlyLangCode: true,
      saveLocale: false,
      path: 'resources/langs',
      assetLoader: const CodegenLoader(),
      child: _DeviceLocaleObserver(
        builder: (context) => AppThemeManager(
          child: MaterialApp(
            builder: (context, widget) => widget!,
            routes: <String, WidgetBuilder>{
              AppRoutes.root: (context) => MainPage.withBloc(),
            },
            theme: _getThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: _getThemeData(
              brightness: Brightness.dark,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
      ),
    );
  }

  ThemeData _getThemeData({
    required Brightness brightness,
  }) {
    final AppThemeData themeData;

    switch (brightness) {
      case Brightness.dark:
        themeData = const AppThemeData.dark();
        break;
      case Brightness.light:
        themeData = const AppThemeData.light();
        break;
    }

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
