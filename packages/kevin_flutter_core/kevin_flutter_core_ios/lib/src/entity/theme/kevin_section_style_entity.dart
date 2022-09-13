import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_section_style_entity_json.dart';

class KevinSectionStyleEntity {
  final KevinUiFontEntity titleLabelFont;

  const KevinSectionStyleEntity({
    required this.titleLabelFont,
  });

  factory KevinSectionStyleEntity.fromModel(KevinSectionStyle model) =>
      KevinSectionStyleEntity(
        titleLabelFont: model.titleLabelFont.toEntity(),
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinSectionStyle {
  KevinSectionStyleEntity toEntity() => KevinSectionStyleEntity.fromModel(this);
}
