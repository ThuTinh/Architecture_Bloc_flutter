import 'dart:math';

import 'package:flutter/material.dart';

class PineChart extends CustomPainter {
  final List<Color> colors;
  final List catelogy;
  PineChart({this.catelogy, this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;
    double total = 0;
    catelogy.forEach((e) => total += e["amount"]);
    var startRadian = -pi / 2;
    for (var i = 0; i < catelogy.length; i++) {
      var currentItem = catelogy[i];
      var sweepradian = (currentItem["amount"] / total) * 2 * pi;
      paint.color = colors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepradian, false, paint);
      startRadian += sweepradian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
