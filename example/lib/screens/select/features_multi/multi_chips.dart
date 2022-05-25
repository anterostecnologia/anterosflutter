import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesMultiChips extends StatefulWidget {
  @override
  _FeaturesMultiChipsState createState() => _FeaturesMultiChipsState();
}

class _FeaturesMultiChipsState extends State<FeaturesMultiChips> {
  List<String> _car = [];
  List<String> _smartphone = [];
  List<String> _day = ['fri'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'Car',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.cars,
            value: (index, item) => item['value'] ?? '',
            title: (index, item) => item['title'] ?? '',
            group: (index, item) => item['brand'] ?? '',
          ),
          choiceType: AnterosChoiceType.chips,
          choiceGrouped: true,
          modalFilter: true,
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                ),
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Smartphones',
          selectedValue: _smartphone,
          onChange: (selected) {
            setState(() => _smartphone = selected.value);
          },
          choiceType: AnterosChoiceType.chips,
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.smartphones,
            value: (index, item) => item['id'] ?? '',
            title: (index, item) => item['name'] ?? '',
          ),
          choiceStyle: AnterosChoiceStyle(outlined: true),
          choiceActiveStyle: AnterosChoiceStyle(outlined: true),
          modalConfig: AnterosModalConfig(
            type: AnterosModalType.bottomSheet,
            useFilter: true,
            maxHeightFactor: .7,
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Days',
          selectedValue: _day,
          onChange: (selected) => setState(() => _day = selected.value),
          choiceItems: choices.days,
          choiceType: AnterosChoiceType.chips,
          choiceStyle: AnterosChoiceStyle(
            outlined: true,
          ),
          choiceActiveStyle: AnterosChoiceStyle(
            raised: true,
          ),
          modalType: AnterosModalType.popupDialog,
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: Container(
                width: 40,
                alignment: Alignment.center,
                child: const Icon(Icons.calendar_today),
              ),
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
