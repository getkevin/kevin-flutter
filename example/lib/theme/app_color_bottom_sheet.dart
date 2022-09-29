part of 'app_color.dart';

class AppColorBottomSheet extends Equatable {
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;

  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;

  final Color error;
  final Color onError;

  final Color surface;
  final Color onSurface;

  final Color controlHighlight;
  final Color controlActivated;

  final Color navigationBar;

  const AppColorBottomSheet({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.controlHighlight,
    required this.controlActivated,
    required this.navigationBar,
  });

  const AppColorBottomSheet.light()
      : primary = _KevinColors.blue,
        primaryVariant = _KevinColors.darkBlue,
        onPrimary = _KevinColors.white,
        secondary = _KevinColors.blue,
        secondaryVariant = _KevinColors.darkBlue,
        onSecondary = _KevinColors.white,
        error = _KevinColors.warningRed,
        onError = _KevinColors.white,
        surface = _KevinColors.white,
        onSurface = _KevinColors.black,
        controlHighlight = _KevinColors.blue,
        controlActivated = _KevinColors.gray5,
        navigationBar = _KevinColors.black30;

  const AppColorBottomSheet.dark()
      : primary = _KevinColors.blue,
        primaryVariant = _KevinColors.darkBlue,
        onPrimary = _KevinColors.white,
        secondary = _KevinColors.blue,
        secondaryVariant = _KevinColors.darkBlue,
        onSecondary = _KevinColors.white,
        error = _KevinColors.warningRed,
        onError = _KevinColors.white,
        surface = _KevinColors.gray0,
        onSurface = _KevinColors.white,
        controlHighlight = _KevinColors.blue,
        controlActivated = _KevinColors.blue,
        navigationBar = _KevinColors.black30;

  @override
  List<Object?> get props => [
        primary,
        primaryVariant,
        onPrimary,
        secondary,
        secondaryVariant,
        onSecondary,
        error,
        onError,
        surface,
        onSurface,
        controlHighlight,
        controlActivated,
        navigationBar,
      ];
}
