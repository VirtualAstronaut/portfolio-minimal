import 'dart:developer';

import 'package:flutter/material.dart';

class GridLinesPainter extends CustomPainter {
  final double ratio;

  late final paintData = Paint()
    ..color = Colors.white
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.square;

  GridLinesPainter({super.repaint, required this.ratio});

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
      final xPosition = (dividedSpacing * ratio) + elementSpacing;
      final start = Offset(xPosition, 0);
      final end = Offset(xPosition, size.height);
      canvas.drawLine(start, end, paintData);
    }
  }

  void drawYGridLine(Canvas canvas, Size size) {
    const count = 10;
    final dividedSpacing = size.width / count;
    for (var i = 0; i <= count; i++) {
      final elementSpacing = dividedSpacing * i;
      final yPosition = (dividedSpacing * ratio) + elementSpacing;
      final start = Offset(0, yPosition);
      final end = Offset(size.width, yPosition);
      canvas.drawLine(start, end, paintData);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
