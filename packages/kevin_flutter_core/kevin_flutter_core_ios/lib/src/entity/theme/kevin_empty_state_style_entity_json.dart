part of 'kevin_empty_state_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinEmptyStateStyleEntity instance,
) =>
    <String, dynamic>{
      'titleTextColor': instance.titleTextColor,
      'titleFont': instance.titleFont?.toJson(),
      'subtitleTextColor': instance.subtitleTextColor,
      'subtitleFont': instance.subtitleFont?.toJson(),
      'cornerRadius': instance.cornerRadius,
      'iconTintColor': instance.iconTintColor,
    };
