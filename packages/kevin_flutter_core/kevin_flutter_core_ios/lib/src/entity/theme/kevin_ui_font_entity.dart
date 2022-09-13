import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_ui_font_entity_json.dart';

class KevinUiFontEntity {
  final double size;
  final String weight;

  const KevinUiFontEntity({
    required this.size,
    required this.weight,
  });

  factory KevinUiFontEntity.fromModel(KevinUiFont model) => KevinUiFontEntity(
        size: model.size,
        weight: model.weight.name,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinUiFont {
  KevinUiFontEntity toEntity() => KevinUiFontEntity.fromModel(this);
}
