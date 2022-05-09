import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class TypographyPage extends StatefulWidget {
  @override
  _TypographyPageState createState() => _TypographyPageState();
}

class _TypographyPageState extends State<TypographyPage> {
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
            'Typography',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Headings Regular',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
              content: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo1',
                    type: AnterosTypographyType.typo1,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo2',
                    type: AnterosTypographyType.typo2,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo3',
                    type: AnterosTypographyType.typo3,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo4',
                    type: AnterosTypographyType.typo4,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo5',
                    type: AnterosTypographyType.typo5,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo6',
                    type: AnterosTypographyType.typo6,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: AnterosTypography(
                text: 'Opacity',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
              content: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  const AnterosTypography(
                    text: 'GF Header Typo1',
                    type: AnterosTypographyType.typo1,
                    showDivider: false,
                    textColor: Colors.black87,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo2',
                    type: AnterosTypographyType.typo2,
                    showDivider: false,
                    textColor: Colors.black54,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo3',
                    type: AnterosTypographyType.typo3,
                    showDivider: false,
                    textColor: Colors.black45,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo4',
                    type: AnterosTypographyType.typo4,
                    showDivider: false,
                    textColor: Colors.black38,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AnterosTypography(
                      text: 'GF Header Typo5',
                      type: AnterosTypographyType.typo5,
                      showDivider: false,
                      textColor: Colors.black26),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                      text: 'GF Header Typo6',
                      type: AnterosTypographyType.typo6,
                      showDivider: false,
                      textColor: Colors.black12),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: AnterosTypography(
                text: 'Custom Heading',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
              content: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo2',
                    type: AnterosTypographyType.typo2,
                    showDivider: false,
                    backgroundImage: AssetImage('lib/assets/images/card3.png'),
                    icon: AnterosAvatar(
                      backgroundImage:
                          AssetImage('lib/assets/images/avatar6.png'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'GF Header Typo3',
                    type: AnterosTypographyType.typo3,
                    backgroundImage: AssetImage('lib/assets/images/card2.png'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
