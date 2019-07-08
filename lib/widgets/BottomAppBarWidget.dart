import 'package:flutter/material.dart';
import 'EachView.dart';
import 'CustomRoute.dart';

class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  List<Widget> eachView; //创建视图数组
  int index = 0; //数组索引，通过改变索引值改变视图
  int routeAnimationIndex = 0;
  @override
  void initState() {
    super.initState();
    eachView = List();
    eachView..add(EachView('Home'))..add(EachView('Me'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: eachView[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (routeAnimationIndex == 3) {
            routeAnimationIndex = 0;
          }
          Navigator.of(context).push(CustomRoute(
              EachView('New Page'), routeAnimationIndex++)); //custom route
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (BuildContext context) {
          //     return EachView('New Page');
          //   }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.airport_shuttle),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
