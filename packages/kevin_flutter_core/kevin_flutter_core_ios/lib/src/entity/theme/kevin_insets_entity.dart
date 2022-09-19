import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

part 'kevin_insets_entity_json.dart';

class KevinInsetsEntity {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const KevinInsetsEntity({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  factory KevinInsetsEntity.fromModel(KevinInsets model) => KevinInsetsEntity(
        left: model.left,
        top: model.top,
        right: model.right,
        bottom: model.bottom,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on KevinInsets {
  KevinInsetsEntity toEntity() => KevinInsetsEntity.fromModel(this);
}
