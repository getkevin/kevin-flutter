part of 'kevin_navigation_link_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinNavigationLinkStyleEntity instance,
) =>
    <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
      'titleLabelFont': instance.titleLabelFont?.toJson(),
      'selectedBackgroundColor': instance.selectedBackgroundColor,
      'cornerRadius': instance.cornerRadius,
      'borderWidth': instance.borderWidth,
      'borderColor': instance.borderColor,
      'chevronImage': instance.chevronImage,
    };