import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class FabFloatingWidget extends StatefulWidget {
  @override
  _FabFloatingWidgetState createState() => _FabFloatingWidgetState();
}

class _FabFloatingWidgetState extends State<FabFloatingWidget>
    with TickerProviderStateMixin {
  TextEditingController controller1 = TextEditingController();
  Animation? animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    offset =
        Tween<Offset>(begin: const Offset(0, -0.04), end: const Offset(0, 0.2))
            .animate(controller);
//    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
//        .animate(controller);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    offset1 = Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.05))
        .animate(_controller);
    animation = Tween(begin: 1, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
  }

  late AnimationController controller, _controller;
  late Animation<Offset> offset, offset1;

  bool showfabFloatingWidget = false;

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: AnterosFloatingWidget(
          verticalPosition: MediaQuery.of(context).size.height * 0.4,
          horizontalPosition: MediaQuery.of(context).size.width * 0.8,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: AnterosIconButton(
                icon:
                    showfabFloatingWidget ? Icon(Icons.close) : Icon(Icons.add),
                shape: AnterosIconButtonShape.circle,
                color: AnterosColors.PRIMARY,
//                  iconSize: 80,
                size: 100,
                onPressed: () {
                  setState(() {
                    showfabFloatingWidget = !showfabFloatingWidget;
                  });
                  switch (controller.status) {
                    case AnimationStatus.completed:
                      controller.forward(from: 1);
                      break;

                    case AnimationStatus.dismissed:
                      controller.reverse(from: 1);
                      break;
                    default:
                  }
                }),
          ),
          body: ListView(
//             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 40),
                  child: AnterosTypography(
                    text: 'FAB Button as a Floating Widget',
                    type: AnterosTypographyType.typo5,
                    dividerWidth: 25,
                    dividerColor: AnterosColors.PRIMARY,
                  ),
                ),
                showfabFloatingWidget
                    ? SlideTransition(
                        position: offset,
                        child: Container(
                          margin: const EdgeInsets.only(right: 35),
                          alignment: Alignment.topRight,
                          child: Column(
                            children: <Widget>[
                              AnterosButtonBar(
                                alignment: WrapAlignment.end,
                                direction: Axis.vertical,
                                children: <Widget>[
                                  AnterosIconButton(
                                      icon: Icon(Icons.add),
                                      shape: AnterosIconButtonShape.circle,
                                      color: AnterosColors.INFO,
                                      onPressed: () {}),
                                  AnterosIconButton(
                                      icon: Icon(Icons.share),
                                      shape: AnterosIconButtonShape.circle,
                                      color: AnterosColors.SUCCESS,
                                      onPressed: () {}),
                                  AnterosIconButton(
                                      icon: Icon(Icons.message),
                                      shape: AnterosIconButtonShape.circle,
                                      color: AnterosColors.WARNING,
                                      onPressed: () {}),
                                  AnterosIconButton(
                                      icon: Icon(Icons.settings),
                                      shape: AnterosIconButtonShape.circle,
                                      color: AnterosColors.SECONDARY,
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ])));
}
