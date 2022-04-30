import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool check = true;
  bool check1 = false;
  bool check2 = false;
  bool check3 = true;
  bool check4 = false;
  bool check5 = false;
  bool check6 = true;
  bool check7 = false;
  bool check8 = false;
  bool check9 = true;
  bool check10 = false;
  bool check11 = false;
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
            'CheckBox',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),

        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Basic Checkbox',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            AnterosCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnterosCheckbox(
                    size: AnterosSize.SMALL,
                    activeBgColor: AnterosColors.DANGER,
                    onChanged: (val) {
                      setState(() {
                        check = val;
                      });
                    },
                    value: check,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    activeBgColor: AnterosColors.SECONDARY,
                    onChanged: (val) {
                      setState(() {
                        check1 = val;
                      });
                    },
                    value: check1,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    size: AnterosSize.LARGE,
                    activeBgColor: AnterosColors.SUCCESS,
                    onChanged: (val) {
                      setState(() {
                        check2 = val;
                      });
                    },
                    value: check2,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Square Checkbox',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            AnterosCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnterosCheckbox(
                    size: AnterosSize.SMALL,
                    activeBgColor: AnterosColors.DANGER,
                    type: AnterosCheckboxType.square,
                    onChanged: (val) {
                      setState(() {
                        check3 = val;
                      });
                    },
                    value: check3,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    type: AnterosCheckboxType.square,
                    activeBgColor: AnterosColors.SECONDARY,
                    onChanged: (val) {
                      setState(() {
                        check4 = val;
                      });
                    },
                    value: check4,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    size: AnterosSize.LARGE,
                    activeBgColor: AnterosColors.SUCCESS,
                    type: AnterosCheckboxType.square,
                    onChanged: (val) {
                      setState(() {
                        check5 = val;
                      });
                    },
                    value: check5,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Circular Checkbox',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            AnterosCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnterosCheckbox(
                    size: AnterosSize.SMALL,
                    activeBgColor: AnterosColors.DANGER,
                    type: AnterosCheckboxType.circle,
                    onChanged: (val) {
                      setState(() {
                        check6 = val;
                      });
                    },
                    value: check6,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    type: AnterosCheckboxType.circle,
                    activeBgColor: AnterosColors.SECONDARY,
                    onChanged: (val) {
                      setState(() {
                        check7 = val;
                      });
                    },
                    value: check7,
                  ),
                  AnterosCheckbox(
                    activeBgColor: AnterosColors.SUCCESS,
                    size: AnterosSize.LARGE,
                    type: AnterosCheckboxType.circle,
                    onChanged: (val) {
                      setState(() {
                        check8 = val;
                      });
                    },
                    value: check8,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Custom Checkbox',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Color(0xFF19CA4B),
              ),
            ),
            AnterosCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnterosCheckbox(
                    size: AnterosSize.SMALL,
                    type: AnterosCheckboxType.custom,
                    onChanged: (val) {
                      setState(() {
                        check9 = val;
                      });
                    },
                    value: check9,
                    inactiveIcon: null,
                  ),
                  AnterosCheckbox(
                    type: AnterosCheckboxType.square,
                    activeBgColor: AnterosColors.SECONDARY,
                    activeIcon: Icon(Icons.sentiment_satisfied),
                    onChanged: (val) {
                      setState(() {
                        check10 = val;
                      });
                    },
                    value: check10,
                    inactiveIcon: Icon(Icons.sentiment_dissatisfied),
                  ),
                  AnterosCheckbox(
                    size: AnterosSize.MEDIUM,
//            activeBgColor: AnterosColors.,
                    type: AnterosCheckboxType.custom,
                    onChanged: (val) {
                      setState(() {
                        check11 = val;
                      });
                    },
                    value: check11,
                    customBgColor: AnterosColors.INFO,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
          ],
        ),

//       body:
//       Container(
//         alignment: Alignment.center,
//         child: AnterosCheckbox(
//           size: AnterosSize.SMALL,
//           onChanged: (val) {
//             print('on change val $val');
//           },
//           value: true,
//           type: AnterosCheckboxType.circle,
////           checkColor: AnterosColors.DANGER,
////activeBgColor: Colors.green,
////inactivebgColor: Colors.white,
////activeBorderColor: Colors.red,
////           backgroundColor: Colors.green,
//         ),
//       ),
      );
}
