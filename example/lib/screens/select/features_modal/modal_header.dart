import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../widgets/icon_badge.dart';
import '../choices.dart' as choices;

class FeaturesModalHeader extends StatefulWidget {
  @override
  _FeaturesModalHeaderState createState() => _FeaturesModalHeaderState();
}

class _FeaturesModalHeaderState extends State<FeaturesModalHeader> {
  List<String> _month = ['apr'];
  String? _framework = 'flu';
  List<String> _hero = ['bat', 'spi'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'Month',
          selectedValue: _month,
          onChange: (selected) => setState(() => _month = selected.value),
          choiceItems: choices.months,
          choiceActiveStyle: const AnterosChoiceStyle(color: Colors.red),
          modalFilter: true,
          modalHeaderStyle: const AnterosModalHeaderStyle(
            elevation: 4,
            centerTitle: true,
            backgroundColor: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: IconBadge(
                icon: const Icon(Icons.calendar_today),
                counter: state.selected.length,
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Frameworks',
          selectedValue: _framework,
          onChange: (selected) {
            setState(() => _framework = selected.value);
          },
          choiceItems: choices.frameworks,
          modalConfig: AnterosModalConfig(
            type: AnterosModalType.popupDialog,
            headerStyle: AnterosModalHeaderStyle(
              backgroundColor: Theme.of(context).primaryColor,
              textStyle: Theme.of(context).primaryTextTheme.headline6,
              centerTitle: true,
              elevation: 0,
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
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Super Hero',
          selectedValue: _hero,
          onChange: (selected) => setState(() => _hero = selected.value),
          choiceItems: choices.heroes,
          modalType: AnterosModalType.bottomSheet,
          modalStyle: AnterosModalStyle(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
            ),
          ),
          modalHeaderBuilder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                ),
                state.modalTitle,
                SizedBox(height: 15),
              ],
            );
          },
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
