import 'dart:ui';

import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'This is', style: DefaultTextStyle.of(context).style),
          TextSpan(
              text: 'My', style: TextStyle(color: Colors.amber, fontSize: 50)),
          TextSpan(text: 'Flutter Practice'),
        ]),
      ),
    );
  }
}
