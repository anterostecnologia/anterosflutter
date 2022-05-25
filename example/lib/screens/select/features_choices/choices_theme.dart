import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../widgets/icon_badge.dart';
import '../choices.dart' as choices;

class FeaturesChoicesTheme extends StatefulWidget {
  @override
  _FeaturesChoicesThemeState createState() => _FeaturesChoicesThemeState();
}

class _FeaturesChoicesThemeState extends State<FeaturesChoicesTheme> {
  List<String> _smartphones = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'Smartphones',
          selectedValue: _smartphones,
          onChange: (selected) {
            setState(() => _smartphones = selected.value);
          },
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.smartphones,
            value: (index, item) => item['id'] ?? '',
            title: (index, item) => item['name'] ?? '',
            group: (index, item) => item['brand'] ?? '',
          ),
          choiceConfig: AnterosChoiceConfig(
            type: AnterosChoiceType.switches,
            useDivider: true,
            overscrollColor: Colors.green,
            style: const AnterosChoiceStyle(
              titleStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              color: Colors.white,
            ),
            activeStyle: const AnterosChoiceStyle(
              color: Colors.green,
            ),
          ),
          groupEnabled: true,
          groupHeaderStyle: AnterosGroupHeaderStyle(
            backgroundColor: Colors.blueGrey[600],
            textStyle: const TextStyle(color: Colors.white),
          ),
          modalConfig: AnterosModalConfig(
            type: AnterosModalType.fullPage,
            useFilter: true,
            style: AnterosModalStyle(
              backgroundColor: Colors.blueGrey[800],
            ),
            headerStyle: const AnterosModalHeaderStyle(
              elevation: 4,
              centerTitle: true,
              backgroundColor: Colors.green,
              textStyle: TextStyle(color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
            ),
          ),
          choiceDividerBuilder: (context, i) {
            return const Divider(
              color: Colors.white24,
              indent: 0.0,
              endIndent: 0.0,
            );
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: IconBadge(
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).primaryColor,
                counter: state.selected.length,
              ),
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
