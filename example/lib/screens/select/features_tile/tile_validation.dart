import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesTileValidation extends StatefulWidget {
  @override
  _FeaturesTileValidationState createState() => _FeaturesTileValidationState();
}

class _FeaturesTileValidationState extends State<FeaturesTileValidation> {
  String? _day;
  List<String> _month = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Days',
          selectedValue: _day,
          choiceItems: choices.days,
          onChange: (selected) {
            setState(() => _day = selected.value);
          },
          validation: (chosen) {
            if (chosen.isEmpty) return 'Please select one or more';
            return '';
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Month',
          selectedValue: _month,
          choiceItems: choices.months,
          onChange: (selected) {
            setState(() => _month = selected.value);
          },
          validation: (chosen) {
            if (chosen.isEmpty) return 'Please select one or more';
            return '';
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
