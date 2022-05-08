import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:anteros_flutter_app/screens/intro-screen/fullwidth.dart';
import 'package:anteros_flutter_app/screens/intro-screen/halfwidth.dart';

class Introscreen extends StatefulWidget {
  @override
  _IntroscreenState createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: AnterosColors.PRIMARY,
              ),
            )),
        title: const Text(
          'Intro Screens',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FullWidthIntro()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Full Width',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HalfWidthIntro()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Half ',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
        ],
      ));
}
