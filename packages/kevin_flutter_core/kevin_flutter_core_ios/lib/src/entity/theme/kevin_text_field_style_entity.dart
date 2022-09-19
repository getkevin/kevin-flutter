import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_text_field_style_entity_json.dart';

class KevinTextFieldStyleEntity {
  final int? textColor;
  final KevinUiFontEntity? font;
  final double? cornerRadius;
  final int? backgroundColor;
  final double? borderWidth;
  final int? borderColor;
  final int? errorBorderColor;
  final KevinUiFontEntity? errorMessageFont;

  const KevinTextFieldStyleEntity({
    this.textColor,
    this.font,
    this.cornerRadius,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.errorBorderColor,
    this.errorMessageFont,
  });

  factory KevinTextFieldStyleEntity.fromModel(KevinTextFieldStyle model) =>
      KevinTextFieldStyleEntity(
        textColor: model.textColor?.value,
        font: model.font?.toEntity(),
        cornerRadius: model.cornerRadius,
        backgroundColor: model.backgroundColor?.value,
        borderWidth: model.borderWidth,
        borderColor: model.borderColor?.value,
        errorBorderColor: model.errorBorderColor?.value,
        errorMessageFont: model.errorMessageFont?.toEntity(),
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinTextFieldStyle {
  KevinTextFieldStyleEntity toEntity() =>
      KevinTextFieldStyleEntity.fromModel(this);
}
