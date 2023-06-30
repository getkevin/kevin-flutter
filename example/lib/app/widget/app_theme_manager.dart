import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kevin_flutter_example/theme/app_theme_data.dart';
import 'package:kevin_flutter_example/theme/app_theme_mode.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class AppThemeManager extends StatefulWidget {
  final Function(AppThemeMode)? _onThemeChanged;
  final Widget _child;

  const AppThemeManager({
    Key? key,
    Function(AppThemeMode)? onThemeChanged,
    required Widget child,
  })  : _onThemeChanged = onThemeChanged,
        _child = child,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AppThemeManagerState();
}

class _AppThemeManagerState extends State<AppThemeManager>
    with WidgetsBindingObserver {
  late AppThemeMode _mode;

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
      mode: _mode,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _mode == AppThemeMode.dark
            ? SystemUiOverlayStyle.light
                .copyWith(statusBarColor: Colors.transparent)
            : SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: Colors.transparent),
        child: widget._child,
      ),
    );
  }

  void _setUpAppTheme() {
    final dispatcher = PlatformDispatcher.instance;
    _mode = _getThemeMode(dispatcher: dispatcher);

    dispatcher.onPlatformBrightnessChanged = () {
      setState(() {
        final mode = _getThemeMode(dispatcher: dispatcher);
        _mode = mode;
        widget._onThemeChanged?.call(mode);
      });
    };
  }

  AppThemeMode _getThemeMode({required PlatformDispatcher dispatcher}) {
    return dispatcher.platformBrightness == Brightness.dark
        ? AppThemeMode.dark
        : AppThemeMode.light;
  }
}
