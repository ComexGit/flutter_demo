import 'package:flutter/material.dart';

class KeepStatusView extends StatefulWidget {
  final String title;
  KeepStatusView(this.title);
  @override
  _KeepStatusViewState createState() => _KeepStatusViewState();
}

class _KeepStatusViewState extends State<KeepStatusView> with AutomaticKeepAliveClientMixin {

  int counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter () {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(title:Text(widget.title)),
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('计数器:'),
          Text('$counter', style: Theme.of(context).textTheme.display1),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}