class KevinSize {
  final double width;
  final double height;

  const KevinSize({
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
    };
  }
}
