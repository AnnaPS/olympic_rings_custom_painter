import 'package:custom_painter/ui/olympic_ring/olympic_ring_painter.dart';
import 'package:flutter/material.dart';

class OlympicRingWidget extends StatelessWidget {
  const OlympicRingWidget(
      {Key? key,
      required this.ringColor,
      required this.progress,
      required this.animation})
      : super(key: key);

  final double progress;
  final Color ringColor;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width * .25,
      child: CustomPaint(
        painter: OlympicRingPainter(
          progress: progress,
          ringColor: ringColor,
          animation: animation,
        ),
      ),
    );
  }
}
