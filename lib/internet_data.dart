import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui/album.dart';
import 'package:http/http.dart' as http;

class InternetData extends StatefulWidget {
  const InternetData({super.key});

  @override
  State<InternetData> createState() => _InternetDataState();
}

class _InternetDataState extends State<InternetData> {
  Future<Album> feachAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      FutureBuilder(
        future: feachAlbum(),
        builder: (context, snapshot) {
          return Text('${snapshot.data!.id}');
        },
      ),
    ]);
  }
}
