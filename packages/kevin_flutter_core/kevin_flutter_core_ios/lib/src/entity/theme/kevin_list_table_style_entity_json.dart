part of 'kevin_list_table_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinListTableStyleEntity instance,
) =>
    <String, dynamic>{
      'cornerRadius': instance.cornerRadius,
      'isOccupyingFullWidth': instance.isOccupyingFullWidth,
      'cellBackgroundColor': instance.cellBackgroundColor,
      'cellSelectedBackgroundColor': instance.cellSelectedBackgroundColor,
      'titleLabelFont': instance.titleLabelFont?.toJson(),
      'chevronImage': instance.chevronImage,
    };
