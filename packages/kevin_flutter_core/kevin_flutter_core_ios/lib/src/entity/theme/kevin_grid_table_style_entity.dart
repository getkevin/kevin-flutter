import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_grid_table_style_entity_json.dart';

class KevinGridTableStyleEntity {
  final int? cellBackgroundColor;
  final int? cellSelectedBackgroundColor;
  final double? cellCornerRadius;

  const KevinGridTableStyleEntity({
    this.cellBackgroundColor,
    this.cellSelectedBackgroundColor,
    this.cellCornerRadius,
  });

  factory KevinGridTableStyleEntity.fromModel(KevinGridTableStyle model) =>
      KevinGridTableStyleEntity(
        cellBackgroundColor: model.cellBackgroundColor?.value,
        cellSelectedBackgroundColor: model.cellSelectedBackgroundColor?.value,
        cellCornerRadius: model.cellCornerRadius,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinGridTableStyle {
  KevinGridTableStyleEntity toEntity() =>
      KevinGridTableStyleEntity.fromModel(this);
}
