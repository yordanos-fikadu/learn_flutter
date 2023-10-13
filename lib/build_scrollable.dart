import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  @override
  State<ScrollableWidget> createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _buildRefereshIndicator(),
      ),
    );
  }

  List<Widget> list = List.generate(
    40,
    (index) => ListTile(
      title: Text('data'),
    ),
  );
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  _buildRefereshIndicator() {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        displacement: 100,
        strokeWidth: 4.0,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return a Future when code finishes execution.
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        // Pull from top to show refresh indicator.
        child: ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            }));
  }

  Future<void> _buildOnrefesh() {
    return Future.delayed(Duration(seconds: 0));
  }

  Material _buildScrollbar() {
    return Material(
      child: Scrollbar(
        controller: _scrollController, // Set the ScrollController here
        child: ListView.builder(
          controller: _scrollController, // Set the same ScrollController here
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Column(children: list);
          },
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 100, // Set an appropriate height
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: PageController(initialPage: 0),
          children: [
            Container(
              color: Colors.amber,
              height: 50,
              width: 100,
            ),
            Container(
              color: Colors.blue,
              height: 50,
              width: 100,
            ),
            Container(
              color: Colors.red,
              height: 50,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
