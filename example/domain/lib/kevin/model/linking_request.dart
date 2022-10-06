import 'package:equatable/equatable.dart';

class LinkingRequest extends Equatable {
  final List<String> scopes;
  final String redirectUrl;

  const LinkingRequest({
    required this.scopes,
    required this.redirectUrl,
  });

  @override
  List<Object?> get props => [
        scopes,
        redirectUrl,
      ];
}
