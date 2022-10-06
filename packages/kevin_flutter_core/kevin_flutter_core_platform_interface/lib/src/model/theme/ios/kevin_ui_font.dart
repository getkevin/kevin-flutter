import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_ui_font_weight.dart';

class KevinUiFont {
  final double size;
  final KevinUiFontWeight weight;

  const KevinUiFont({
    required this.size,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'size': size,
      'weight': weight.name,
    };
  }
}
