// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../components/_internal_components.dart';
import '../event_arrangers/event_arrangers.dart';
import '../event_controller.dart';
import '../modals.dart';
import '../painters.dart';
import '../typedefs.dart';

/// Defines a single day page.
class InternalDayViewPage<T> extends StatelessWidget {
  /// Width of the page
  final double width;

  /// Height of the page.
  final double height;

  /// Date for which we are displaying page.
  final DateTime date;

  /// A builder that returns a widget to show event on screen.
  final AnterosEventTileBuilder<T> eventTileBuilder;

  /// Controller for calendar
  final AnterosEventController<T> controller;

  /// A builder that builds time line.
  final AnterosDateWidgetBuilder timeLineBuilder;

  /// Settings for hour indicator lines.
  final AnterosHourIndicatorSettings hourIndicatorSettings;

  /// Flag to display live time indicator.
  /// If true then indicator will be displayed else not.
  final bool showLiveLine;

  /// Settings for live time indicator.
  final AnterosHourIndicatorSettings liveTimeIndicatorSettings;

  /// Height occupied by one minute of time span.
  final double heightPerMinute;

  /// Width of time line.
  final double timeLineWidth;

  /// Offset for time line widgets.
  final double timeLineOffset;

  /// Height occupied by one hour of time span.
  final double hourHeight;

  /// event arranger to arrange events.
  final AnterosEventArranger<T> eventArranger;

  /// Flag to display vertical line.
  final bool showVerticalLine;

  /// Offset  of vertical line.
  final double verticalLineOffset;

  /// Called when user taps on event tile.
  final AnterosCellTapCallback<T>? onTileTap;

  /// Called when user long press on calendar.
  final AnterosDatePressCallback? onDateLongPress;

  /// Defines a single day page.
  const InternalDayViewPage({
    Key? key,
    required this.showVerticalLine,
    required this.width,
    required this.date,
    required this.eventTileBuilder,
    required this.controller,
    required this.timeLineBuilder,
    required this.hourIndicatorSettings,
    required this.showLiveLine,
    required this.liveTimeIndicatorSettings,
    required this.heightPerMinute,
    required this.timeLineWidth,
    required this.timeLineOffset,
    required this.height,
    required this.hourHeight,
    required this.eventArranger,
    required this.verticalLineOffset,
    required this.onTileTap,
    required this.onDateLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: AnterosHourLinePainter(
              lineColor: hourIndicatorSettings.color,
              lineHeight: hourIndicatorSettings.height,
              offset: timeLineWidth + hourIndicatorSettings.offset,
              minuteHeight: heightPerMinute,
              verticalLineOffset: verticalLineOffset,
              showVerticalLine: showVerticalLine,
            ),
          ),
          if (showLiveLine && liveTimeIndicatorSettings.height > 0)
            AnterosLiveTimeIndicator(
              liveTimeIndicatorSettings: liveTimeIndicatorSettings,
              width: width,
              height: height,
              heightPerMinute: heightPerMinute,
              timeLineWidth: timeLineWidth,
            ),
          PressDetector(
            width: width,
            height: height,
            hourHeight: hourHeight,
            date: date,
            onDateLongPress: onDateLongPress,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnterosEventGenerator<T>(
              height: height,
              date: date,
              onTileTap: onTileTap,
              eventArranger: eventArranger,
              events: controller.getEventsOnDay(date),
              heightPerMinute: heightPerMinute,
              eventTileBuilder: eventTileBuilder,
              width: width -
                  timeLineWidth -
                  hourIndicatorSettings.offset -
                  verticalLineOffset,
            ),
          ),
          AnterosTimeLine(
            height: height,
            hourHeight: hourHeight,
            timeLineBuilder: timeLineBuilder,
            timeLineOffset: timeLineOffset,
            timeLineWidth: timeLineWidth,
            key: ValueKey(heightPerMinute),
          ),
        ],
      ),
    );
  }
}
