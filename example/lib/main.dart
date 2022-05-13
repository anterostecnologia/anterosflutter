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
    return MaterialApp(
      title: 'AnterosFlutter Demo App | Open source UI library for flutter app',
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
      home: HomePage(),
    );
  }
}
