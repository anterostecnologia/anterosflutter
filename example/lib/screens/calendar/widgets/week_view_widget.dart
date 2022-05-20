import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<AnterosWeekViewState>? state;
  final double? width;

  const WeekViewWidget({Key? key, this.state, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosWeekView<Event>(
      key: state,
      width: width,
    );
  }
}
