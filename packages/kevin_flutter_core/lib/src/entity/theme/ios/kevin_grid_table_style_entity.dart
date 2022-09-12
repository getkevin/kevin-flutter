import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_grid_table_style.dart';

part 'kevin_grid_table_style_entity.g.dart';

@JsonSerializable(createFactory: false, createToJson: true)
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

  Map<String, dynamic> toJson() => _$KevinGridTableStyleEntityToJson(this);
}

extension Entity on KevinGridTableStyle {
  KevinGridTableStyleEntity toEntity() =>
      KevinGridTableStyleEntity.fromModel(this);
}
