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


class KevinThemeIos {
  final KevinInsets? insets;
  final KevinGeneralStyle? generalStyle;
  final KevinNavigationBarStyle? navigationBarStyle;
  final KevinSheetPresentationStyle? sheetPresentationStyle;
  final KevinSectionStyle? sectionStyle;
  final KevinGridTableStyle? gridTableStyle;
  final KevinListTableStyle? listTableStyle;
  final KevinNavigationLinkStyle? navigationLinkStyle;
  final KevinButtonStyle? mainButtonStyle;
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
}
