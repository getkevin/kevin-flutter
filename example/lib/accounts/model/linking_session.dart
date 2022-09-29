import 'package:domain/kevin/model/auth_state.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class LinkingSession extends Equatable {
  final AuthState state;
  final KevinCountry preselectedCountry;
  final bool disabledCountrySelection;

  const LinkingSession({
    required this.state,
    required this.preselectedCountry,
    required this.disabledCountrySelection,
  });

  @override
  List<Object?> get props => [
        state,
        preselectedCountry,
        disabledCountrySelection,
      ];
}
