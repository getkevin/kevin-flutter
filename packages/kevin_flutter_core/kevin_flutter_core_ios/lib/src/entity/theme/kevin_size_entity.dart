import 'package:flutter/painting.dart';

part 'kevin_size_entity_json.dart';

class KevinSizeEntity {
  final double width;
  final double height;

  const KevinSizeEntity({
    required this.width,
    required this.height,
  });

  factory KevinSizeEntity.fromModel(Size model) =>
      KevinSizeEntity(width: model.width, height: model.height);

  Map<String, dynamic> toJson() => _toJson(this);
}

extension Entity on Size {
  KevinSizeEntity toEntity() => KevinSizeEntity.fromModel(this);
}
