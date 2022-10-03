part of 'app.dart';

class _DeviceLocaleObserver extends StatefulWidget with WidgetsBindingObserver {
  final WidgetBuilder builder;

  const _DeviceLocaleObserver({
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _DeviceLocaleObserverState();
}

class _DeviceLocaleObserverState extends State<_DeviceLocaleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Kevin.setLocale(context.locale.languageCode);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    final newLocale = locales?.firstOrNull?.languageCode;
    final supportedLocales =
        context.supportedLocales.map((l) => l.languageCode);

    if (newLocale == null || !supportedLocales.contains(newLocale)) return;

    context.setLocale(Locale(newLocale));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
