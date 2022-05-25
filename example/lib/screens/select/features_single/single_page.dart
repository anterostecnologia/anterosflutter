import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesSinglePage extends StatefulWidget {
  @override
  _FeaturesSinglePageState createState() => _FeaturesSinglePageState();
}

class _FeaturesSinglePageState extends State<FeaturesSinglePage> {
  String? _day = 'fri';
  String? _month = 'apr';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Days',
          selectedValue: _day,
          // selectedValue: _day,
          choiceItems: choices.days,
          onChange: (selected) {
            print(selected);
            setState(() => _day = selected.value);
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Month',
          selectedValue: _month,
          choiceItems: choices.months,
          onChange: (selected) => setState(() => _month = selected.value),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
