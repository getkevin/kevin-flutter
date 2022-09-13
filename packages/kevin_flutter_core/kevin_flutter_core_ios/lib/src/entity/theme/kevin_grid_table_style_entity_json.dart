part of 'kevin_grid_table_style_entity.dart';

Map<String, dynamic> _toJson(
  KevinGridTableStyleEntity instance,
) =>
    <String, dynamic>{
      'cellBackgroundColor': instance.cellBackgroundColor,
      'cellSelectedBackgroundColor': instance.cellSelectedBackgroundColor,
      'cellCornerRadius': instance.cellCornerRadius,
    };
