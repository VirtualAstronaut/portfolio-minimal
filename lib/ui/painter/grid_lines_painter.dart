import 'dart:developer';

import 'package:flutter/material.dart';

class GridLinesPainter extends CustomPainter {
  late final paintData = Paint()
    ..color = Colors.white70
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.square;

  @override
  void paint(Canvas canvas, Size size) {
    drawXGridLine(canvas, size);
    drawYGridLine(canvas, size);
  }

  void drawXGridLine(Canvas canvas, Size size) {
    const count = 10;
    final dividedSpacing = size.width / count;
    for (var i = 0; i <= count; i++) {
      final elementSpacing = dividedSpacing * i;
      final start = Offset(elementSpacing, 0);
      final end = Offset(elementSpacing, size.height);
      canvas.drawLine(start, end, paintData);
    }
  }

  void drawYGridLine(Canvas canvas, Size size) {
    const count = 10;
    final dividedSpacing = size.width / count;
    for (var i = 0; i <= count; i++) {
      final elementSpacing = dividedSpacing * i;
      final start = Offset(0, elementSpacing);
      final end = Offset(size.width, elementSpacing);
      canvas.drawLine(start, end, paintData);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
