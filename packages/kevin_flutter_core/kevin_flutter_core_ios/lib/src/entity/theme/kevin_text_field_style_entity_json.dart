part of 'kevin_text_field_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinTextFieldStyleEntity instance,
) =>
    <String, dynamic>{
      'textColor': instance.textColor,
      'font': instance.font?.toJson(),
      'cornerRadius': instance.cornerRadius,
      'backgroundColor': instance.backgroundColor,
      'borderWidth': instance.borderWidth,
      'borderColor': instance.borderColor,
      'errorBorderColor': instance.errorBorderColor,
      'errorMessageFont': instance.errorMessageFont?.toJson(),
    };
