import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesSingleSheet extends StatefulWidget {
  @override
  _FeaturesSingleSheetState createState() => _FeaturesSingleSheetState();
}

class _FeaturesSingleSheetState extends State<FeaturesSingleSheet> {
  String? _os = 'win';
  String? _hero = 'iro';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'OS',
          selectedValue: _os,
          choiceItems: choices.os,
          onChange: (selected) => setState(() => _os = selected.value),
          modalType: AnterosModalType.bottomSheet,
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
        AnterosSmartSelect<String?>.single(
          title: 'Super Hero',
          selectedValue: _hero,
          choiceItems: choices.heroes,
          modalType: AnterosModalType.bottomSheet,
          onChange: (selected) => setState(() => _hero = selected.value),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/8I-ht65iRww/100x100',
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
