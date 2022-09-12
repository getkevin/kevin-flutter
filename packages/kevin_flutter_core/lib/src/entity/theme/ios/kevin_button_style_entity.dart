import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_size_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_button_style.dart';

part 'kevin_button_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
class KevinButtonStyleEntity {
  final double? width;
  final double? height;
  final int? backgroundColor;
  final int? titleLabelTextColor;
  final KevinUiFontEntity? titleLabelFont;
  final double? cornerRadius;
  final double? shadowRadius;
  final double? shadowOpacity;
  final KevinSizeEntity? shadowOffset;
  final int? shadowColor;

  const KevinButtonStyleEntity({
    this.width,
    this.height,
    this.backgroundColor,
    this.titleLabelTextColor,
    this.titleLabelFont,
    this.cornerRadius,
    this.shadowRadius,
    this.shadowOpacity,
    this.shadowOffset,
    this.shadowColor,
  });

  factory KevinButtonStyleEntity.fromModel(KevinButtonStyle model) =>
      KevinButtonStyleEntity(
        width: model.width,
        height: model.height,
        backgroundColor: model.backgroundColor?.value,
        titleLabelTextColor: model.titleLabelTextColor?.value,
        titleLabelFont: model.titleLabelFont?.toEntity(),
        cornerRadius: model.cornerRadius,
        shadowRadius: model.shadowRadius,
        shadowOpacity: model.shadowOpacity,
        shadowOffset: model.shadowOffset?.toEntity(),
        shadowColor: model.shadowColor?.value,
      );

  Map<String, dynamic> toJson() => _$KevinButtonStyleEntityToJson(this);
}

extension Entity on KevinButtonStyle {
  KevinButtonStyleEntity toEntity() => KevinButtonStyleEntity.fromModel(this);
}
