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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildAnimatedContainer(),
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
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
