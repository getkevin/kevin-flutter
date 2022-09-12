import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_ui_font.dart';

part 'kevin_ui_font_entity.g.dart';

@JsonSerializable(createFactory: false, createToJson: true)
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

  Map<String, dynamic> toJson() => _$KevinUiFontEntityToJson(this);
}

extension Entity on KevinUiFont {
  KevinUiFontEntity toEntity() => KevinUiFontEntity.fromModel(this);
}
