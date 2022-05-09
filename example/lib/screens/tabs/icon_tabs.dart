import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class IconTabs extends StatefulWidget {
  @override
  _IconTabsState createState() => _IconTabsState();
}

class _IconTabsState extends State<IconTabs>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

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
              )),
          title: const Text(
            'Icon Tabs',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            AnterosTabBar(
              length: 4,
              controller: tabController,
              tabs: [
                Icon(
                  Icons.home,
                ),
                Icon(
                  Icons.music_note,
                ),
                Icon(
                  Icons.games,
                ),
                Icon(
                  Icons.notifications,
                ),
              ],
              indicatorColor: Colors.teal,
              labelColor: AnterosColors.SUCCESS,
              labelPadding: const EdgeInsets.all(8),
              tabBarColor: AnterosColors.WHITE,
              unselectedLabelColor: AnterosColors.LIGHT,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.white,
                fontFamily: 'OpenSansBold',
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black,
                fontFamily: 'OpenSansBold',
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 159,
              child: AnterosTabBarView(
                controller: tabController,
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.home,
                      size: 150,
                      color: Colors.grey.withOpacity(0.44),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.music_note,
                      size: 150,
                      color: Colors.grey.withOpacity(0.44),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.games,
                      size: 150,
                      color: Colors.grey.withOpacity(0.44),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.notifications,
                      size: 150,
                      color: Colors.grey.withOpacity(0.44),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
