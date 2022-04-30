import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class RadioListTilePage extends StatefulWidget {
  @override
  _RadioListTilePageState createState() => _RadioListTilePageState();
}

class _RadioListTilePageState extends State<RadioListTilePage> {
  int? groupValue = 0;

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
                  color: AnterosColors.SUCCESS,
                ),
              )),
          title: const Text(
            'RadioListTile',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            AnterosRadioListTile(
              titleText: 'Hello',
              subTitleText: 'Happy New Year',
              position: AnterosPosition.start,
              icon: AnterosAvatar(
                backgroundImage: AssetImage('lib/assets/images/img1.png'),
              ),
              size: 25,
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: AnterosRadioType.basic,
              value: 0,
              groupValue: groupValue,
              onChanged: (val) {
                setState(() {
                  groupValue = val;
                });
              },
              // inactiveIcon: null,
            ),
            AnterosRadioListTile(
              titleText: 'Hello',
              subTitleText: 'Happy New Year',
              avatar: AnterosAvatar(
                backgroundImage: AssetImage('lib/assets/images/img2.png'),
              ),
              size: 25,
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: AnterosRadioType.square,
              value: 1,
              groupValue: groupValue,
              onChanged: (val) {
                setState(() {
                  groupValue = val;
                });
              },
              // inactiveIcon: null,
            ),
          ],
        ),
      );
}
