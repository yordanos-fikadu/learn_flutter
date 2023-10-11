import 'package:flutter/material.dart';

class BuildWidgets extends StatefulWidget {
  const BuildWidgets({super.key});

  @override
  State<BuildWidgets> createState() => _BuildWidgetsState();
}

class _BuildWidgetsState extends State<BuildWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      backgroundColor: Color.fromARGB(255, 106, 70, 70),
      body: _buildFuture(),
    );
  }

  Image _buildImage() {
    return Image.network(
      'https://th.bing.com/th/id/R.38bdb18ce7deefe7e72824fd9956e156?rik=hY4bt5zKSUq5vA&pid=ImgRaw&r=0',
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildFuture() {
    Future<String> future = Future.delayed(
      Duration(seconds: 5),
      () => 'am avilable now',
    );
    return FutureBuilder<String>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data}');
        } else if (snapshot.hasError) {
          print('object');
        } else {
          print('object');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
