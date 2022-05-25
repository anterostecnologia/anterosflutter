import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesChoicesDivider extends StatefulWidget {
  @override
  _FeaturesChoicesDividerState createState() => _FeaturesChoicesDividerState();
}

class _FeaturesChoicesDividerState extends State<FeaturesChoicesDivider> {
  String? _car;
  List<String> _smartphone = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Car',
          placeholder: 'Choose one',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.cars,
            value: (index, item) => item['value'] ?? '',
            title: (index, item) => item['title'] ?? '',
            group: (index, item) => item['body'] ?? '',
          ),
          choiceGrouped: true,
          choiceDivider: true,
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
          placeholder: 'Choose one',
          selectedValue: _smartphone,
          onChange: (selected) {
            setState(() => _smartphone = selected.value);
          },
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.smartphones,
            value: (index, item) => item['id'] ?? '',
            title: (index, item) => item['name'] ?? '',
            group: (index, item) => item['brand'] ?? '',
          ),
          choiceGrouped: true,
          choiceConfig: const AnterosChoiceConfig(
            useDivider: true,
          ),
          modalType: AnterosModalType.bottomSheet,
          modalFilter: true,
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
        const SizedBox(height: 7),
      ],
    );
  }
}
