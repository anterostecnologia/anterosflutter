import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class ScrollIjector extends StatelessWidget {
  const ScrollIjector({
    Key? key,
    required this.child,
    required this.groupingType,
  }) : super(key: key);

  final Widget child;
  final AnterosGroupingType groupingType;

  @override
  Widget build(BuildContext context) {
    if (groupingType == AnterosGroupingType.row) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: child,
      );
    }
    return child;
  }
}
