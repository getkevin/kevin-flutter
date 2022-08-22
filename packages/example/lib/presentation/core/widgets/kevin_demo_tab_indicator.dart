import 'package:flutter/material.dart';

class KevinDemoTabIndicator extends Decoration {
  final double indicatorHeight;
  final double indicatorRoundingRadius;
  final Color indicatorColor;
  final double indicatorPadding;

  const KevinDemoTabIndicator({
    required this.indicatorHeight,
    required this.indicatorRoundingRadius,
    required this.indicatorColor,
    this.indicatorPadding = 0,
  });

  @override
  _RTIPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RTIPainter(this, onChanged);
  }
}

class _RTIPainter extends BoxPainter {
  final KevinDemoTabIndicator decoration;

  _RTIPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final rect = Offset(
          offset.dx + decoration.indicatorPadding,
          (configuration.size!.height - decoration.indicatorHeight) - 8,
        ) &
        Size(
          configuration.size!.width - decoration.indicatorPadding * 2,
          decoration.indicatorHeight,
        );

    final paint = Paint();
    paint.color = decoration.indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        Radius.circular(decoration.indicatorRoundingRadius),
      ),
      paint,
    );
  }
}
