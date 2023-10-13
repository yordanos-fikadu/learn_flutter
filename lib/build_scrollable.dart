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
          child: _buildStack()
        ));
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/pic.jpg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: const Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 400,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      children: _buildGridTileList(30));
  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Image.asset('images/pic$i.jpg')));

  List<Widget> list = List.generate(60, (index) => Text('$index'));
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

  final List<int> _items = List<int>.generate(50, (int index) => index);

  _buildReorderableListView() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          ListTile(
            key: Key('$index'),
            tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
            title: Text('Item ${_items[index]}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }

  List<Widget> _itemsScroll = List<Widget>.generate(
      50,
      (int index) => Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ));

  _buildListWheelScrollView() {
    return ListWheelScrollView(
        offAxisFraction: 0.01, itemExtent: 30, children: _itemsScroll);
  }
}
