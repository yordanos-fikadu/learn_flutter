import 'package:flutter/material.dart';

class AnimatedWidgetExample extends AnimatedWidget {
  AnimatedWidgetExample({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        style: ButtonStyle(
            side: MaterialStatePropertyAll(BorderSide(
          color: Colors.red,
          width: animation.value
        ))),
        onPressed: () => print('hello'),
        child: Text('Click Me'),
      ),
    );
  }
}
