import 'package:domain/kevin/model/linking_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linking_request_entity.g.dart';

@JsonSerializable(createFactory: false)
class LinkingRequestEntity {
  final List<String> scopes;
  final String redirectUrl;

  const LinkingRequestEntity({
    required this.scopes,
    required this.redirectUrl,
  });

  Map<String, dynamic> toJson() => _$LinkingRequestEntityToJson(this);

  factory LinkingRequestEntity.fromModel(LinkingRequest request) =>
      LinkingRequestEntity(
        scopes: request.scopes,
        redirectUrl: request.redirectUrl,
      );
}
