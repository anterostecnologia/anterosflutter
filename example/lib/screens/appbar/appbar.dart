import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  List list = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'React2',
    'Ionic2',
    'Xamarin2',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AnterosAppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.WHITE,
            ),
          ),
          backgroundColor: AnterosColors.DARK,
          title: const Text('UI Kit'),
          actions: <Widget>[
            AnterosIconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {},
              type: AnterosButtonType.transparent,
            ),
          ],
        ),
      );
}
