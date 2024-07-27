import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  AnimatedPositionedWidgetState createState() =>
      AnimatedPositionedWidgetState();
}

class AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _isMoved ? 100 : 50,
            top: _isMoved ? 100 : 50,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.purple,
              child: const Center(
                child: Text(
                  "I'll move!",
                  style: TextStyle(color: Colors.white,),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 120,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isMoved = !_isMoved;
                });
              },
              child: const Text('Move Widget'),
            ),
          ),
        ],
      ),
    );
  }
}
