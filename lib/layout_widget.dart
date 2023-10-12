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
      backgroundColor: Colors.white,
      body: Center(
        child: _buildFittedBox(),
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
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildBaseLine() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Baseline(
          baseline: 90,
          baselineType: TextBaseline.alphabetic,
          child: Text('Baseline')),
    );
  }

  Widget _buildConstraibedBox() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 80),
        child: Column(children: [
          Text('Constrained Box'),
          OutlinedButton(onPressed: () => null, child: Text('Button'))
        ]),
      ),
    );
  }

  Widget _buildExpand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.red,
            height: 20,
            child: Text('1'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.yellow,
            height: 20,
            child: Text('1'),
          ),
        ),
        Container(
          color: Colors.green,
          height: 20,
          child: Text('1'),
        )
      ],
    );
  }

  Widget _buildFittedBox() {
    return Container(
      width: 300,
      height: 400,
      color: Colors.green,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          alignment: Alignment.center,
          width: 900,
          height: 900,
          color: Colors.red,
        ),
      ),
    );
  }
}
