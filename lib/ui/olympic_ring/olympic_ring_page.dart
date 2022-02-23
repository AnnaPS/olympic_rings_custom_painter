import 'package:custom_painter/ui/olympic_ring/olympic_ring_widget.dart';
import 'package:flutter/material.dart';

class OlympicRingPage extends StatefulWidget {
  const OlympicRingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OlympicRingPage> createState() => _OlympicRingPageState();
}

class _OlympicRingPageState extends State<OlympicRingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  var alignment = const Alignment(0.0, -.6);

  _OlympicRingPageState() {
    // Start the animation in 1 seconds after screen open.
    Future.delayed(const Duration(seconds: 1))
        .then((_) => _animationController.forward());
  }
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        setState(() {
          alignment = const Alignment(0.0, -.2);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          alignment: alignment,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width * .1,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.blue,
                    animation: _animationController.view,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .25,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.orangeAccent,
                    animation: _animationController.view,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * .4,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.black,
                    animation: _animationController.view,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .55,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.green,
                    animation: _animationController.view,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * .7,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.red,
                    animation: _animationController.view,
                  ),
                ),
              ],
            ),
          ),
        ),
        _animationController.isCompleted
            ? Positioned.fill(
                bottom: MediaQuery.of(context).size.height * .5,
                child: Align(
                  alignment: const Alignment(0, 1),
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 2.0, end: .5),
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      child: const Text(
                        'OLYMPIC GAMES',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 200 * value),
                          child: child,
                        );
                      }),
                ),
              )
            : const SizedBox(),
        _animationController.isCompleted
            ? Positioned.fill(
                bottom: MediaQuery.of(context).size.height * .45,
                child: Align(
                  alignment: const Alignment(0, 1),
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 2.0, end: .5),
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      child: const Text(
                        '2022',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 210 * value),
                          child: child,
                        );
                      }),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
