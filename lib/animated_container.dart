import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  AnimatedContainerWidgetState createState() =>
      AnimatedContainerWidgetState();
}

class AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double width = 100;
  double height = 100;
  Color color = Colors.purple;
  bool isAnimated = false;
  double _opacity = 1.0;


  void animateContainer() {
    setState(() {
      isAnimated = !isAnimated;
      width = isAnimated ? 200 : 100;
      height = isAnimated ? 200 : 100;
      color = isAnimated ? Colors.cyan : Colors.purple;
    });
  }

  void changeOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            width: width,
            height: height,
            color: color,
            duration: const Duration(seconds: 1),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  animateContainer();
                },
                child: const Text('Animate'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  changeOpacity();
                },
                child: const Text('change opacity'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
