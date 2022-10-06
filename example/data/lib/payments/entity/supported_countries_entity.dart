import 'package:json_annotation/json_annotation.dart';

part 'supported_countries_entity.g.dart';

@JsonSerializable(createToJson: false)
class SupportedCountriesEntity {
  final List<String> data;

  const SupportedCountriesEntity({
    required this.data,
  });

  factory SupportedCountriesEntity.fromJson(Map<String, dynamic> json) =>
      _$SupportedCountriesEntityFromJson(json);
}
