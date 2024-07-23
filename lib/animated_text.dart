import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  AnimatedTextState createState() => AnimatedTextState();
}

class AnimatedTextState extends State<AnimatedText> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          style: _isChanged
              ? const TextStyle(
                  fontSize: 30.0,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.normal,
                ),
          duration: const Duration(seconds: 1),
          child: const Text('This is an Animated Text'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isChanged = !_isChanged;
              });
            },
            child: const Text('Animate text'),
          ),
        ),
      ],
    );
  }
}
