import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class DayViewWidget extends StatelessWidget {
  final GlobalKey<AnterosDayViewState>? state;
  final double? width;

  const DayViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosDayView<Event>(
      key: state,
      width: width,
    );
  }
}
