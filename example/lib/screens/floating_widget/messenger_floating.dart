import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class MessengerFloatingWidget extends StatefulWidget {
  @override
  _MessengerFloatingWidgetState createState() =>
      _MessengerFloatingWidgetState();
}

class _MessengerFloatingWidgetState extends State<MessengerFloatingWidget> {
  bool showFloatingWidget = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnterosFloatingWidget(
          verticalPosition: MediaQuery.of(context).size.height * 0.01,
          horizontalPosition: MediaQuery.of(context).size.width * 0.8,
          child: showFloatingWidget
              ? Column(
                  children: const <Widget>[
                    AnterosIconBadge(
                        child: AnterosAvatar(
                          size: AnterosSize.LARGE,
                          backgroundImage:
                              AssetImage('lib/assets/images/avatar5.png'),
                        ),
                        counterChild: AnterosBadge(
                          text: '12',
                          shape: AnterosBadgeShape.circle,
                        )),
                  ],
                )
              : Container(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 40),
                  child: AnterosTypography(
                    text: 'Avatar as a Floating Widget',
                    type: AnterosTypographyType.typo5,
                    dividerWidth: 25,
                    dividerColor: Theme.of(context).primaryColor,
                  ),
                ),
                AnterosButton(
                  onPressed: () {
                    setState(() {
                      showFloatingWidget = !showFloatingWidget;
                    });
                  },
                  text: 'View Floating Widget',
                ),
              ],
            ),
          ),
        ),
      );
}
