import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../extension.dart';
import '../day_view_page.dart';
import '../month_view_page.dart';
import '../week_view_page.dart';

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnterosButton(
            onPressed: () => context.pushRoute(MonthViewPageDemo()),
            size: AnterosSize.LARGE,
            child: Text("Month View"),
          ),
          SizedBox(
            height: 20,
          ),
          AnterosButton(
            onPressed: () => context.pushRoute(DayViewPageDemo()),
            size: AnterosSize.LARGE,
            child: Text("Day View"),
          ),
          SizedBox(
            height: 20,
          ),
          AnterosButton(
            onPressed: () => context.pushRoute(WeekViewDemo()),
            size: AnterosSize.LARGE,
            child: Text("Week View"),
          ),
        ],
      ),
    );
  }
}
