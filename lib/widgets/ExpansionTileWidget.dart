import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTileWidget')),
      body: ExpansionTile(
          title: Text('2019/7/13 杭州-天堂 徒有虚名'),
          leading: Icon(Icons.branding_watermark),
          backgroundColor: Colors.white10,
          children: <Widget>[
            ListTile(
              title: Text('暴雨'),
              subtitle: Text('周六加班'),
            )
          ],
          initiallyExpanded: true),
    );
  }
}
