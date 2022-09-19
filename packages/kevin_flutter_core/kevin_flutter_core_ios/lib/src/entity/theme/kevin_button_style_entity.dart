import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_size_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_button_style_entity_json.dart';

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

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinButtonStyle {
  KevinButtonStyleEntity toEntity() => KevinButtonStyleEntity.fromModel(this);
}
