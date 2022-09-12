import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_empty_state_style.dart';

part 'kevin_empty_state_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
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

  Map<String, dynamic> toJson() => _$KevinEmptyStateStyleEntityToJson(this);
}

extension Entity on KevinEmptyStateStyle {
  KevinEmptyStateStyleEntity toEntity() =>
      KevinEmptyStateStyleEntity.fromModel(this);
}
