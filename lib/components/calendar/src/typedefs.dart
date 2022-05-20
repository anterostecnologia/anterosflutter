// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'calendar_event_data.dart';

typedef AnterosCellBuilder<T> = Widget Function(
  DateTime date,
  List<AnterosCalendarEventData<T>> event,
  bool isToday,
  bool isInMonth,
);

typedef AnterosEventTileBuilder<T> = Widget Function(
  DateTime date,
  List<AnterosCalendarEventData<T>> events,
  Rect boundary,
  DateTime startDuration,
  DateTime endDuration,
);

typedef AnterosWeekDayBuilder = Widget Function(
  int day,
);

typedef AnterosDateWidgetBuilder = Widget Function(
  DateTime date,
);

typedef AnterosCalendarPageChangeCallBack = void Function(
    DateTime date, int page);

typedef AnterosPageChangeCallback = void Function(
  DateTime date,
  AnterosCalendarEventData event,
);

typedef AnterosStringProvider = String Function(DateTime date,
    {DateTime? secondaryDate});

typedef AnterosWeekPageHeaderBuilder = Widget Function(
    DateTime startDate, DateTime endDate);

typedef AnterosTileTapCallback<T> = void Function(
    AnterosCalendarEventData<T> event, DateTime date);

typedef AnterosCellTapCallback<T> = void Function(
    List<AnterosCalendarEventData<T>> events, DateTime date);

typedef AnterosDatePressCallback = void Function(DateTime date);

typedef AnterosEventFilter<T> = List<AnterosCalendarEventData<T>> Function(
    DateTime date, List<AnterosCalendarEventData<T>> events);
