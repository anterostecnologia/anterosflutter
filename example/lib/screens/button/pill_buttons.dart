import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class PillsButtons extends StatefulWidget {
  @override
  _PillsButtonsState createState() => _PillsButtonsState();
}

class _PillsButtonsState extends State<PillsButtons>
    with SingleTickerProviderStateMixin {
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
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text(
            'Pills Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: AnterosSegmentTabs(
                tabController: tabController,
                width: 280,
                length: 3,
                tabs: const <Widget>[
                  Text(
                    'Solid',
                  ),
                  Tab(
                    child: Text(
                      'Outline',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Outline 2x',
                    ),
                  ),
                ],
                tabBarColor: AnterosColors.LIGHT,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AnterosColors.WHITE,
                unselectedLabelColor: AnterosColors.DARK,
                indicator: BoxDecoration(
                  color: AnterosColors.DARK,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    ),
                  ),
                ),
                // indicatorPadding: const EdgeInsets.all(8),
                // indicatorWeight: 2,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: AnterosTabBarView(
                  controller: tabController,
                  height: 400,
                  children: <Widget>[
                    Container(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      shape: AnterosButtonShape.pills,
                                      child: const Text(
                                        'Primary',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      text: 'Secondary',
//                                      child: const Text(
//                                        'Secondary',
//                                      ),
                                      color: AnterosColors.SECONDARY,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Warning'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Light'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      shape: AnterosButtonShape.pills,
                                      child: Text(
                                        'Primary',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text(
                                        'Secondary',
                                      ),
                                      color: AnterosColors.SECONDARY,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Warning'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Light'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Dark'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Large',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.LARGE,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Normal',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.MEDIUM,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Small',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.SMALL,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Large',
                                      style: TextStyle(
                                          color: AnterosColors.WHITE)),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.LARGE,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Normal',
                                      style: TextStyle(
                                          color: AnterosColors.WHITE)),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.MEDIUM,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Small',
                                      style: TextStyle(
                                          color: AnterosColors.WHITE)),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.SMALL,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      shape: AnterosButtonShape.pills,
                                      child: const Text(
                                        'Primary',
                                      ),
                                      type: AnterosButtonType.outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Secondary',
                                      ),
                                      color: AnterosColors.SECONDARY,
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Warning'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Light'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      shape: AnterosButtonShape.pills,
                                      child: Text(
                                        'Primary',
                                      ),
                                      type: AnterosButtonType.outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text(
                                        'Secondary',
                                      ),
                                      color: AnterosColors.SECONDARY,
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Warning'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Light'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Dark'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Large',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.LARGE,
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Normal',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.MEDIUM,
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Small',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.SMALL,
                                      type: AnterosButtonType.outline,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Large',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.LARGE,
                                  type: AnterosButtonType.outline,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Normal',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.MEDIUM,
                                  type: AnterosButtonType.outline,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Small',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.SMALL,
                                  type: AnterosButtonType.outline,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      shape: AnterosButtonShape.pills,
                                      child: const Text(
                                        'Primary',
                                      ),
                                      type: AnterosButtonType.outline2x,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Secondary',
                                      ),
                                      color: AnterosColors.SECONDARY,
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Warning'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Light'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      shape: AnterosButtonShape.pills,
                                      child: Text(
                                        'Primary',
                                      ),
                                      type: AnterosButtonType.outline2x,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text(
                                        'Secondary',
                                      ),
                                      color: AnterosColors.SECONDARY,
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Warning'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Light'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Dark'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                      color: AnterosColors.TRANSPARENT,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Large',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.LARGE,
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Normal',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.MEDIUM,
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Small',
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      size: AnterosSize.SMALL,
                                      type: AnterosButtonType.outline2x,
                                      shape: AnterosButtonShape.pills,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Large',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.LARGE,
                                  type: AnterosButtonType.outline2x,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Normal',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.MEDIUM,
                                  type: AnterosButtonType.outline2x,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text(
                                    'Small',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: AnterosSize.SMALL,
                                  type: AnterosButtonType.outline2x,
                                  shape: AnterosButtonShape.pills,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      );
}
