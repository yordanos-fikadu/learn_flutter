import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui/http/album.dart';
import 'package:http/http.dart' as http;

class UpdateHttp extends StatefulWidget {
  const UpdateHttp({super.key});

  @override
  State<UpdateHttp> createState() => _UpdateHttpState();
}

class _UpdateHttpState extends State<UpdateHttp> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;
  @override
  void initState() {
    super.initState();
    _futureAlbum = featchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildFutureBuilder(),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = updateAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
   FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data?.title}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}


Future<Album> updateAlbum(String title) async {
  final response =
      await http.put(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'title': title}));
  if (response.statusCode == 200) {
    return Album.getfromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to Update album');
  }
}

Future<Album> featchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.getfromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load an album');
  }
}
