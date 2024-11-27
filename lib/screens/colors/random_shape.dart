import 'package:flutter/material.dart';
import 'dart:math';

class RandomShapePainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;

  RandomShapePainter({required this.fillColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Path randomShapePath = Path();
    final Random random = Random();

    final shapeType = random.nextInt(3);

    switch (shapeType) {
      case 0: // Star
        randomShapePath.moveTo(size.width / 2, 0);
        randomShapePath.lineTo(size.width * 0.6, size.height * 0.35);
        randomShapePath.lineTo(size.width, size.height * 0.35);
        randomShapePath.lineTo(size.width * 0.7, size.height * 0.6);
        randomShapePath.lineTo(size.width * 0.8, size.height);
        randomShapePath.lineTo(size.width / 2, size.height * 0.75);
        randomShapePath.lineTo(size.width * 0.2, size.height);
        randomShapePath.lineTo(size.width * 0.3, size.height * 0.6);
        randomShapePath.lineTo(0, size.height * 0.35);
        randomShapePath.lineTo(size.width * 0.4, size.height * 0.35);
        randomShapePath.close();
        break;
      case 1: // Rectangle
        randomShapePath.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
        break;
      case 2: // Triangle
        randomShapePath.moveTo(size.width / 2, 0);
        randomShapePath.lineTo(size.width, size.height);
        randomShapePath.lineTo(0, size.height);
        randomShapePath.close();
        break;
    }

    canvas.drawPath(randomShapePath, fillPaint);
    canvas.drawPath(randomShapePath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
