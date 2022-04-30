import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:gf_app/screens/dropdowns/dropdown/types.dart';
import 'package:gf_app/screens/dropdowns/multiselect/types.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'One';
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
                  color: AnterosColors.SUCCESS,
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
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DropDownTypes()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        color: AnterosColors.DARK,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.40),
                              blurRadius: 5)
                        ]),
                    child: AnterosListTile(
                        color: AnterosColors.DARK,
                        title: const Text(
                          'Drop down',
                          style: TextStyle(color: AnterosColors.WHITE),
                        ),
                        icon: Icon(
                          CupertinoIcons.forward,
                          color: AnterosColors.SUCCESS,
                        )),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MultiselectTypes()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        color: AnterosColors.DARK,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.40),
                              blurRadius: 5)
                        ]),
                    child: AnterosListTile(
                        color: AnterosColors.DARK,
                        title: const Text(
                          'Multi select',
                          style: TextStyle(color: AnterosColors.WHITE),
                        ),
                        icon: Icon(
                          CupertinoIcons.forward,
                          color: AnterosColors.SUCCESS,
                        )),
                  )),
            ],
          ),
        ),
      );
}
