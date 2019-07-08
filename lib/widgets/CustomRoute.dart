import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  int index = 0;
  CustomRoute(this.widget, this.index)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              switch (index) {
                case 0:
                  return FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  );
                  break;

                case 1:
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(CurvedAnimation(
                            parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  );
                  break;
                case 2:
                  return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: child,
                      ));
                  break;
                default:
                  return ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child);
              }
            });
}
