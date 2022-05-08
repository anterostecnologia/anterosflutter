import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class SegmentedAppbar extends StatefulWidget {
  @override
  _SegmentedAppbarState createState() => _SegmentedAppbarState();
}

class _SegmentedAppbarState extends State<SegmentedAppbar>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AnterosAppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.WHITE,
            ),
          ),
          backgroundColor: Colors.green,
          title: AnterosSegmentTabs(
            tabController: tabController,
            tabBarColor: AnterosColors.LIGHT,
            labelColor: AnterosColors.WHITE,
            unselectedLabelColor: Colors.green,
            indicator: const BoxDecoration(
              color: AnterosColors.DARK,
            ),
            // indicatorPadding: const EdgeInsets.all(8),
            // indicatorWeight: 2,
            border: Border.all(color: Colors.white, width: 1),
            length: 3,
            tabs: const <Widget>[
              Text('Tab1'),
              Text('Tab2'),
              Text('Tab3'),
            ],
          ),
        ),
        body: AnterosTabBarView(
            controller: tabController,
            children: const <Widget>[
              Center(
                child: Text('Tab 1'),
              ),
              Center(
                child: Text('Tab 2'),
              ),
              Center(
                child: Text('Tab 3'),
              ),
            ]),
      );
}
