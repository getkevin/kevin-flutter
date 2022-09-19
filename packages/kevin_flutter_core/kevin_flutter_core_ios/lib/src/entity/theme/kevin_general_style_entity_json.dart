part of 'kevin_general_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinGeneralStyleEntity instance,
) =>
    <String, dynamic>{
      'primaryBackgroundColor': instance.primaryBackgroundColor,
      'primaryTextColor': instance.primaryTextColor,
      'secondaryTextColor': instance.secondaryTextColor,
      'actionTextColor': instance.actionTextColor,
      'primaryFont': instance.primaryFont?.toJson(),
      'secondaryFont': instance.secondaryFont?.toJson(),
    };
