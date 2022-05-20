import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<AnterosMonthViewState>? state;
  final double? width;

  const MonthViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosMonthView<Event>(
      key: state,
      width: width,
    );
  }
}
