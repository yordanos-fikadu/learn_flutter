import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui/album.dart';
import 'package:http/http.dart' as http;

class GetAlbum extends StatefulWidget {
  const GetAlbum({super.key});

  @override
  State<GetAlbum> createState() => _GetAlbumState();
}

class _GetAlbumState extends State<GetAlbum> {
  late Future<Album> feachAlbumInstance;
  @override
  void initState() {
    super.initState();
    feachAlbumInstance = feachAlbum();
  }

  Future<Album> feachAlbum() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        headers: {
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
        });
    if (response.statusCode == 200) {
      // 'content-type: application/json; charset=utf-8,'
      return Album.getfromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: feachAlbumInstance,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Card(
            color: Colors.green,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${snapshot.data!.id}')),
                    title: Text('Title: ${snapshot.data!.title}'),
                    subtitle: Text('UserId: ${snapshot.data!.userId}'),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: 1),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
