import 'dart:html';

import 'package:flutter/material.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      backgroundColor: Color.fromARGB(255, 56, 8, 128),
      body: Center(
        child: _buildAspectRatio(),
      ),
    );
  }

  Widget _buildAlign() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text('Hello'),
    );
  }

  Widget _buildAspectRatio() {
    return Align(
      child: AspectRatio(
        aspectRatio: 0.5,
        child: Container(
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
