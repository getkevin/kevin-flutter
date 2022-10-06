import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_button_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_empty_state_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_general_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_grid_table_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_insets.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_list_table_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_navigation_bar_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_navigation_link_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_section_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_sheet_presentation_style.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_text_field_style.dart';

/// iOS theme class.
///
/// More info: https://developer.kevin.eu/mobile/flutter/ui-customisation/ios-ui-customisations
class KevinThemeIos {
  //  Modify content insets
  final KevinInsets? insets;

  // Modify general shared colour properties between screens
  final KevinGeneralStyle? generalStyle;

  //  Modify navigation bar style if you use our navigation controller
  final KevinNavigationBarStyle? navigationBarStyle;

  //  Modify bottom sheet (for example country selection container)
  final KevinSheetPresentationStyle? sheetPresentationStyle;

  //  Modify style of the separate sections (bank selection titles)
  final KevinSectionStyle? sectionStyle;

  //  Modify grid layout style (bank selection cells)
  final KevinGridTableStyle? gridTableStyle;

  //  Modify list layout style (country selection cells)
  final KevinListTableStyle? listTableStyle;

  //  Modify navigation link style (country selection button)
  final KevinNavigationLinkStyle? navigationLinkStyle;

  //  Modify main button (Continue button) style
  final KevinButtonStyle? mainButtonStyle;

  //  Modify negative button style
  final KevinButtonStyle? negativeButtonStyle;
  final KevinTextFieldStyle? textFieldStyle;
  final KevinEmptyStateStyle? emptyStateStyle;

  const KevinThemeIos({
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

  Map<String, dynamic> toMap() {
    return {
      'insets': insets?.toMap(),
      'generalStyle': generalStyle?.toMap(),
      'navigationBarStyle': navigationBarStyle?.toMap(),
      'sheetPresentationStyle': sheetPresentationStyle?.toMap(),
      'sectionStyle': sectionStyle?.toMap(),
      'gridTableStyle': gridTableStyle?.toMap(),
      'listTableStyle': listTableStyle?.toMap(),
      'navigationLinkStyle': navigationLinkStyle?.toMap(),
      'mainButtonStyle': mainButtonStyle?.toMap(),
      'negativeButtonStyle': negativeButtonStyle?.toMap(),
      'textFieldStyle': textFieldStyle?.toMap(),
      'emptyStateStyle': emptyStateStyle?.toMap(),
    };
  }
}
