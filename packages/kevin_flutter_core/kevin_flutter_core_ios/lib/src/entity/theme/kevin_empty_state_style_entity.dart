import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_empty_state_style_entity_json.dart';

class KevinEmptyStateStyleEntity {
  final int? titleTextColor;
  final KevinUiFontEntity? titleFont;
  final int? subtitleTextColor;
  final KevinUiFontEntity? subtitleFont;
  final double? cornerRadius;
  final int? iconTintColor;

  const KevinEmptyStateStyleEntity({
    this.titleTextColor,
    this.titleFont,
    this.subtitleTextColor,
    this.subtitleFont,
    this.cornerRadius,
    this.iconTintColor,
  });

  factory KevinEmptyStateStyleEntity.fromModel(KevinEmptyStateStyle model) =>
      KevinEmptyStateStyleEntity(
        titleTextColor: model.titleTextColor?.value,
        titleFont: model.titleFont?.toEntity(),
        subtitleTextColor: model.subtitleTextColor?.value,
        subtitleFont: model.subtitleFont?.toEntity(),
        cornerRadius: model.cornerRadius,
        iconTintColor: model.iconTintColor?.value,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinEmptyStateStyle {
  KevinEmptyStateStyleEntity toEntity() =>
      KevinEmptyStateStyleEntity.fromModel(this);
}
