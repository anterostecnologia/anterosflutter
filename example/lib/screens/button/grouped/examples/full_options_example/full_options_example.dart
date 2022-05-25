import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullOptionsSelectedExample extends StatelessWidget {
  const FullOptionsSelectedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Full Options Selected',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnterosGroupButton(
          buttons: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
          options: AnterosGroupButtonOptions(
            selectedShadow: const [],
            selectedTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.pink[900],
            ),
            selectedColor: Colors.pink[100],
            unselectedShadow: const [],
            unselectedColor: Colors.amber[100],
            unselectedTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.amber[900],
            ),
            selectedBorderColor: Colors.pink[900],
            unselectedBorderColor: Colors.amber[900],
            borderRadius: BorderRadius.circular(100),
            spacing: 10,
            runSpacing: 10,
            groupingType: AnterosGroupingType.wrap,
            direction: Axis.horizontal,
            buttonHeight: 60,
            buttonWidth: 60,
            mainGroupAlignment: AnterosMainGroupAlignment.start,
            crossGroupAlignment: AnterosCrossGroupAlignment.start,
            groupRunAlignment: AnterosGroupRunAlignment.start,
            textAlign: TextAlign.center,
            textPadding: EdgeInsets.zero,
            alignment: Alignment.center,
            elevation: 0,
          ),
          isRadio: false,
        ),
      ),
    );
  }
}
