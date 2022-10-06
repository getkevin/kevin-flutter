import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class AppThemeManager extends StatefulWidget {
  final Widget child;

  const AppThemeManager({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppThemeManagerState();
}

class _AppThemeManagerState extends State<AppThemeManager>
    with WidgetsBindingObserver {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.handlePlatformBrightnessChanged();

    _setUpAppTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lightAppThemeData = AppThemeData.light();
    const darkAppThemeData = AppThemeData.dark();

    return AppTheme(
      lightAppThemeData: lightAppThemeData,
      darkAppThemeData: darkAppThemeData,
      isDarkMode: _isDarkMode,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _isDarkMode
            ? SystemUiOverlayStyle.light
                .copyWith(statusBarColor: Colors.transparent)
            : SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: Colors.transparent),
        child: widget.child,
      ),
    );
  }

  void _setUpAppTheme() {
    final window = WidgetsBinding.instance.window;
    _isDarkMode = window.platformBrightness == Brightness.dark;

    window.onPlatformBrightnessChanged = () {
      setState(() {
        _isDarkMode = window.platformBrightness == Brightness.dark;
      });
    };
  }
}
