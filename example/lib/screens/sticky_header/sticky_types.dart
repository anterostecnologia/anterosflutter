import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:anteros_flutter_app/screens/sticky_header/customstickyheader.dart';
import 'package:anteros_flutter_app/screens/sticky_header/stickyheader.dart';

class StickyTypes extends StatefulWidget {
  @override
  _StickyTypesState createState() => _StickyTypesState();
}

class _StickyTypesState extends State<StickyTypes>
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
                color: Theme.of(context).primaryColor,
              ),
            )),
        title: const Text(
          'Sticky Header',
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
                      builder: (BuildContext context) => StickyHeader()),
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
                      'Basic',
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
                      builder: (BuildContext context) => CustomStickyHeader()),
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
                      'Customized ',
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
