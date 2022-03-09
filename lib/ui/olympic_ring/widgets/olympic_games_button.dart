import 'package:flutter/material.dart';

class OlympicGamesButton extends StatelessWidget {
  const OlympicGamesButton(
      {Key? key, required this.offset, required this.callback})
      : super(key: key);
  final double offset;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: MediaQuery.of(context).size.height * .5,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 2.0, end: .5),
        curve: Curves.bounceIn,
        duration: const Duration(seconds: 1),
        child: FloatingActionButton(
          onPressed: callback,
          child: const Icon(Icons.local_airport),
          splashColor: Colors.lightBlueAccent,
        ),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, offset * value),
            child: child,
          );
        },
      ),
    );
  }
}
