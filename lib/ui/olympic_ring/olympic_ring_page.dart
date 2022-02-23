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
  var alignment = Alignment.center;

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
          alignment = Alignment.topCenter;
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
    return AnimatedAlign(
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
                ringColor: Colors.yellow,
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
    );
  }
}
