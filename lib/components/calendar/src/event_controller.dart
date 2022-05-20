// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'calendar_event_data.dart';
import 'typedefs.dart';

class AnterosEventController<T> extends ChangeNotifier {
  /// This method will provide list of events on particular date.
  ///
  /// This method is use full when you have recurring events.
  /// As of now this library does not support recurring events.
  /// You can implement same behaviour in this function.
  /// This function will overwrite default behaviour of [getEventsOnDay]
  /// function which will be used to display events on given day in
  /// [MonthView], [DayView] and [WeekView].
  ///
  final AnterosEventFilter<T>? eventFilter;

  /// Calendar controller to control all the events related operations like,
  /// adding event, removing event, etc.
  AnterosEventController({
    this.eventFilter,
  });

  // Stores events that occurs only once in a tree type structure.
  final _events = <_YearEvent<T>>[];

  // Stores all the events in a list.
  final _eventList = <AnterosCalendarEventData<T>>[];

  // Stores all the ranging events in a list.
  final _rangingEventList = <AnterosCalendarEventData<T>>[];

  /// Returns list of [CalendarEventData<T>] stored in this controller.
  List<AnterosCalendarEventData<T>> get events =>
      _eventList.toList(growable: false);

  /// Add all the events in the list
  /// If there is an event with same date then
  void addAll(List<AnterosCalendarEventData<T>> events) {
    for (final event in events) {
      _addEvent(event);
    }

    notifyListeners();
  }

  /// Adds a single event in [_events]
  void add(AnterosCalendarEventData<T> event) {
    _addEvent(event);

    notifyListeners();
  }

  /// Removes [event] from this controller.
  void remove(AnterosCalendarEventData<T> event) {
    for (final e in _events) {
      if (e.year == event.date.year) {
        if (e.removeEvent(event) && _eventList.remove(event)) {
          notifyListeners();
          return;
        }

        break;
      }
    }

    for (final e in _rangingEventList) {
      if (e == event) {
        if (_rangingEventList.remove(event) && _eventList.remove(event)) {
          notifyListeners();
          return;
        }
        break;
      }
    }
  }

  void _addEvent(AnterosCalendarEventData<T> event) {
    assert(event.endDate.difference(event.date).inDays >= 0,
        'The end date must be greater or equal to the start date');

    if (event.endDate.difference(event.date).inDays > 0) {
      _rangingEventList.add(event);
      _eventList.add(event);
    } else {
      for (final e in _events) {
        if (e.year == event.date.year && e.addEvent(event)) {
          _eventList.add(event);
          notifyListeners();

          return;
        }
      }

      final newEvent = _YearEvent<T>(year: event.date.year);
      if (newEvent.addEvent(event)) {
        _events.add(newEvent);
        _eventList.add(event);
      }
    }

    notifyListeners();
  }

  /// Returns events on given day.
  ///
  /// To overwrite default behaviour of this function,
  /// provide [eventFilter] argument in [AnterosEventController] constructor.
  List<AnterosCalendarEventData<T>> getEventsOnDay(DateTime date) {
    if (eventFilter != null) return eventFilter!.call(date, this.events);

    final events = <AnterosCalendarEventData<T>>[];

    for (var i = 0; i < _events.length; i++) {
      if (_events[i].year == date.year) {
        final monthEvents = _events[i]._months;

        for (var j = 0; j < monthEvents.length; j++) {
          if (monthEvents[j].month == date.month) {
            final calendarEvents = monthEvents[j]._events;

            for (var k = 0; k < calendarEvents.length; k++) {
              if (calendarEvents[k].date.day == date.day)
                events.add(calendarEvents[k]);
            }
          }
        }
      }
    }

    final daysFromRange = <DateTime>[];
    for (final rangingEvent in _rangingEventList) {
      for (var i = 0;
          i <= rangingEvent.endDate.difference(rangingEvent.date).inDays;
          i++) {
        daysFromRange.add(rangingEvent.date.add(Duration(days: i)));
      }
      if (rangingEvent.date.isBefore(rangingEvent.endDate)) {
        for (final eventDay in daysFromRange) {
          if (eventDay.year == date.year &&
              eventDay.month == date.month &&
              eventDay.day == date.day) {
            events.add(rangingEvent);
          }
        }
      }
    }

    return events;
  }
}

class _YearEvent<T> {
  int year;
  final _months = <_MonthEvent<T>>[];

  List<_MonthEvent<T>> get months => _months.toList(growable: false);

  _YearEvent({required this.year});

  int hasMonth(int month) {
    for (var i = 0; i < _months.length; i++) {
      if (_months[i].month == month) return i;
    }
    return -1;
  }

  bool addEvent(AnterosCalendarEventData<T> event) {
    for (var i = 0; i < _months.length; i++) {
      if (_months[i].month == event.date.month) {
        return _months[i].addEvent(event);
      }
    }
    final newEvent = _MonthEvent<T>(month: event.date.month)..addEvent(event);
    _months.add(newEvent);
    return true;
  }

  List<AnterosCalendarEventData<T>> getAllEvents() {
    final totalEvents = <AnterosCalendarEventData<T>>[];
    for (var i = 0; i < _months.length; i++) {
      totalEvents.addAll(_months[i].events);
    }
    return totalEvents;
  }

  bool removeEvent(AnterosCalendarEventData<T> event) {
    for (final e in _months) {
      if (e.month == event.date.month) {
        return e.removeEvent(event);
      }
    }
    return false;
  }
}

class _MonthEvent<T> {
  int month;
  final _events = <AnterosCalendarEventData<T>>[];

  List<AnterosCalendarEventData<T>> get events =>
      _events.toList(growable: false);

  _MonthEvent({required this.month});

  int hasDay(int day) {
    for (var i = 0; i < _events.length; i++) {
      if (_events[i].date.day == day) return i;
    }
    return -1;
  }

  bool addEvent(AnterosCalendarEventData<T> event) {
    if (!_events.contains(event)) {
      _events.add(event);
      return true;
    }
    return false;
  }

  bool removeEvent(AnterosCalendarEventData<T> event) {
    final index = _events.indexWhere((element) => element == event);
    if (index == -1) {
      return false;
    } else {
      _events.removeAt(index);
      return true;
    }
  }
}
