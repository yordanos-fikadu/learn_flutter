import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // Tween(begin: 20, end: 10).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: _buildAnimatedPhysicalModel()),
    );
  }

  Widget _buildAnimatedModalBarrier(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _showDialog(context); // Show the modal dialog
        },
        child: Text('Show Dialog'),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            AnimatedModalBarrier(
              color: AlwaysStoppedAnimation<Color>(
                  Colors.red.withOpacity(0.4)), // Barrier color
              dismissible: false, // Prevent dismissal on tap
            ),
            AlertDialog(
              title: Text('Alert Dialog'),
              content: Text(
                  'This is an example of a modal dialog with an AnimatedModalBarrier.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  AnimatedBuilder _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          color: Colors.green,
          child: const Center(
            child: Text('Whee!'),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 0.2 * math.pi,
          child: child,
        );
      },
    );
  }

  bool selected = false;
  GestureDetector _buildAnimagedAlign() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedAlign(
        alignment: selected ? Alignment.centerRight : Alignment.center,
        duration: Duration(seconds: 1),
        child: FlutterLogo(
          size: 50,
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topStart,
          duration: const Duration(seconds: 2),
          curve: Curves.elasticInOut,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }

  Widget _buildAnimatedCrossFade() {
    return AnimatedCrossFade(
      firstCurve: Curves.bounceIn,
      secondCurve: Curves.bounceOut,
      sizeCurve: Curves.fastOutSlowIn,
      firstChild: GestureDetector(
        onTap: () => setState(() {
          selected = !selected;
        }),
        child: Container(
          color: Colors.red,
          height: 50,
          child: Text('First'),
        ),
      ),
      secondChild: GestureDetector(
        onTap: () => setState(() {
          selected = !selected;
        }),
        child: Container(
          color: Colors.green,
          height: 50,
          child: Text('Second'),
        ),
      ),
      crossFadeState:
          selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(seconds: 1),
    );
  }

  Widget _buildAnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      overflow: selected ? TextOverflow.fade : TextOverflow.visible,
      child: GestureDetector(
        onTap: () => setState(() {
          selected = !selected;
        }),
        child: Text('DATA'),
      ),
      style: TextStyle(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: selected ? 40 : 60),
      curve: Curves.linearToEaseOut,
      duration: Duration(seconds: 5),
    );
  }

  final GlobalKey<AnimatedListState> animatedListKey =
      GlobalKey<AnimatedListState>();
  int count = 6;
  List<int> list = [1, 2, 3, 4, 5];

  void _addItem() {
    list.add(list.length + 1);
    animatedListKey.currentState!.insertItem(list.length - 1);
  }

  void _removeItem(int index) {
    final removedItem = list.removeAt(index);
    animatedListKey.currentState!.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedItem, animation),
    );
  }

  Widget _buildAnimatedList() {
    return Scaffold(
      body: AnimatedList(
        key: animatedListKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: SizedBox(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: Center(child: Text('${list[index]}')),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        _removeItem(index);
                      },
                      child: Icon(Icons.minimize_outlined),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  bool opacity = false;
  double complityVisible = 1;
  double slightlyVisible = 0.5;
  Widget _buildAnimatedOpacity() {
    return Center(
        child: AnimatedOpacity(
      curve: Curves.bounceIn,
      opacity: opacity ? slightlyVisible : complityVisible,
      duration: Duration(seconds: 1),
      child: GestureDetector(
        onTap: () => setState(() {
          opacity = !opacity;
        }),
        child: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(255, 30, 214, 30),
            height: 200,
            width: 200,
            child: Text('data')),
      ),
    ));
  }

  Widget _buildAnimatedPhysicalModel() {
    return GestureDetector(
        onTap: () => setState(() {
              selected = !selected;
            }),
        child: AnimatedPhysicalModel(
            curve: selected ? Curves.linear : Curves.bounceIn,
            child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                child: Text('data')),
            shape: BoxShape.rectangle,
            elevation: selected ? 49 : 3,
            color: selected ? Colors.green : Colors.blue,
            shadowColor: selected ? Colors.black : Colors.red,
            duration: Duration(seconds: 2)));
  }
}

Widget _buildRemovedItem(int item, Animation<double> animation) {
  return SizeTransition(
    sizeFactor: animation,
    child: SizedBox(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: Center(child: Text('$item')),
      ),
    ),
  );
}
