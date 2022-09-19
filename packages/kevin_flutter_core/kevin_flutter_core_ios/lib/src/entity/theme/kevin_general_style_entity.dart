import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_general_style_entity_json.dart';

class KevinGeneralStyleEntity {
  final int? primaryBackgroundColor;
  final int? primaryTextColor;
  final int? secondaryTextColor;
  final int? actionTextColor;
  final KevinUiFontEntity? primaryFont;
  final KevinUiFontEntity? secondaryFont;

  const KevinGeneralStyleEntity({
    this.primaryBackgroundColor,
    this.primaryTextColor,
    this.secondaryTextColor,
    this.actionTextColor,
    this.primaryFont,
    this.secondaryFont,
  });

  factory KevinGeneralStyleEntity.fromModel(KevinGeneralStyle model) =>
      KevinGeneralStyleEntity(
        primaryBackgroundColor: model.primaryBackgroundColor?.value,
        primaryTextColor: model.primaryTextColor?.value,
        secondaryTextColor: model.secondaryTextColor?.value,
        actionTextColor: model.actionTextColor?.value,
        primaryFont: model.primaryFont?.toEntity(),
        secondaryFont: model.secondaryFont?.toEntity(),
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinGeneralStyle {
  KevinGeneralStyleEntity toEntity() => KevinGeneralStyleEntity.fromModel(this);
}