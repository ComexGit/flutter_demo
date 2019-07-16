import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text('RightBackWidget'),
          actionsForegroundColor: Colors.black),
      child: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (BuildContext context) {
                return RightBackWidget();
              }));
            },
          ),
        ),
      ),
    );
  }
}
