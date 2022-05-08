import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class CheckBoxListTilePage extends StatefulWidget {
  @override
  _CheckBoxListTilePageState createState() => _CheckBoxListTilePageState();
}

class _CheckBoxListTilePageState extends State<CheckBoxListTilePage> {
  bool check = true;
  bool check1 = false;
  bool check2 = true;
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
            'Checkbox List Tile',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            AnterosCheckboxListTile(
              titleText: 'hi',
              subTitleText: 'Murilo Bandeira',
              position: AnterosPosition.start,
              icon: AnterosAvatar(
                backgroundImage: AssetImage('lib/assets/images/img.png'),
              ),
              size: 25,
              activeBgColor: Colors.green,
              activeIcon: Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              ),
              type: AnterosCheckboxType.circle,
              onChanged: (val) {
                setState(() {
                  check = val;
                  print(val);
                });
              },
              value: check,
            ),
            AnterosCheckboxListTile(
              titleText: 'hi',
              subTitleText: 'Murilovisk',
              avatar: AnterosAvatar(
                backgroundImage: AssetImage('lib/assets/images/img1.png'),
              ),
              size: 25,
              activeBgColor: Colors.green,
              activeIcon: Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              ),
              type: AnterosCheckboxType.circle,
              onChanged: (val) {
                setState(() {
                  check1 = val;
                });
              },
              value: check1,
            ),
            AnterosCheckboxListTile(
              titleText: 'hi',
              subTitleText: 'Bandeira II',
              avatar: AnterosAvatar(
                backgroundImage: AssetImage('lib/assets/images/img1.png'),
              ),
              size: 25,
              activeBgColor: AnterosColors.SECONDARY,
              activeIcon: Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              ),
              type: AnterosCheckboxType.square,
              onChanged: (val) {
                setState(() {
                  check2 = val;
                });
              },
              value: check2,
            )
          ],
        ),
      );
}
