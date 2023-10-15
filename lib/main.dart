import 'package:flutter/material.dart';
import 'package:flutter_ui/build_flow.dart';
import 'package:flutter_ui/build_scrollable.dart';
import 'package:flutter_ui/http/internet_data.dart';
import 'package:flutter_ui/http/post_http.dart';
import 'package:flutter_ui/layout_widget.dart';
import 'package:flutter_ui/paint_and_effect.dart';
import 'package:flutter_ui/text_widget.dart';
import 'package:flutter_ui/video_player.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: PostHttps(),
  )));
}
