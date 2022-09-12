import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_sheet_presentation_style.dart';

part 'kevin_sheet_presentation_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
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

  Map<String, dynamic> toJson() =>
      _$KevinSheetPresentationStyleEntityToJson(this);
}

extension Entity on KevinSheetPresentationStyle {
  KevinSheetPresentationStyleEntity toEntity() =>
      KevinSheetPresentationStyleEntity.fromModel(this);
}
