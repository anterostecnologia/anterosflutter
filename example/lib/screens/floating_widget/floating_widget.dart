import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'messenger_floating.dart';

class FloatingWidgetHome extends StatefulWidget {
  @override
  _FloatingWidgetHomeState createState() => _FloatingWidgetHomeState();
}

class _FloatingWidgetHomeState extends State<FloatingWidgetHome> {
  bool showFloatingWidget = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text(
            'Floating Widget',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: MessengerFloatingWidget(),
            ),
//            Container(
//              height: MediaQuery.of(context).size.height * 0.55,
//              child: FabFloatingWidget(),
//            ),
          ],
        ),
      );
}
