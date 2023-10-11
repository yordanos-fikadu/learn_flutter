import 'dart:async';

import 'package:flutter/cupertino.dart';
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
      body: Center(child: _buildImage()),
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
        return LinearProgressIndicator();
      },
    );
  }

  Widget _buildStream() {
    final Stream<int> _bids = (() {
      late final StreamController<int> controller;
      controller = StreamController<int>(
        onListen: () async {
          await Future<void>.delayed(const Duration(seconds: 1));
          controller.add(2);
          await Future<void>.delayed(const Duration(seconds: 1));
          await controller.close();
        },
      );
      return controller.stream;
    })();
    return StreamBuilder(
      stream: _bids,
      builder: (context, snapshot) {
        return Text('${snapshot.data}');
      },
    );
  }

  String? key;
  final _formKey = GlobalKey<FormState>();

  RawKeyboardListener _buildRawKeyBoardListener() {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (value) {
        if (value.character!.contains('A')) {
          print('xccxc');
        }
      },
      child: Material(
        child: Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      key = newValue;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(key);
                    }
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
