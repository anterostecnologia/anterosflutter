import 'package:anteros_flutter_app/screens/calendar/model/event.dart';
import 'package:anteros_flutter_app/screens/color_picker/pods/pods_observer.dart';
import 'package:anteros_flutter_app/screens/color_picker/store/hive_store.dart';
import 'package:anteros_flutter_app/theme/light_theme.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:anteros_flutter_app/screens/color_picker/conditionals/dart_io_conditional.dart'
    as folder;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register custom Hive data adapters.
  registerHiveAdapters();
  // Get platform compatible folder for the Hive box.
  final String appDataDir = await folder.getAppDataDir();
  Hive.init(appDataDir);
  // Open the Hive box, we just keep it open all the time in this demo app.
  await Hive.openBox<dynamic>(kHiveBox);
  runApp(
    ProviderScope(
      observers: <ProviderObserver>[PodsObserver()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnterosCalendarControllerProvider<Event>(
        controller: AnterosEventController<Event>()..addAll(_events),
        child: MaterialApp(
          title:
              'AnterosFlutter Demo App | Open source UI library for flutter app',
          debugShowCheckedModeBanner: false,
          theme: light,
          localizationsDelegates: const [
            AnterosFormLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          home: AnterosDebugInspectView(builder: (context) {
            return HomePage();
          }),
        ));
  }
}

DateTime get _now => DateTime.now();

List<AnterosCalendarEventData<Event>> _events = [
  AnterosCalendarEventData(
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  AnterosCalendarEventData(
    date: _now.add(Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    event: Event(title: "Wedding anniversary"),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  AnterosCalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    event: Event(title: "Football Tournament"),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  AnterosCalendarEventData(
    date: _now.add(Duration(days: 3)),
    startTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
    endTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
    event: Event(title: "Sprint Meeting."),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  AnterosCalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        16),
    event: Event(title: "Team Meeting"),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  AnterosCalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        12),
    event: Event(title: "Chemistry Viva"),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];
