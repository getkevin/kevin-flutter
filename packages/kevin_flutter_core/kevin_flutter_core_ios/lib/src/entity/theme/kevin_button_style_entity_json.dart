part of 'kevin_button_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinButtonStyleEntity instance,
) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'backgroundColor': instance.backgroundColor,
      'titleLabelTextColor': instance.titleLabelTextColor,
      'titleLabelFont': instance.titleLabelFont?.toJson(),
      'cornerRadius': instance.cornerRadius,
      'shadowRadius': instance.shadowRadius,
      'shadowOpacity': instance.shadowOpacity,
      'shadowOffset': instance.shadowOffset?.toJson(),
      'shadowColor': instance.shadowColor,
    };
