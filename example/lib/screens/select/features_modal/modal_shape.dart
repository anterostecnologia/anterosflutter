import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesModalShape extends StatefulWidget {
  @override
  _FeaturesModalShapeState createState() => _FeaturesModalShapeState();
}

class _FeaturesModalShapeState extends State<FeaturesModalShape> {
  String? _framework = 'flu';
  List<String> _hero = ['bat', 'spi'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Frameworks',
          selectedValue: _framework,
          onChange: (selected) {
            setState(() => _framework = selected.value);
          },
          choiceType: AnterosChoiceType.radios,
          choiceItems: choices.frameworks,
          modalType: AnterosModalType.popupDialog,
          modalHeader: false,
          modalConfig: const AnterosModalConfig(
            style: AnterosModalStyle(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: CircleAvatar(
                child: Text(
                  '${state.selected.toString()[0]}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
        Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Super Hero',
          selectedValue: _hero,
          onChange: (selected) => setState(() => _hero = selected.value),
          choiceItems: choices.heroes,
          choiceType: AnterosChoiceType.switches,
          modalType: AnterosModalType.bottomSheet,
          modalConfig: const AnterosModalConfig(
            style: AnterosModalStyle(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
            ),
            headerStyle: AnterosModalHeaderStyle(
              centerTitle: true,
            ),
          ),
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
