import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font.dart';

class KevinSectionStyle {
  final KevinUiFont titleLabelFont;

  const KevinSectionStyle({
    required this.titleLabelFont,
  });

  Map<String, dynamic> toMap() {
    return {
      'titleLabelFont': titleLabelFont.toMap(),
    };
  }
}
