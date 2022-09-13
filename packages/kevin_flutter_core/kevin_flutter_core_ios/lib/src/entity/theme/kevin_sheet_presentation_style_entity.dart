import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_sheet_presentation_style_entity_json.dart';

class KevinSheetPresentationStyleEntity {
  final int? dragIndicatorTintColor;
  final int? backgroundColor;
  final KevinUiFontEntity? titleLabelFont;
  final double? cornerRadius;

  const KevinSheetPresentationStyleEntity({
    this.dragIndicatorTintColor,
    this.backgroundColor,
    this.titleLabelFont,
    this.cornerRadius,
  });

  factory KevinSheetPresentationStyleEntity.fromModel(
    KevinSheetPresentationStyle model,
  ) =>
      KevinSheetPresentationStyleEntity(
        dragIndicatorTintColor: model.dragIndicatorTintColor?.value,
        backgroundColor: model.backgroundColor?.value,
        titleLabelFont: model.titleLabelFont?.toEntity(),
        cornerRadius: model.cornerRadius,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinSheetPresentationStyle {
  KevinSheetPresentationStyleEntity toEntity() =>
      KevinSheetPresentationStyleEntity.fromModel(this);
}
