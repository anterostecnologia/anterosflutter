import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/event.dart';
import 'pages/mobile/mobile_home_page.dart';
import 'pages/web/web_home_page.dart';
import 'widgets/responsive_widget.dart';

class CalendarPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: AnterosColors.DARK,
        title: const Text(
          'Calendar',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ResponsiveWidget(
        mobileWidget: MobileHomePage(),
        webWidget: WebHomePage(),
      ),
    );
  }
}
