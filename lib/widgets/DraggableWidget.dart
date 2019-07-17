import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  final Image widgetImage;
  final Text widgetText;
  const DraggableWidget(
      {Key key,
      this.offset,
      this.widgetColor,
      this.widgetImage,
      this.widgetText})
      : super(key: key);
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: [widget.widgetImage, widget.widgetColor, widget.widgetText],
        child: Container(
            width: 100,
            height: 100,
            color: widget.widgetColor,
            child: widget.widgetImage
            ),
        feedback: Container(
          width: 80.0,
          height: 80.0,
          color: widget.widgetColor.withOpacity(0.5),
          // child: widget.image,
        ),
        onDragCompleted: () {},
        // onDragEnd: (DraggableDetails details) {
        //   setState(() {
        //     this.offset = offset;
        //     print('${details.offset}');
        //   });
        // },
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
            print('$offset');
          });
        },
      ),
    );
  }
}

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.grey;
  Image _draggableImage;
  Text _draggableText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DraggableWidget')),
        body: Stack(
          children: <Widget>[
            DraggableWidget(
              offset: Offset(90.0, 80.0),
              widgetColor: Colors.blueAccent,
              widgetImage: Image.asset('images/avator.gif'),
              widgetText: Text('Pigger'),
            ),
            DraggableWidget(
              offset: Offset(190.0, 80.0),
              widgetColor: Colors.redAccent,
              widgetImage: Image.asset('images/peak.png'),
              widgetText: Text('Peaker'),
            ),
            Center(
              child: DragTarget(onAccept: (List data) {
                _draggableColor = data[1];
                _draggableImage = data[0];
                _draggableText = data[2];
              }, builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 300.0,
                  height: 200.0,
                  color: _draggableColor,
                  child: _draggableImage
                  // _draggableImage, _draggableText
                );
              }),
            )
          ],
        ));
  }
}
