import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_insets.dart';

part 'kevin_insets_insets.g.dart';

@JsonSerializable(createFactory: false, createToJson: true)
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

  Map<String, dynamic> toJson() => _$KevinInsetsEntityToJson(this);
}

extension Entity on KevinInsets {
  KevinInsetsEntity toEntity() => KevinInsetsEntity.fromModel(this);
}
