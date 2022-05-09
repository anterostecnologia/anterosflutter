import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool showblur = false;
  Widget? alertWidget;
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
            'Alert',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: AnterosFloatingWidget(
          verticalPosition: 150,
          showBlurness: showblur,
          child: alertWidget,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: AnterosTypography(
                  text: 'Basic Alert',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnterosButton(
                          text: 'Tap to View',
                          onPressed: () {
                            setState(() {
                              showblur = true;
                              // alertWidget = AnterosToast(
                              //   text: 'hi',
                              // );
                              alertWidget = AnterosAlert(
                                backgroundColor: Colors.white,
                                title: 'Welcome!',
                                content:
                                    'Get Flutter is one of the largest Flutter open-source UI library '
                                    'for mobile or web apps with  1000+ pre-built reusable widgets.',
                                bottombar: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {
                                        setState(() {
                                          alertWidget = null;
                                          showblur = false;
                                        });
                                      },
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                      type: AnterosButtonType.outline2x,
                                      child: const Text(
                                        'Skip',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AnterosButton(
                                      onPressed: () {
                                        setState(() {
                                          alertWidget = null;
                                          showblur = false;
                                        });
                                      },
                                      shape: AnterosButtonShape.pills,
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: AnterosColors.WHITE,
                                      ),
                                      position: AnterosPosition.end,
                                      text: 'Learn More',
                                    )
                                  ],
                                ),
                              );
                            });
                          }),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: AnterosTypography(
                  text: 'Rounded Alert',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.transparent,
                child: Center(
                  child: AnterosButton(
                      text: 'Tap to View',
                      onPressed: () {
                        setState(() {
                          showblur = true;
                          alertWidget = AnterosAlert(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            title: 'Welcome!',
                            content:
                                'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
                            type: AnterosAlertType.rounded,
                            bottombar: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                AnterosButton(
                                  onPressed: () {
                                    setState(() {
                                      alertWidget = null;
                                      showblur = false;
                                    });
                                  },
                                  color: AnterosColors.LIGHT,
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AnterosButton(
                                  onPressed: () {
                                    setState(() {
                                      alertWidget = null;
                                      showblur = false;
                                    });
                                  },
                                  shape: AnterosButtonShape.pills,
                                  icon: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AnterosColors.WHITE,
                                  ),
                                  position: AnterosPosition.end,
                                  text: 'Learn More',
                                )
                              ],
                            ),
                          );
                        });
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: AnterosTypography(
                  text: 'Full Width Alert',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.transparent,
                child: Center(
                  child: AnterosButton(
                      text: 'Tap to View',
                      onPressed: () {
                        setState(() {
                          showblur = true;
                          alertWidget = AnterosAlert(
                            backgroundColor: Colors.white,
                            title: 'Welcome !',
                            content:
                                'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
                            type: AnterosAlertType.fullWidth,
                            bottombar: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                AnterosButton(
                                  onPressed: () {
                                    setState(() {
                                      alertWidget = null;
                                      showblur = false;
                                    });
                                  },
                                  shape: AnterosButtonShape.square,
                                  color: AnterosColors.LIGHT,
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AnterosButton(
                                  onPressed: () {
                                    setState(() {
                                      alertWidget = null;
                                      showblur = false;
                                    });
                                  },
                                  shape: AnterosButtonShape.square,
                                  type: AnterosButtonType.outline2x,
                                  icon: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  position: AnterosPosition.end,
                                  text: 'Learn More',
                                )
                              ],
                            ),
                          );
                        });
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: AnterosTypography(
                  text: 'Custom Alert',
                  type: AnterosTypographyType.typo5,
                  dividerWidth: 25,
                  dividerColor: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AnterosButton(
                        text: 'Tap to View',
                        onPressed: () {
                          setState(() {
                            showblur = true;
                            alertWidget = AnterosAlert(
                              alignment: Alignment.center,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'lib/assets/gif/success1.gif',
                                width: 80,
                              ),
                              contentChild: const Text(
                                'You have succesfully viewed the Custom Alert... Hurrayyy!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              bottombar: AnterosButton(
                                onPressed: () {
                                  setState(() {
                                    alertWidget = null;
                                    showblur = false;
                                  });
                                },
                                fullWidthButton: true,
                                color: AnterosColors.SECONDARY,
                                text: 'OK',
                              ),
                            );
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
