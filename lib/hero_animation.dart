import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      backgroundColor: Colors.blue,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(tag: 'hero', child: Text('Hero')),
        ),
      ),
    );
  }
}
