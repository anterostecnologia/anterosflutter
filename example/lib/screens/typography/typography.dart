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
                    text: 'Header Typo1',
                    type: AnterosTypographyType.typo1,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo2',
                    type: AnterosTypographyType.typo2,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo3',
                    type: AnterosTypographyType.typo3,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo4',
                    type: AnterosTypographyType.typo4,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo5',
                    type: AnterosTypographyType.typo5,
                    showDivider: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo6',
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
                    text: 'Header Typo1',
                    type: AnterosTypographyType.typo1,
                    showDivider: false,
                    textColor: Colors.black87,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo2',
                    type: AnterosTypographyType.typo2,
                    showDivider: false,
                    textColor: Colors.black54,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo3',
                    type: AnterosTypographyType.typo3,
                    showDivider: false,
                    textColor: Colors.black45,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                    text: 'Header Typo4',
                    type: AnterosTypographyType.typo4,
                    showDivider: false,
                    textColor: Colors.black38,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AnterosTypography(
                      text: 'Header Typo5',
                      type: AnterosTypographyType.typo5,
                      showDivider: false,
                      textColor: Colors.black26),
                  const SizedBox(
                    height: 15,
                  ),
                  AnterosTypography(
                      text: 'Header Typo6',
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
                    text: 'Header Typo2',
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
                    text: 'Header Typo3',
                    type: AnterosTypographyType.typo3,
                    backgroundImage: AssetImage('lib/assets/images/card2.png'),
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
                text: 'Text less string extension',
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
                  "Headline1".h1.overflowFade.softWrap(false),
                  "Headline2".h2,
                  "Headline3".h3,
                  "Headline3"
                      .h3
                      .foreground(Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Colors.redAccent)
                      .letterSpacing(8)
                      .size(45),
                  "Headline4".h4,
                  "Headline4".h4.overline.height(3).lineThickness(5),
                  "Headline5".h5,
                  "Headline5"
                      .h5
                      .underline
                      .size(45)
                      .wavyLine
                      .lineColor(Colors.cyanAccent),
                  "Headline6".h6,
                  "Typography1".t1.overflowFade.softWrap(false),
                  "Typography2".t2,
                  "Typography3".t3,
                  "Typography4".t4,
                  "Typography5".t5,
                  "Typography6".t6,
                  "Subtitle1".s1,
                  "Subtitle1".s2,
                  "BodyText1".b1,
                  "BodyText2".style(TextStyle(color: Colors.red)),
                  "Button".btn,
                  "Caption".cap,
                  "Overline".ol,
                  "Custom".text.color(Colors.blue),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
