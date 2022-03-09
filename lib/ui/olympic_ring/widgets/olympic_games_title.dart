import 'package:flutter/material.dart';

class OlympicGamesTitle extends StatelessWidget {
  const OlympicGamesTitle({
    Key? key,
    required this.offset,
    required this.title,
  }) : super(key: key);
  final double offset;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: MediaQuery.of(context).size.height * .5,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 2.0, end: .5),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
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
