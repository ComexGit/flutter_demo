import 'package:flutter/material.dart';
import 'widgets/BottomNavigationWidget.dart';

void main() => runApp(MainDemo());

class MainDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue[800],
		  primarySwatch: Colors.deepPurple,
          accentColor: Colors.cyan[900],
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterDemo'),
      ),
      drawer: Drawer(
        child: HomeDrawer(
          titles: [
            "BottomNavigationWidget",
            "BottomNavigationWidget",
          ],
          widgets: <Widget>[
            BottomNavigationWidget(),
            BottomNavigationWidget(),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  final List<String> titles;
  final List<Widget> widgets;
  HomeDrawer({Key key, @required this.titles, @required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(),
        itemCount: titles.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return UserAccountsDrawerHeader(
              accountName: Text('YuQian'),
              accountEmail: Text('comexie@163.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/avator.gif'),
              ),
              onDetailsPressed: () {
                print('onDetailsPressed');
              },
              margin: EdgeInsets.only(),
            );
          } else if (index == 1) {
            return AboutListTile(
              icon: CircleAvatar(
                  child: IconButton(
                icon: Icon(Icons.account_balance),
                onPressed: () {},
              )),
              child: Text("About"),
              applicationName: "FlutterDemo",
              applicationVersion: "1.0",
              applicationIcon: CircleAvatar(
                backgroundImage: AssetImage('images/avator.gif'),
                radius: 36,
              ),
              applicationLegalese: "MIT",
              aboutBoxChildren: <Widget>[
                Text("\nA flutter demo."),
              ],
            );
          } else {
            int i = index - 2;
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index - 1}'),
              ),
              title: Text(titles[i]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widgets[i]));
              },
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
          );
        });
  }
}