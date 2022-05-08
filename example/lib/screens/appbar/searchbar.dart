import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
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
          backgroundColor: Colors.green,
          title: const Text('UI Kit', style: TextStyle(color: Colors.white)),
          searchBar: true,
          actions: <Widget>[
            AnterosIconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {},
              type: AnterosButtonType.transparent,
            ),
          ],
        ),
      );
}
