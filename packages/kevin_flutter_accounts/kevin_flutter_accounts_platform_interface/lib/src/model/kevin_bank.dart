class KevinBank {
  final String id;
  final String name;
  final String? officialName;
  final String imageUri;
  final String? bic;

  const KevinBank({
    required this.id,
    required this.name,
    required this.officialName,
    required this.imageUri,
    required this.bic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'officialName': officialName,
      'imageUri': imageUri,
      'bic': bic,
    };
  }

  factory KevinBank.fromMap(Map<String, dynamic> map) {
    return KevinBank(
      id: map['id'] as String,
      name: map['name'] as String,
      officialName: map['officialName'] as String?,
      imageUri: map['imageUri'] as String,
      bic: map['bic'] as String?,
    );
  }
}
