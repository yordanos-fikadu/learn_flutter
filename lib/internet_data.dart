import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ui/album.dart';
import 'package:flutter_ui/get_http.dart';
import 'package:http/http.dart' as http;

class InternetData extends StatefulWidget {
  const InternetData({super.key});

  @override
  State<InternetData> createState() => _InternetDataState();
}

class _InternetDataState extends State<InternetData> {
  @override
  Widget build(BuildContext context) {
    return GetAlbum();
  }
}
