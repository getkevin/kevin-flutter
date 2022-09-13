part of 'kevin_sheet_presentation_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinSheetPresentationStyleEntity instance,
) =>
    <String, dynamic>{
      'dragIndicatorTintColor': instance.dragIndicatorTintColor,
      'backgroundColor': instance.backgroundColor,
      'titleLabelFont': instance.titleLabelFont?.toJson(),
      'cornerRadius': instance.cornerRadius,
    };
