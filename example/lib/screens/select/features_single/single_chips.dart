import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesSingleChips extends StatefulWidget {
  @override
  _FeaturesSingleChipsState createState() => _FeaturesSingleChipsState();
}

class _FeaturesSingleChipsState extends State<FeaturesSingleChips> {
  String? _car = '';
  String? _category = '';
  String? _day = 'fri';

  @override
  Widget build(BuildContext context) {
    final test = AnterosChoice.listFrom<String, Map<String, String>>(
      source: choices.cars,
      value: (index, item) => item['value'] ?? '',
      title: (index, item) => item['title'] ?? '',
      group: (index, item) => item['brand'] ?? '',
    );

    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          selectedValue: _car,
          choiceItems: test,
          modalTitle: 'Cars Option',
          modalType: AnterosModalType.bottomSheet,
          choiceType: AnterosChoiceType.chips,
          choiceGrouped: true,
          choiceDirection: Axis.horizontal,
          onChange: (selected) => setState(() => _car = selected.value),
          tileBuilder: (context, state) => AnterosTile<dynamic>(
            title: const Text('Car'),
            value: state.selected?.toWidget() ?? Container(),
            isTwoLine: true,
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/yeVtxxPxzbw/100x100',
              ),
            ),
            onTap: state.showModal,
          ),
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Category',
          selectedValue: _category,
          choiceItems: choices.categories,
          modalType: AnterosModalType.bottomSheet,
          choiceType: AnterosChoiceType.chips,
          choiceStyle: AnterosChoiceStyle(outlined: true, showCheckmark: true),
          onChange: (selected) => setState(() => _category = selected.value),
          tileBuilder: (context, state) => AnterosTile.fromState(
            state,
            isTwoLine: true,
            leading: Container(
              width: 40,
              alignment: Alignment.center,
              child: const Icon(Icons.label_outline),
            ),
          ),
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Days',
          selectedValue: _day,
          choiceItems: choices.days,
          onChange: (selected) => setState(() => _day = selected.value),
          modalType: AnterosModalType.popupDialog,
          choiceType: AnterosChoiceType.chips,
          choiceStyle: AnterosChoiceStyle(
            color: Colors.blueGrey,
            raised: true,
          ),
          choiceActiveStyle: AnterosChoiceStyle(
            color: Theme.of(context).primaryColor,
            raised: true,
          ),
          tileBuilder: (context, state) => AnterosTile.fromState(
            state,
            isTwoLine: true,
            leading: Container(
              width: 40,
              alignment: Alignment.center,
              child: const Icon(Icons.calendar_today),
            ),
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
