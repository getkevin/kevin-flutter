import 'package:flutter/painting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kevin_size_entity.g.dart';

@JsonSerializable(createFactory: false, createToJson: true)
class KevinSizeEntity {
  final double width;
  final double height;

  const KevinSizeEntity({
    required this.width,
    required this.height,
  });

  factory KevinSizeEntity.fromModel(Size model) =>
      KevinSizeEntity(width: model.width, height: model.height);

  Map<String, dynamic> toJson() => _$KevinSizeEntityToJson(this);
}

extension Entity on Size {
  KevinSizeEntity toEntity() => KevinSizeEntity.fromModel(this);
}
