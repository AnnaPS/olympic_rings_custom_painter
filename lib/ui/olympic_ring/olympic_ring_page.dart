import 'package:custom_painter/ui/olympic_ring/olympic_ring_widget.dart';
import 'package:custom_painter/ui/olympic_ring/widgets/olympic_games_button.dart';
import 'package:custom_painter/ui/olympic_ring/widgets/olympic_games_title.dart';
import 'package:flutter/material.dart';

class OlympicRingPage extends StatefulWidget {
  const OlympicRingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OlympicRingPage> createState() => _OlympicRingPageState();
}

class _OlympicRingPageState extends State<OlympicRingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationRingsController;
  late AnimationController _animationFooterController;
  var alignment = const Alignment(0.0, -.6);
  var olympicTitleBegin = 200.0;
  var olympicTitleEnd = 200.0;
  var yearTitleBegin = 300.0;
  var yearTitleEnd = 300.0;
  var buttonTitleBegin = 0.0;
  var buttonTitleEnd = 1.0;
  var offsetTitle = 250.0;
  var offsetYear = 350.0;
  var offsetButton = 500.0;

  _OlympicRingPageState() {
    // Start the animation in 1 seconds after screen open.
    Future.delayed(const Duration(seconds: 1))
        .then((_) => _animationRingsController.forward());
  }
  @override
  void initState() {
    _animationRingsController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationFooterController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationRingsController.addListener(() {
      if (_animationRingsController.isCompleted) {
        setState(() {
          alignment = const Alignment(0.0, -.2);
        });

        _animationFooterController.forward();
      }
    });
    _animationFooterController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _animationRingsController.dispose();
    _animationFooterController.dispose();
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
                    animation: _animationRingsController.view,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .25,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.orangeAccent,
                    animation: _animationRingsController.view,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * .4,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.black,
                    animation: _animationRingsController.view,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .55,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.green,
                    animation: _animationRingsController.view,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * .7,
                  child: OlympicRingWidget(
                    progress: 100,
                    ringColor: Colors.red,
                    animation: _animationRingsController.view,
                  ),
                ),
              ],
            ),
          ),
        ),
        _animationFooterController.isAnimating ||
                _animationFooterController.isCompleted
            ? OlympicGamesTitle(
                title: 'Olympic Games',
                begin: const Offset(0.0, 15.0),
                end: const Offset(0.0, 2),
                animation: _animationFooterController,
              )
            : const SizedBox(),
        _animationFooterController.isAnimating ||
                _animationFooterController.isCompleted
            ? OlympicGamesTitle(
                title: '2022',
                animation: _animationFooterController,
                begin: const Offset(0.0, 17.0),
                end: const Offset(0.0, 3),
              )
            : const SizedBox(),
        _animationFooterController.isAnimating ||
                _animationFooterController.isCompleted
            ? OlympicGamesButton(
                animation: _animationFooterController,
                begin: const Offset(0.0, 17.0),
                end: const Offset(0.0, 4),
                callback: () {
                  setState(() {
                    _animationFooterController.reverse();
                  });
                },
              )
            : const SizedBox()
      ],
    );
  }
}
