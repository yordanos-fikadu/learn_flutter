import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          color: Colors.yellow,
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
