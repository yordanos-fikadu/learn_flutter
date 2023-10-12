import 'dart:html';

import 'package:flutter/material.dart';

class TouchInteraction extends StatefulWidget {
  const TouchInteraction({super.key});

  @override
  State<TouchInteraction> createState() => _TouchInteractionState();
}

class _TouchInteractionState extends State<TouchInteraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      backgroundColor: Color.fromARGB(255, 56, 8, 128),
      body: Center(child: _buildLongPressDragable()),
    );
  }

  Widget _buildAbsorbPointer() {
    return AbsorbPointer(
      absorbing: true,
      child: GestureDetector(
        onTap: () => print('object'),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }

  final Key dismissibleKey = Key('value');
  Widget _buildDismissible() {
    return Dismissible(
      key: dismissibleKey,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      background: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      direction: DismissDirection.down,
      secondaryBackground: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    );
  }

  Widget _buildDraggable() {
    return Draggable(
      data: Colors.black,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
      feedback: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      childWhenDragging: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }

  Widget _buildDraggableScrollableSheet() {
    List<Widget> list = List.generate(
        30,
        (index) => Container(
              color: Colors.white,
              height: 30,
              width: 400,
              child: Text('${index}'),
            ));
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(children: list),
        );
      },
    );
  }

  Widget _buildInteractiveViewer() {
    return InteractiveViewer(
        child: Image.network(
            'https://th.bing.com/th/id/R.2bd087aea51a74c9b32183111f36a4ea?rik=OnyeO07EVBPUzQ&pid=ImgRaw&r=0'));
  }

  Widget _buildLongPressDragable() {
    return LongPressDraggable(
        child: Container(
          color: Colors.white,
          height: 100,
          width: 100,
          child: Text('Index'),
        ),
        feedback: Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: Text('Index'),
        ));
  }
}
