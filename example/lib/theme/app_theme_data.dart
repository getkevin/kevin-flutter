import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/theme/app_color.dart';
import 'package:kevin_flutter_example/theme/app_animation.dart';
import 'package:kevin_flutter_example/theme/app_typography.dart';

class AppThemeData extends Equatable {
  final AppColor color;
  final AppTypography typography;
  final AppAnimation animation;

  const AppThemeData({
    required this.color,
    required this.typography,
    required this.animation,
  });

  const AppThemeData.light()
      : color = const AppColor.light(),
        typography = AppTypography.defaultTypography,
        animation = const AppAnimation();

  const AppThemeData.dark()
      : color = const AppColor.dark(),
        typography = AppTypography.defaultTypography,
        animation = const AppAnimation();

  @override
  List<Object?> get props => [
        color,
        typography,
        animation,
      ];
}
