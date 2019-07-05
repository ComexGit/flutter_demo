import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  List<Widget> list = List();
  int currentIndex = 0;

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text('Home',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text('Email',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text('Pages',
                  style: TextStyle(color: _bottomNavigationColor))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: Text('AirPlay',
                  style: TextStyle(color: _bottomNavigationColor))),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
        body: Center(
          child: Text('HOME'),
        ));
  }
}

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EMAIL'),
        ),
        body: Center(
          child: Text('EMAIL'),
        ));
  }
}

class PagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PAGES'),
        ),
        body: Center(
          child: Text('PAGES'),
        ));
  }
}

class AirplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AIRPLAY'),
        ),
        body: Center(
          child: Text('AIRPLAY'),
        ));
  }
}
