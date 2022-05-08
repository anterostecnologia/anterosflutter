import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class StandardButtons extends StatefulWidget {
  @override
  _StandardButtonsState createState() => _StandardButtonsState();
}

class _StandardButtonsState extends State<StandardButtons>
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
              color: AnterosColors.PRIMARY,
            ),
          ),
          title: const Text(
            'Standard Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              padding: EdgeInsets.all(0),
              child: AnterosSegmentTabs(
                tabController: tabController,
                width: 280,
                length: 3,
                tabs: const <Widget>[
                  Text('Solid'),
                  Tab(
                    child: Text('Outline'),
                  ),
                  Tab(
                    child: Text('Outline 2x'),
                  ),
                ],
                tabBarColor: AnterosColors.LIGHT,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AnterosColors.WHITE,
                unselectedLabelColor: AnterosColors.DARK,
                indicator: const BoxDecoration(
                  color: AnterosColors.DARK,
                  border: Border(
                    bottom: BorderSide(
                      color: AnterosColors.PRIMARY,
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      shape: AnterosButtonShape.standard,
                                      child: const Text('Primary',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.PRIMARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Secondary',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Dark',
                                        style: TextStyle(
                                            color: AnterosColors.WHITE),
                                      ),
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.solid,
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      shape: AnterosButtonShape.standard,
                                      child: Text('Primary',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.PRIMARY,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Secondary',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text(
                                        'Dark',
                                        style: TextStyle(
                                            color: AnterosColors.WHITE),
                                      ),
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.solid,
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Transparent Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
                            ),
                          ),
                          AnterosCard(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Primary'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.PRIMARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Secondary'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.SUCCESS,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Warning'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.INFO,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Light'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      type: AnterosButtonType.transparent,
                                      textColor: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.transparent,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.LARGE,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Normal',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.MEDIUM,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Small',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE)),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.SMALL,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.LARGE,
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
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.MEDIUM,
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
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.SMALL,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Full Width Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              AnterosButton(
                                onPressed: () {},
                                child: const Text('Large',
                                    style:
                                        TextStyle(color: AnterosColors.WHITE)),
                                color: AnterosColors.PRIMARY,
                                size: AnterosSize.LARGE,
                                fullWidthButton: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnterosButton(
                                onPressed: () {},
                                child: const Text('Normal',
                                    style:
                                        TextStyle(color: AnterosColors.WHITE)),
                                color: AnterosColors.PRIMARY,
                                size: AnterosSize.MEDIUM,
                                fullWidthButton: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnterosButton(
                                onPressed: () {},
                                child: const Text('Small',
                                    style:
                                        TextStyle(color: AnterosColors.WHITE)),
                                color: AnterosColors.PRIMARY,
                                size: AnterosSize.SMALL,
                                fullWidthButton: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      child: const Text('Primary'),
                                      type: AnterosButtonType.outline,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Secondary'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      type: AnterosButtonType.outline,
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      type: AnterosButtonType.outline,
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.transparent,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Primary'),
                                      type: AnterosButtonType.outline,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Secondary'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
                                      type: AnterosButtonType.outline,
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.DANGER,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
                                      type: AnterosButtonType.outline,
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Dark'),
                                      type: AnterosButtonType.outline,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.transparent,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      child: const Text('Large'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.LARGE,
                                      type: AnterosButtonType.outline,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Normal'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.MEDIUM,
                                      type: AnterosButtonType.outline,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Small'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.SMALL,
                                      type: AnterosButtonType.outline,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  child: const Text('Large'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.LARGE,
                                  type: AnterosButtonType.outline,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Normal'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.MEDIUM,
                                  type: AnterosButtonType.outline,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Small'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.SMALL,
                                  type: AnterosButtonType.outline,
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Default',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      child: const Text('Primary'),
                                      type: AnterosButtonType.outline2x,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Secondary'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Success'),
                                      type: AnterosButtonType.outline2x,
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Danger'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.DANGER,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Info'),
                                      type: AnterosButtonType.outline2x,
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Dark'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.transparent,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Disabled State',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  children: const <Widget>[
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Primary'),
                                      type: AnterosButtonType.outline2x,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Secondary'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.SECONDARY,
                                    ),
                                    AnterosButton(
                                      onPressed: null,
                                      child: Text('Success'),
                                      type: AnterosButtonType.outline2x,
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
                                      color: AnterosColors.WARNING,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Danger'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.DANGER,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Info'),
                                      type: AnterosButtonType.outline2x,
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
                                      color: AnterosColors.LIGHT,
                                    ),
                                    const AnterosButton(
                                      onPressed: null,
                                      child: Text('Dark'),
                                      type: AnterosButtonType.outline2x,
                                      color: AnterosColors.DARK,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Link'),
                                      type: AnterosButtonType.transparent,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Button Sizes',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                      child: const Text('Large'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.LARGE,
                                      type: AnterosButtonType.outline2x,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Normal'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.MEDIUM,
                                      type: AnterosButtonType.outline2x,
                                    ),
                                    AnterosButton(
                                      onPressed: () {},
                                      child: const Text('Small'),
                                      color: AnterosColors.PRIMARY,
                                      size: AnterosSize.SMALL,
                                      type: AnterosButtonType.outline2x,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: AnterosTypography(
                              text: 'Block Buttons',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: AnterosColors.PRIMARY,
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
                                  child: const Text('Large'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.LARGE,
                                  type: AnterosButtonType.outline2x,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Normal'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.MEDIUM,
                                  type: AnterosButtonType.outline2x,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnterosButton(
                                  onPressed: () {},
                                  blockButton: true,
                                  child: const Text('Small'),
                                  color: AnterosColors.PRIMARY,
                                  size: AnterosSize.SMALL,
                                  type: AnterosButtonType.outline2x,
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
