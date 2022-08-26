import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_ui_font_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_navigation_link_style.dart';

part 'kevin_navigation_link_style_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
class KevinNavigationLinkStyleEntity {
  final int? backgroundColor;
  final KevinUiFontEntity? titleLabelFont;
  final int? selectedBackgroundColor;
  final double? cornerRadius;
  final double? borderWidth;
  final int? borderColor;
  final List<int>? chevronImage;

  const KevinNavigationLinkStyleEntity({
    this.backgroundColor,
    this.titleLabelFont,
    this.selectedBackgroundColor,
    this.cornerRadius,
    this.borderWidth,
    this.borderColor,
    this.chevronImage,
  });

  factory KevinNavigationLinkStyleEntity.fromModel(
    KevinNavigationLinkStyle model,
  ) =>
      KevinNavigationLinkStyleEntity(
        backgroundColor: model.backgroundColor?.value,
        titleLabelFont: model.titleLabelFont?.toEntity(),
        selectedBackgroundColor: model.selectedBackgroundColor?.value,
        cornerRadius: model.cornerRadius,
        borderWidth: model.borderWidth,
        borderColor: model.borderColor?.value,
        chevronImage: model.chevronImage?.toList(),
      );

  Map<String, dynamic> toJson() => _$KevinNavigationLinkStyleEntityToJson(this);
}

extension Entity on KevinNavigationLinkStyle {
  KevinNavigationLinkStyleEntity toEntity() =>
      KevinNavigationLinkStyleEntity.fromModel(this);
}
