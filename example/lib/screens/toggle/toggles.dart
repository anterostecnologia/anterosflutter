import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class Toggles extends StatefulWidget {
  @override
  _TogglesState createState() => _TogglesState();
}

class _TogglesState extends State<Toggles> {
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
            'Toggle',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
                child: AnterosTypography(
                  text: 'Basic',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: AnterosColors.PRIMARY,
                ),
              ),
              AnterosCard(
                content: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.DANGER,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.WARNING,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.INFO,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: AnterosTypography(
                  text: 'IOS',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: AnterosColors.PRIMARY,
                ),
              ),
              AnterosCard(
                content: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosToggle(
                          onChanged: (v) {
                            print('ios val $v');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.DANGER,
                          onChanged: (v) {
                            print('ios val $v');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.WARNING,
                          onChanged: (v) {
                            print('ios val $v');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.INFO,
                          onChanged: (v) {
                            print('ios val $v');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: AnterosTypography(
                  text: 'Square',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: AnterosColors.PRIMARY,
                ),
              ),
              AnterosCard(
                content: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.square,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.DANGER,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.square,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.WARNING,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.square,
                        ),
                        AnterosToggle(
                          enabledTrackColor: AnterosColors.INFO,
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.square,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: AnterosTypography(
                  text: 'Custom',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: AnterosColors.PRIMARY,
                ),
              ),
              AnterosCard(
                content: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.custom,
                        ),
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.android,
                          boxShape: BoxShape.rectangle,
                          enabledTrackColor: AnterosColors.DANGER,
                        ),
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                          boxShape: BoxShape.rectangle,
                          enabledTrackColor: AnterosColors.WARNING,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        AnterosToggle(
                          onChanged: (val) {
                            print('on change val $val');
                          },
                          value: true,
                          type: AnterosToggleType.ios,
                          boxShape: BoxShape.rectangle,
                          enabledText: 'ON',
                          disabledText: 'OFF',
                          enabledTrackColor: AnterosColors.INFO,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
