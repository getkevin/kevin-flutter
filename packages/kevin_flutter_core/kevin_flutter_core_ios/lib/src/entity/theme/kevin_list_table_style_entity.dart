import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_list_table_style_entity_json.dart';

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

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinListTableStyle {
  KevinListTableStyleEntity toEntity() =>
      KevinListTableStyleEntity.fromModel(this);
}
