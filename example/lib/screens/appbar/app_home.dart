import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'appbar.dart';
import 'searchbar.dart';
import 'segmented_appbar.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.PRIMARY,
            ),
          ),
          title: const Text(
            'Appbar',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: AnterosTypography(
                text: 'Basic Appbar',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            Container(
              height: 70,
              child: Appbar(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: AnterosTypography(
                text: 'Appbar with SearchBox',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            Container(
              height: 70,
              child: Searchbar(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: AnterosTypography(
                text: 'Segmented Tabs Appbar',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            Container(
              height: 200,
              child: SegmentedAppbar(),
            )
          ],
        ),
      );
  }
}
