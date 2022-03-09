import 'package:flutter/material.dart';

class OlympicGamesButton extends StatelessWidget {
  OlympicGamesButton({
    Key? key,
    required this.end,
    required this.begin,
    required this.animation,
    required this.callback,
  })  : _offset = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(animation),
        super(key: key);
  final Offset begin;
  final Offset end;
  // Animation controller
  final AnimationController animation;
  // Animation offset
  final Animation<Offset> _offset;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _offset,
        child: FloatingActionButton(
          onPressed: callback,
          child: Icon(Icons.airplanemode_active_rounded),
        ),
      ),
    );
  }
}
