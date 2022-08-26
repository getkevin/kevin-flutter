import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_list_table_style.dart';

part 'kevin_list_table_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
class KevinListTableStyleEntity {
  final double? cornerRadius;
  final bool? isOccupyingFullWidth;
  final int? cellBackgroundColor;
  final int? cellSelectedBackgroundColor;
  final KevinUiFontEntity? titleLabelFont;
  final List<int>? chevronImage;

  const KevinListTableStyleEntity({
    this.cornerRadius,
    this.isOccupyingFullWidth,
    this.cellBackgroundColor,
    this.cellSelectedBackgroundColor,
    this.titleLabelFont,
    this.chevronImage,
  });

  factory KevinListTableStyleEntity.fromModel(KevinListTableStyle model) =>
      KevinListTableStyleEntity(
        cornerRadius: model.cornerRadius,
        isOccupyingFullWidth: model.isOccupyingFullWidth,
        cellBackgroundColor: model.cellBackgroundColor?.value,
        cellSelectedBackgroundColor: model.cellSelectedBackgroundColor?.value,
        titleLabelFont: model.titleLabelFont?.toEntity(),
        chevronImage: model.chevronImage?.toList(),
      );

  Map<String, dynamic> toJson() => _$KevinListTableStyleEntityToJson(this);
}

extension Entity on KevinListTableStyle {
  KevinListTableStyleEntity toEntity() =>
      KevinListTableStyleEntity.fromModel(this);
}
