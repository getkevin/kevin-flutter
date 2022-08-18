enum KevinAccountLinkingType {
  bank,
  card;

  static KevinAccountLinkingType? getByName(String name) =>
      KevinAccountLinkingType.values.firstWhereOrNull((t) => t.name == name);
}

extension _FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
