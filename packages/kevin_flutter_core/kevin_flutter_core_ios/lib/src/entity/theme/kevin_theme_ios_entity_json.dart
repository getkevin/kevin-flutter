part of 'kevin_theme_ios_entity.dart';

Map<String, dynamic> _toJson(
  KevinThemeIosEntity instance,
) =>
    <String, dynamic>{
      'insets': instance.insets?.toJson(),
      'generalStyle': instance.generalStyle?.toJson(),
      'navigationBarStyle': instance.navigationBarStyle?.toJson(),
      'sheetPresentationStyle': instance.sheetPresentationStyle?.toJson(),
      'sectionStyle': instance.sectionStyle?.toJson(),
      'gridTableStyle': instance.gridTableStyle?.toJson(),
      'listTableStyle': instance.listTableStyle?.toJson(),
      'navigationLinkStyle': instance.navigationLinkStyle?.toJson(),
      'mainButtonStyle': instance.mainButtonStyle?.toJson(),
      'negativeButtonStyle': instance.negativeButtonStyle?.toJson(),
      'textFieldStyle': instance.textFieldStyle?.toJson(),
      'emptyStateStyle': instance.emptyStateStyle?.toJson(),
    };
