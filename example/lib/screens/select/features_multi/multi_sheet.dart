import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesMultiSheet extends StatefulWidget {
  @override
  _FeaturesMultiSheetState createState() => _FeaturesMultiSheetState();
}

class _FeaturesMultiSheetState extends State<FeaturesMultiSheet> {
  List<String> _os = ['and', 'tux'];
  List<String> _hero = ['bat', 'spi'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'OS',
          selectedValue: _os,
          onChange: (selected) => setState(() => _os = selected.value),
          choiceItems: choices.os,
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
        AnterosSmartSelect<String>.multiple(
          title: 'Super Hero',
          selectedValue: _hero,
          onChange: (selected) => setState(() => _hero = selected.value),
          choiceItems: choices.heroes,
          modalType: AnterosModalType.bottomSheet,
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
        Container(height: 7),
      ],
    );
  }
}
