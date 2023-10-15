import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui/http/album.dart';
import 'package:flutter_ui/http/get_http.dart';
import 'package:http/http.dart' as http;

class DeleteHttp extends StatefulWidget {
  const DeleteHttp({super.key});

  @override
  State<DeleteHttp> createState() => _DeleteHttpState();
}

class _DeleteHttpState extends State<DeleteHttp> {
  Future<Album>? _featchAlbum;
  Future<Album> featchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      return Album.getfromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load an album');
    }
  }

  Future<Album> deleteAlbum(String? id) async {
    final response = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
        headers: {'content-type': 'application/json charset=utf-8'});
    if (response.statusCode == 200) {
      return Album.getfromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete the album');
    }
  }

  @override
  void initState() {
    super.initState();
    _featchAlbum = featchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _featchAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data?.title ?? 'Deleted'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _featchAlbum =
                            deleteAlbum(snapshot.data!.id.toString());
                      });
                    },
                    child: const Text('Delete Data'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }
          return CircularProgressIndicator();
        });
  }
}
