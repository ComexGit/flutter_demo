import 'package:flutter/material.dart';

class ToolTipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToolTipWidget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Tooltip(
              message: '分享一下',
              child: Icon(Icons.all_inclusive, size: 54.0),
            ),
            Text('长按提示')
          ],
        ),
      ),
    );
  }
}
