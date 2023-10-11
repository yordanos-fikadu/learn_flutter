import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosStyleWidget extends StatefulWidget {
  const IosStyleWidget({super.key});

  @override
  State<IosStyleWidget> createState() => _IosStyleWidgetState();
}

class _IosStyleWidgetState extends State<IosStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildCupertino();
  }

  Widget _buildCupertino() {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(onPressed: () => null, child: Text('one')),
        CupertinoActionSheetAction(onPressed: () => null, child: Text('two')),
        CupertinoActionSheetAction(onPressed: () => null, child: Text('three')),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => null, child: Text('three')),
    );
  }
}
