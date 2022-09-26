import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/theme/app_color.dart';
import 'package:kevin_flutter_example/theme/app_decoration.dart';
import 'package:kevin_flutter_example/theme/app_typography.dart';

class AppThemeData extends Equatable {
  final AppColor color;
  final AppTypography typography;
  final AppDecoration decoration;

  const AppThemeData({
    required this.color,
    required this.typography,
    required this.decoration,
  });

  const AppThemeData.light()
      : color = const AppColor.light(),
        typography = AppTypography.defaultTypography,
        decoration = const AppDecoration();

  const AppThemeData.dark()
      : color = const AppColor.dark(),
        typography = AppTypography.defaultTypography,
        decoration = const AppDecoration();

  @override
  List<Object?> get props => [
        color,
        typography,
        decoration,
      ];
}
