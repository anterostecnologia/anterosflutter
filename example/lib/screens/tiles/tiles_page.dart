import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class TilesPage extends StatefulWidget {
  @override
  _TilesPageState createState() => _TilesPageState();
}

class _TilesPageState extends State<TilesPage> {
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
            'Tiles',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'With Label',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            AnterosCard(
              content: AnterosListTile(
                titleText: 'Title',
                subTitleText: 'Open source UI library',
                icon: Icon(Icons.favorite),
              ),
            ),
            AnterosCard(
              content: AnterosListTile(
                avatar: Icon(Icons.favorite),
                titleText: 'Title',
                icon: const Text('Caption'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: AnterosTypography(
                text: 'With Avatar',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            const AnterosCard(
              content: AnterosListTile(
                avatar: AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar5.png'),
                ),
                titleText: 'Title',
                subTitleText: 'Open source UI library',
              ),
            ),
            const AnterosCard(
              content: AnterosListTile(
                avatar: AnterosAvatar(
                  shape: AnterosAvatarShape.standard,
                  backgroundImage: AssetImage('lib/assets/images/avatar11.png'),
                ),
                titleText: 'Title',
                icon: Text('Caption'),
              ),
            ),
          ],
        ),
      );
}
