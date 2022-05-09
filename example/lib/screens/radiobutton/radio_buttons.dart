import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class RadioButtonPage extends StatefulWidget {
  @override
  _RadioButtonPageState createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  int groupValue = 0;

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
            'RadioButton',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Basic Radio Button',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnterosRadio(
//                type: AnterosRadioButtonType.custom,
                  size: AnterosSize.LARGE,
//                activebgColor: Colors.red,
//                inactivebgColor: Colors.amber,
//                inactiveBorderColor: Colors.purple,
                  activeBorderColor: AnterosColors.SUCCESS,
//                radioColor: Colors.black87,
//                custombgColor: Colors.red,
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  size: AnterosSize.MEDIUM,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  size: AnterosSize.SMALL,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  size: 20,
                  value: 3,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Sqaure Radio Button',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnterosRadio(
                  type: AnterosRadioType.square,
                  size: AnterosSize.LARGE,
//                activebgColor: Colors.red,
//                inactivebgColor: Colors.amber,
//                inactiveBorderColor: Colors.purple,
//                activeBorderColor: Colors.pink,
//                radioColor: Colors.black87,
//                custombgColor: Colors.red,
                  value: 4,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.square,
                  size: AnterosSize.MEDIUM,
                  value: 5,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.square,
                  size: AnterosSize.SMALL,
                  value: 6,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.square,
                  size: 20,
                  value: 7,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  radioColor: AnterosColors.SUCCESS,
                  activeIcon: Icon(Icons.close),
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Custom type 1 Radio Button',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnterosRadio(
                    type: AnterosRadioType.blunt,
                    size: AnterosSize.LARGE,
//                activebgColor: Colors.red,
//                inactivebgColor: Colors.amber,
//                inactiveBorderColor: Colors.purple,
                    activeBorderColor: AnterosColors.SUCCESS,
//                radioColor: Colors.black87,
//                custombgColor: Colors.red,
                    value: 8,
                    groupValue: groupValue,
                    onChanged: (dynamic val) {
                      setState(() {
                        groupValue = val;
                      });
                    },
                    inactiveIcon: null,
                    customBgColor: AnterosColors.SUCCESS),
                AnterosRadio(
                  type: AnterosRadioType.blunt,
                  size: AnterosSize.MEDIUM,
                  value: 9,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  customBgColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.blunt,
                  size: AnterosSize.SMALL,
                  value: 10,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  customBgColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.blunt,
                  size: 25,
                  value: 11,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  customBgColor: AnterosColors.SUCCESS,
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Custom Type 2 Radio Button',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnterosRadio(
                  type: AnterosRadioType.custom,
                  activeIcon: Icon(Icons.check),
                  radioColor: Colors.red,
                  size: AnterosSize.LARGE,
                  activeBgColor: AnterosColors.SUCCESS,
                  inactiveBorderColor: AnterosColors.DARK,
                  activeBorderColor: AnterosColors.SUCCESS,
                  value: 12,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                ),
                AnterosRadio(
                  type: AnterosRadioType.custom,
                  activeIcon: Icon(Icons.sentiment_satisfied),
                  size: AnterosSize.MEDIUM,
                  value: 13,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: Icon(Icons.sentiment_dissatisfied),
                  customBgColor: AnterosColors.WARNING,
                  activeBgColor: AnterosColors.SUCCESS,
                  activeBorderColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.blunt,
                  size: AnterosSize.SMALL,
                  value: 14,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  customBgColor: AnterosColors.SUCCESS,
                  activeBorderColor: AnterosColors.SUCCESS,
                ),
                AnterosRadio(
                  type: AnterosRadioType.blunt,
                  size: 25,
                  value: 15,
                  groupValue: groupValue,
                  onChanged: (dynamic val) {
                    setState(() {
                      groupValue = val;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: AnterosColors.SUCCESS,
                  customBgColor: AnterosColors.SUCCESS,
                ),
              ],
            ))
          ],
        ),
      );
}
