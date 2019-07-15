import 'package:flutter/material.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  @override
  _ExpansionPanelListWidgetState createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionPanelListWidgetState() {
    mList = new List();
    expandStateList = new List();
    //便利为两个List进行赋值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  Widget build(BuildContext context) {

//  List numList = [1,2,3,4];
//  var mapTest = numList.map((f)=> f*5);
//   print(mapTest); //转化成一个map
//   print("mapTest的长度"+ mapTest.length.toString());
//   mapTest.forEach((f){
//     print(f);
//   });
// var a = mapTest.toList();//转化成list
//   print(a);

    return Scaffold(
        appBar: AppBar(title: Text("expansion panel list")),
        //加入可滚动组件
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            //交互回掉属性，里边是个匿名函数
            expansionCallback: (index, bol) {
              //调用内部方法
              _setCurrentIndex(index, bol);
            },
            children: mList.map((index) {
              //进行map操作，然后用toList再次组成List
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(title: Text('This is No. $index'));
                  },
                  body: ListTile(title: Text('expansion no.$index')),
                  isExpanded: expandStateList[index].isOpen);
            }).toList(),
          ),
        ));
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
