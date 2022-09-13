import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_navigation_bar_style_entity_json.dart';

class KevinNavigationBarStyleEntity {
  final int? titleColor;
  final int? tintColor;
  final int? backgroundColorLightMode;
  final int? backgroundColorDarkMode;
  final List<int>? backButtonImage;
  final List<int>? closeButtonImage;

  const KevinNavigationBarStyleEntity({
    this.titleColor,
    this.tintColor,
    this.backgroundColorLightMode,
    this.backgroundColorDarkMode,
    this.backButtonImage,
    this.closeButtonImage,
  });

  factory KevinNavigationBarStyleEntity.fromModel(
    KevinNavigationBarStyle model,
  ) =>
      KevinNavigationBarStyleEntity(
        titleColor: model.titleColor?.value,
        tintColor: model.tintColor?.value,
        backgroundColorLightMode: model.backgroundColorLightMode?.value,
        backgroundColorDarkMode: model.backgroundColorDarkMode?.value,
        backButtonImage: model.backButtonImage?.toList(),
        closeButtonImage: model.closeButtonImage?.toList(),
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinNavigationBarStyle {
  KevinNavigationBarStyleEntity toEntity() =>
      KevinNavigationBarStyleEntity.fromModel(this);
}
