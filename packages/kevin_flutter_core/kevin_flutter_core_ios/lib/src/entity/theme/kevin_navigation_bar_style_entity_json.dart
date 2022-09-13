part of 'kevin_navigation_bar_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinNavigationBarStyleEntity instance,
) =>
    <String, dynamic>{
      'titleColor': instance.titleColor,
      'tintColor': instance.tintColor,
      'backgroundColorLightMode': instance.backgroundColorLightMode,
      'backgroundColorDarkMode': instance.backgroundColorDarkMode,
      'backButtonImage': instance.backButtonImage,
      'closeButtonImage': instance.closeButtonImage,
    };
