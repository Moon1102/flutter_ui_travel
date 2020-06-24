import 'dart:math';

import 'package:flutter/material.dart';

class IrregularBoxPainter extends CustomPainter {
  final Color color;

  IrregularBoxPainter({this.color});

  num degToRad(num deg) => deg * (pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    final h = 200;
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = color;

    final path = Path();
    path.moveTo(0, 0);
    path.relativeQuadraticBezierTo(
        size.width / 24, h / 3, size.width / 4, h / 3.2);
    path.lineTo(size.width * 10 / 12, h / 3.2);

    path.relativeQuadraticBezierTo(size.width * 2 / 12, h / 24,
        size.width * 2 / 12, h / 3.2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
