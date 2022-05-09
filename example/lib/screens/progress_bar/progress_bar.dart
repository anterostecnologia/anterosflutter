import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
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
            'Progress Bar',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Linear Progress Bars',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: AnterosProgressBar(
                padding: const EdgeInsets.only(left: 15, right: 15),
                percentage: 0.8,
                lineHeight: 20,
                alignment: MainAxisAlignment.spaceBetween,
                child: const Text(
                  '80%',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                leading: Icon(
                  Icons.sentiment_dissatisfied,
                  color: AnterosColors.DANGER,
                ),
                trailing: Icon(
                  Icons.sentiment_satisfied,
                  color: AnterosColors.SUCCESS,
                ),
                type: AnterosProgressType.linear,
                backgroundColor: Colors.black26,
                progressBarColor: AnterosColors.INFO,
                animation: true,
                animationDuration: 4000,

//
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: AnterosProgressBar(
                percentage: 0.5,
                lineHeight: 20,
                alignment: MainAxisAlignment.spaceBetween,

                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    '50%',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
//
                progressHeadType: AnterosProgressHeadType.square,
                backgroundColor: Colors.black26,
                progressBarColor: AnterosColors.WARNING,
                animation: true,
                animationDuration: 3000,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: AnterosProgressBar(
                percentage: 0.3,
                lineHeight: 20,
//                progressHeadType: AnterosProgressHeadType.square,
                child: const Text(
                  '30%',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                backgroundColor: Colors.black26,
                progressBarColor: AnterosColors.DANGER,
                animation: true,
                animationDuration: 2000,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 50),
              child: AnterosTypography(
                text: 'Circular Progress Bars',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              child: AnterosProgressBar(
//                width: 300,
                width: 100,
                alignment: MainAxisAlignment.spaceBetween,
                radius: 90,
                percentage: 0.4,
                lineHeight: 20,
                circleWidth: 10,
                child: const Text(
                  '40%',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Colors.black26,
                type: AnterosProgressType.circular,
                progressBarColor: AnterosColors.SECONDARY,
                animation: true,
                animationDuration: 2500,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: AnterosProgressBar(
                width: 100,
                circleStartAngle: 20,
                alignment: MainAxisAlignment.spaceEvenly,
                radius: 90,
                percentage: 0.9,
                lineHeight: 45,
                circleWidth: 10,
                child: Column(
                  children: <Widget>[
                    const Text(
                      '90%',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.sentiment_very_satisfied,
                      color: AnterosColors.SUCCESS,
                    )
                  ],
                ),
                backgroundColor: Colors.black26,
                type: AnterosProgressType.circular,
                progressBarColor: AnterosColors.SUCCESS,
                progressHeadType: AnterosProgressHeadType.circular,
                animation: true,
                animationDuration: 2800,
              ),
            ),
          ],
        ),
      );
}
