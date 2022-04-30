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
          backgroundColor: AnterosColors.DARK,
          title: const Text('UI Kit'),
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
