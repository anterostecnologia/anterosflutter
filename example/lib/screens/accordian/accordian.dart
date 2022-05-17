import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class Accordion extends StatefulWidget {
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AnterosColors.WHITE,
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
            'Accordion',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Basic Accordion',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAccordion(
                titleBorder: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  left: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  right: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                ),
                contentBorder: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  left: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  right: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                ),
                title: 'Accordion',
                content:
                    'AnterosFlutter is an open source library that comes with pre-build 1000+ UI components.'
                    ' The library is built to make flutter development faster and more enjoyable.'),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Accordion with Text',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAccordion(
                titleBorder: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  left: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  right: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                ),
                contentBorder: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  left: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                  right: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5),
                ),
                title: 'Accordion',
                content:
                    'AnterosFlutter is an open source library that comes with pre-build 1000+ UI components.'
                    ' The library is built to make flutter development faster and more enjoyable.',
                collapsedIcon: const Text('Show'),
                expandedIcon: const Text(
                  'Hide',
                  style: TextStyle(color: Colors.red),
                )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Accordion with Icon',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAccordion(
              titleBorder: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                left: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                right: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
              ),
              contentBorder: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                left: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
                right: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
              ),
              title: 'Accordion',
              content:
                  'AnterosFlutter is an open source library that comes with pre-build 1000+ UI components.'
                  ' The library is built to make flutter development faster and more enjoyable.',
              collapsedIcon: Icon(Icons.add_circle_outline),
              expandedIcon: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
}
