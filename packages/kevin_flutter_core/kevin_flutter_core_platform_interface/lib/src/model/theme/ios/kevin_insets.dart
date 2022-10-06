class KevinInsets {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const KevinInsets({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  Map<String, dynamic> toMap() {
    return {
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
    };
  }
}
