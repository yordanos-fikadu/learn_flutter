import 'dart:ui';

import 'package:flutter/material.dart';

class PaintAndEffect extends StatefulWidget {
  const PaintAndEffect({super.key});

  @override
  State<PaintAndEffect> createState() => _PaintAndEffectState();
}

class _PaintAndEffectState extends State<PaintAndEffect> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildClipOval(),
    );
  }

  _backDropFilter() {
    return Stack(
      children: [
        Image.network(
            'https://www.oneindia.com/img/1200x80/2016/06/environment-nature-04-1465015585.jpg'),
        Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              )),
        ),
      ],
    );
  }

  _buildClipOval() {
    return ClipOval(
      child: Image.network(
          'https://www.oneindia.com/img/1200x80/2016/06/environment-nature-04-1465015585.jpg'),
    );
  }

  _buildClipRect() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Image.network(
          'https://www.oneindia.com/img/1200x80/2016/06/environment-nature-04-1465015585.jpg'),
    );
  }

  _buildRotatedBox() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        color: Colors.red,
        child: Text('RotatedBox'),
      ),
    );
  }
}
