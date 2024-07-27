import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  AnimatedSwitcherWidgetState createState() => AnimatedSwitcherWidgetState();
}

class AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _showFirst
                ? Container(
                    key: const ValueKey(1),
                    width: 150,
                    height: 150,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        "1st widget!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Container(
                    key: const ValueKey(2),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyan,
                    ),
                    child: const Center(
                      child: Text(
                        "2nd widget!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _showFirst = !_showFirst;
                });
              },
              child: Text('Switch to ${_showFirst ? 'Second' : 'First'} widget'),
            ),
          ),
        ],
      ),
    );
  }
}
