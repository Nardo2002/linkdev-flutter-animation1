import 'package:flutter/material.dart';
import 'animated_container.dart';
import 'animated_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Tasks', style: TextStyle(fontWeight: FontWeight.w500)),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[100],
        ),
        body: const SingleChildScrollView(
          child: Column(          
            children: [
              AnimatedContainerWidget(),
              AnimatedText(),
            ],
          ),
        ),
      ),
    );
  }
}

