import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'component_page.dart';
import 'showcase/package_delivery_tracking.dart';
import 'showcase/process_timeline.dart';
import 'showcase/timeline_status.dart';
import 'showcase_page.dart';
import 'theme_page.dart';
import 'widget.dart';

class TimelinesTypes extends StatefulWidget {
  @override
  _TimelinesTypesState createState() => _TimelinesTypesState();
}

class _TimelinesTypesState extends State<TimelinesTypes> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: const Text(
            'Timelines',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            makeButtons(context, 'Theme page', ThemePage()),
            makeButtons(context, 'Example page', ExamplePage()),
            makeButtons(context, 'Timeline status page', TimelineStatusPage()),
            makeButtons(context, 'Package Delivery tracking page',
                PackageDeliveryTrackingPage()),
            makeButtons(
                context, 'Process timeline page', ProcessTimelinePage()),
          ],
        ),
      );

  GestureDetector makeButtons(
      BuildContext context, String title, Widget pageButton) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => pageButton),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: AnterosColors.DARK,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
            ]),
        child: AnterosListTile(
          color: AnterosColors.DARK,
          title: Text(
            title,
            style: TextStyle(color: AnterosColors.WHITE),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnterosTimelineTheme(
      data: AnterosTimelineThemeData(
        indicatorTheme: AnterosIndicatorThemeData(size: 15.0),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timelines Example'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            _NavigationCard(
              name: 'Components',
              navigationBuilder: () => ComponentPage(),
            ),
            _NavigationCard(
              name: 'Theme',
              navigationBuilder: () => ThemePage(),
            ),
            _NavigationCard(
              name: 'Showcase',
              navigationBuilder: () => ShowcasePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  const _NavigationCard({
    Key? key,
    required this.name,
    this.navigationBuilder,
  }) : super(key: key);

  final String name;
  final NavigateWidgetBuilder? navigationBuilder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NavigationCard(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        borderRadius: BorderRadius.circular(8),
        navigationBuilder: navigationBuilder,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Text(name),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
