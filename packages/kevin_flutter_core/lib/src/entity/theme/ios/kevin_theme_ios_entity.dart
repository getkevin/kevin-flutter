import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_button_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_empty_state_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_general_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_grid_table_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_insets_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_list_table_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_navigation_bar_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_navigation_link_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_section_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_sheet_presentation_style_entity.dart';
import 'package:kevin_flutter_core/src/entity/theme/ios/kevin_text_field_style_entity.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_theme_ios.dart';

part 'kevin_theme_ios_entity.g.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
)
class KevinThemeIosEntity {
  final KevinInsetsEntity? insets;
  final KevinGeneralStyleEntity? generalStyle;
  final KevinNavigationBarStyleEntity? navigationBarStyle;
  final KevinSheetPresentationStyleEntity? sheetPresentationStyle;
  final KevinSectionStyleEntity? sectionStyle;
  final KevinGridTableStyleEntity? gridTableStyle;
  final KevinListTableStyleEntity? listTableStyle;
  final KevinNavigationLinkStyleEntity? navigationLinkStyle;
  final KevinButtonStyleEntity? mainButtonStyle;
  final KevinButtonStyleEntity? negativeButtonStyle;
  final KevinTextFieldStyleEntity? textFieldStyle;
  final KevinEmptyStateStyleEntity? emptyStateStyle;

  const KevinThemeIosEntity({
    this.insets,
    this.generalStyle,
    this.navigationBarStyle,
    this.sheetPresentationStyle,
    this.sectionStyle,
    this.gridTableStyle,
    this.listTableStyle,
    this.navigationLinkStyle,
    this.mainButtonStyle,
    this.negativeButtonStyle,
    this.textFieldStyle,
    this.emptyStateStyle,
  });

  factory KevinThemeIosEntity.fromModel(KevinThemeIos model) =>
      KevinThemeIosEntity(
        insets: model.insets?.toEntity(),
        generalStyle: model.generalStyle?.toEntity(),
        navigationBarStyle: model.navigationBarStyle?.toEntity(),
        sheetPresentationStyle: model.sheetPresentationStyle?.toEntity(),
        sectionStyle: model.sectionStyle?.toEntity(),
        gridTableStyle: model.gridTableStyle?.toEntity(),
        listTableStyle: model.listTableStyle?.toEntity(),
        navigationLinkStyle: model.navigationLinkStyle?.toEntity(),
        mainButtonStyle: model.mainButtonStyle?.toEntity(),
        negativeButtonStyle: model.negativeButtonStyle?.toEntity(),
        textFieldStyle: model.textFieldStyle?.toEntity(),
        emptyStateStyle: model.emptyStateStyle?.toEntity(),
      );

  Map<String, dynamic> toJson() => _$KevinThemeIosEntityToJson(this);
}

extension Entity on KevinThemeIos {
  KevinThemeIosEntity toEntity() => KevinThemeIosEntity.fromModel(this);
}
