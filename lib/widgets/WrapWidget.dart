import 'package:flutter/material.dart';
import 'dart:ui';

class WrapWidget extends StatefulWidget {
  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  List<Widget> list;
  var screenW;
  var screenH;
  final padding = 0.0;
  final spacing = 10.0;
  var cellW;
  var cellH;

  _WrapWidgetState() {

    screenW = MediaQueryData.fromWindow(window).size.width;
    screenH = MediaQueryData.fromWindow(window).size.height;
    cellW = (screenW - spacing * 4) / 3;
    cellH = cellW;

    list = List<Widget>()..add(buildAddButton());
  }

//   @override
//   void initState() {
//     super.initState();

    
//   }

  @override
  Widget build(BuildContext context) {
    // screenW = MediaQuery.of(context).size.width;
    // screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Wrap流式布局')),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: screenW,
            height: screenH,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: padding,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 12) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: spacing, top: spacing),
        child: Container(
          width: cellW,
          height: cellH,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
        padding: EdgeInsets.only(left: spacing, top: spacing),
        child: Container(
            width: cellW,
            height: cellH,
            color: Colors.amber,
            child: Center(child: Text('照片'))));
  }
}
