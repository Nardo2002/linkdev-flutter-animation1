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

  void animateContainer() {
    setState(() {
      isAnimated = !isAnimated;
      width = isAnimated ? 200 : 100;
      height = isAnimated ? 200 : 100;
      color = isAnimated ? Colors.cyan : Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          width: width,
          height: height,
          color: color,
          duration: const Duration(seconds: 1),
        ),
        ElevatedButton(
          onPressed: () {
            animateContainer();
          },
          child: const Text('Animate'),
        ),
      ],
    );
  }
}
