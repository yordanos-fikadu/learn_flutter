import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ui/build_flow.dart';

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
        child: _buildLayoutBuilder(),
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
        alignment: Alignment.topCenter,
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

  Widget _buildFractionallySizedBox() {
    return FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.2,
      child: Container(
        color: Colors.amberAccent,
      ),
    );
  }

  Widget _buildLimitedBox() {
    return Container(
      height: 300,
      width: 300,
      color: Colors.green,
      child: LimitedBox(
        maxWidth: 40,
        maxHeight: 40,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }

  _buildTransform() {
    return Column(children: [
      Transform.rotate(
        angle: 2,
        child: Container(height: 50, width: 50, color: Colors.green),
      ),
      Transform.scale(
        scaleX: 2,
        child: Container(height: 50, width: 50, color: Colors.green),
      ),
      Transform.translate(
        offset: const Offset(0.0, 100.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color(0xFF7F7F7F),
          child: const Text('Quarter'),
        ),
      )
    ]);
  }

  int stackIndex = 0;
  _buildIndexedStack() {
    return Column(
      children: [
        IndexedStack(
          index: stackIndex,
          children: [
            Container(
              height: 300,
              width: 400,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: 400,
              color: Colors.green,
            ),
            Container(
              height: 300,
              width: 400,
              color: Colors.blue,
            )
          ],
        ),
        FloatingActionButton(
          onPressed: () => setState(() {
            stackIndex++;
          }),
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => setState(() {
            stackIndex--;
          }),
          child: Icon(Icons.minimize_outlined),
        )
      ],
    );
  }

  _buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (p0, p1) {
        if (p1.maxHeight > 300) {
          return Container(
            height: 400,
            width: 300,
            color: Colors.blue,
          );
        } else {
          return Container(
            height: 400,
            width: 400,
            color: Colors.red,
          );
        }
      },
    );
  }
}
