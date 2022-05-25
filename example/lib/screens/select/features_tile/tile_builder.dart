import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesTileBuilder extends StatefulWidget {
  @override
  _FeaturesTileBuilderState createState() => _FeaturesTileBuilderState();
}

class _FeaturesTileBuilderState extends State<FeaturesTileBuilder> {
  List<String> _cars = [
    'bmw-x2',
    'bmw-x1',
    'honda-hrv',
    'honda-jazz',
    'hyundai-i10',
    'bmw-sgt'
  ];
  List<String> _categories = [];
  String? _sort = 'popular';

  Color get primaryColor => Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 7),
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnterosSmartSelect<String>.multiple(
                    title: 'Categories',
                    selectedValue: _categories,
                    choiceItems: choices.categories,
                    onChange: (selected) {
                      setState(() => _categories = selected.value);
                    },
                    modalType: AnterosModalType.bottomSheet,
                    modalHeader: false,
                    tileBuilder: (context, state) {
                      return AnterosTile.fromState(
                        state,
                        trailing: const Icon(Icons.arrow_drop_down),
                        isTwoLine: true,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(),
                ),
                Expanded(
                  child: AnterosSmartSelect<String?>.single(
                    title: 'Sort By',
                    selectedValue: _sort,
                    choiceItems: choices.sorts,
                    onChange: (selected) {
                      setState(() => _sort = selected.value);
                    },
                    modalType: AnterosModalType.popupDialog,
                    modalHeader: false,
                    tileBuilder: (context, state) {
                      return AnterosTile.fromState(
                        state,
                        trailing: const Icon(Icons.arrow_drop_down),
                        isTwoLine: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          AnterosSmartSelect<String>.multiple(
            title: 'Cars',
            selectedValue: _cars,
            choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
              source: choices.cars,
              value: (index, item) => item['value'] ?? '',
              title: (index, item) => item['title'] ?? '',
              group: (index, item) => item['body'] ?? '',
            ),
            onChange: (selected) => setState(() => _cars = selected.value),
            modalType: AnterosModalType.bottomSheet,
            modalConfirm: true,
            modalFilter: true,
            choiceGrouped: true,
            tileBuilder: (context, state) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: AnterosTile.fromState(
                  state,
                  hideValue: true,
                  title: const Text('Cars'),
                  trailing: const Icon(Icons.add_circle_outline),
                  body: AnterosTileChips(
                    chipLength: state.selected.length,
                    chipLabelBuilder: (context, i) {
                      return Text(state.selected.choice?[i].title ?? '');
                    },
                    chipOnDelete: (i) {
                      setState(() {
                        _cars.remove(state.selected.choice?[i].value);
                      });
                    },
                    chipColor: primaryColor,
                    chipRaised: true,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
