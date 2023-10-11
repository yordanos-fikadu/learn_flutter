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
    return CupertinoApp(
        home: _buildCupertinoDatePicker());
  }

  CupertinoDatePicker _buildCupertinoDatePicker() {
    return CupertinoDatePicker(
    onDateTimeChanged: (value) => print(value.day),
  );
  }

  Widget _buildCupertinoActionSheet() {
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: () => showCupertinoModalPopup(
            context: context,
            builder: (context) => _buildCupertinoActionSheetContent()),
        child: Text('Select Number'));
  }

  CupertinoActionSheet _buildCupertinoActionSheetContent() {
    return CupertinoActionSheet(
      title: Text('Number'),
      message: Text('Select the number to continue'),
      actions: [
        CupertinoActionSheetAction(
            onPressed: () => print('one'), child: Text('one')),
        CupertinoActionSheetAction(onPressed: () => null, child: Text('two')),
        CupertinoActionSheetAction(onPressed: () => null, child: Text('three')),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => print('helo'), child: Text('Cancel')),
    );
  }

  Widget _buildCupertinoActivityIndicator() {
    return CupertinoActivityIndicator(
      color: Colors.red,
      animating: true,
      radius: 200,
    );
  }

  Widget _buildCupertinoAlartDialog() {
    return CupertinoAlertDialog(
      title: Text('Are you a Programer'),
      actions: [
        Text(
          'Yes',
          textAlign: TextAlign.center,
        ),
        Text(
          'NO',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCupertinoButton() {
    return CupertinoButton(
      child: Text('Press'),
      onPressed: () => null,
    );
  }

  Widget _buildCupertinoContextMenu() {
    return CupertinoContextMenu(
      actions: [
        Text('Press'),
        Text('Press'),
      ],
      child: Text('Press'),
    );
  }
}
