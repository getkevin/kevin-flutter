import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_button_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_empty_state_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_general_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_grid_table_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_insets_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_list_table_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_navigation_bar_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_navigation_link_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_section_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_sheet_presentation_style_entity.dart';
import 'package:kevin_flutter_core_ios/src/entity/theme/kevin_text_field_style_entity.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_theme_ios_entity_json.dart';

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

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinThemeIos {
  KevinThemeIosEntity toEntity() => KevinThemeIosEntity.fromModel(this);
}
