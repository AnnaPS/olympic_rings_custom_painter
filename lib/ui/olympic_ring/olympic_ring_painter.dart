import 'dart:math';
import 'package:flutter/material.dart';

class OlympicRingPainter extends CustomPainter {
  OlympicRingPainter({
    required this.progress,
    required this.ringColor,
    required this.animation,
  })  : _offset = Tween<double>(begin: 0, end: progress).animate(animation),
        super(repaint: animation);
  // value between 0 and 1
  final double progress;
  // foreground color to the ring
  final Color ringColor;
  // Animation controller
  final Animation<double> animation;
  // Animation offset
  final Animation<double> _offset;

  @override
  void paint(Canvas canvas, Size size) {
    // calculate the width of the circle and divide between 15.0 which is the size of the line
    final strokeWidth = size.width / 15.0;
    // Calculate the center of the circle
    final center = Offset(size.width / 2, size.height / 2);
    // Calculate the radius of the circle minus the width of the line
    final radius = (size.width - strokeWidth) / 2;

    // Paint the background of the circle.
    // In this case is almost transparent
    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..color = Colors.grey.withOpacity(0.01)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Draw circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Set properties for the foreground painter.
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = ringColor
      ..style = PaintingStyle.stroke;

    // Draw arc
    canvas.drawArc(
      // gives the center and the radius of the circle
      Rect.fromCircle(center: center, radius: radius),
      // Start to paint on the left/center of the circle
      pi,
      // 2 pi(360º) * progress / 100.
      // With this formula we can paint the progress of the
      // circle based on the range between 0 and 1
      (2 * pi * _offset.value) / 100,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant OlympicRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
