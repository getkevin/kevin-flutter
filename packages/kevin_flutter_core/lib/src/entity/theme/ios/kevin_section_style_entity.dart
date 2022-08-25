import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_section_style.dart';

part 'kevin_section_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
class KevinSectionStyleEntity {
  final KevinUiFontEntity titleLabelFont;

  const KevinSectionStyleEntity({
    required this.titleLabelFont,
  });

  factory KevinSectionStyleEntity.fromModel(KevinSectionStyle model) =>
      KevinSectionStyleEntity(
        titleLabelFont: model.titleLabelFont.toEntity(),
      );

  Map<String, dynamic> toJson() => _$KevinSectionStyleEntityToJson(this);
}

extension Entity on KevinSectionStyle {
  KevinSectionStyleEntity toEntity() => KevinSectionStyleEntity.fromModel(this);
}
