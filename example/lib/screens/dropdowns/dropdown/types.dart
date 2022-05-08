import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class DropDownTypes extends StatefulWidget {
  @override
  _DropDownTypesState createState() => _DropDownTypesState();
}

class _DropDownTypesState extends State<DropDownTypes>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  String? dropdownValue = 'FC Barcelona';
  List<dynamic> dropList = [
    'Running',
    'Walking',
    'Eating',
    'Sleeping',
    'Playing',
    'Drinking',
    'Jogging'
  ];
  String? dropdown;
  String? selected, selectedIndex;
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
                  color: AnterosColors.PRIMARY,
                ),
              )),
          title: const Text(
            'Dropdowns',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: AnterosSegmentTabs(
                  tabController: tabController,
                  width: 280,
                  length: 2,
                  tabs: const <Widget>[
                    Tab(
                      child: Text('Basic'),
                    ),
                    Tab(
                      child: Text('Custom'),
                    ),
                  ],
                  tabBarColor: AnterosColors.LIGHT,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AnterosColors.WHITE,
                  unselectedLabelColor: AnterosColors.DARK,
                  indicator: const BoxDecoration(
                    color: Colors.black,
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
                    height: 500,
                    controller: tabController,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(20),
                              child: DropdownButtonHideUnderline(
                                child: AnterosDropdown(
                                  padding: const EdgeInsets.all(15),
                                  borderRadius: BorderRadius.circular(5),
                                  dropdownColor: Colors.white,
                                  value: dropdownValue,
                                  onChanged: (dynamic newValue) {
                                    print('value $newValue');
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: [
                                    'FC Barcelona',
                                    'Real Madrid',
                                    'Villareal',
                                    'Manchester City'
                                  ]
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(20),
                              child: DropdownButtonHideUnderline(
                                child: AnterosDropdown(
                                  padding: const EdgeInsets.all(15),
                                  borderRadius: BorderRadius.circular(10),
                                  border: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  dropdownColor: Colors.grey[300],
                                  value: dropdownValue,
                                  onChanged: (dynamic newValue) {
                                    print('value $newValue');
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: [
                                    'FC Barcelona',
                                    'Real Madrid',
                                    'Villareal',
                                    'Manchester City'
                                  ]
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      );
}
