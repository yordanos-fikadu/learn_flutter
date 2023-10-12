import 'package:flutter/material.dart';

class BuidFlow extends StatefulWidget {
  const BuidFlow({super.key});

  @override
  State<BuidFlow> createState() => _BuidFlowState();
}

class _BuidFlowState extends State<BuidFlow> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isVisible ? _buildFlow() : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          isVisible = !isVisible;
        }),
        child: Icon(Icons.add),
      ),
    );
  }

  _buildFlow() {
    return Center(
      child: Flow(
        delegate: BuildFlows(),
        children: [
          Icon(Icons.home),
          Icon(Icons.calculate),
          Icon(Icons.laptop),
        ],
      ),
    );
  }
}

class BuildFlows extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    context.paintChild(0, transform: Matrix4.identity());
    context.paintChild(1, transform: Matrix4.translationValues(0, 50, 0));
    context.paintChild(2, transform: Matrix4.translationValues(0, 100, 0));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
