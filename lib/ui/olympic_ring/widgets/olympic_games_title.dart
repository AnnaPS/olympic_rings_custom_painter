import 'package:flutter/material.dart';

class OlympicGamesTitle extends StatelessWidget {
  OlympicGamesTitle({
    Key? key,
    required this.title,
    required this.end,
    required this.begin,
    required this.animation,
  })  : _offset = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(animation),
        super(key: key);
  final Offset begin;
  final Offset end;
  final String title;
  // Animation controller
  final AnimationController animation;
  // Animation offset
  final Animation<Offset> _offset;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _offset,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
