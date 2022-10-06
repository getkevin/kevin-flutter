import 'package:equatable/equatable.dart';

class CreditorListItem extends Equatable {
  final String logo;
  final String name;
  final String iban;
  final bool selected;

  const CreditorListItem({
    required this.logo,
    required this.name,
    required this.iban,
    required this.selected,
  });

  CreditorListItem copyWith({
    String? logo,
    String? name,
    String? iban,
    bool? selected,
  }) {
    return CreditorListItem(
      logo: logo ?? this.logo,
      name: name ?? this.name,
      iban: iban ?? this.iban,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [logo, name, iban, selected];
}
