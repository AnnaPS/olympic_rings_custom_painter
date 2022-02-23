import 'dart:math';

import 'package:flutter/material.dart';

class OlympicRingPainter extends CustomPainter {
  OlympicRingPainter({
    required this.progress,
    required this.ringColor,
    required this.animation,
  })  : _offset = Tween<double>(begin: 0, end: progress).animate(animation),
        super(repaint: animation);
  // a value between 0 and 1
  final double progress;
  // foreground color to the ring
  final Color ringColor;
  // Animation controller
  final Animation<double> animation;
  // Animation offset
  final Animation<double> _offset;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..color = Colors.grey.withOpacity(0.01)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = ringColor
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * _offset.value / 60,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant OlympicRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
