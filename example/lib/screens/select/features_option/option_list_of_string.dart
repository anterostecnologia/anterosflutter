import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class FeaturesOptionListOfString extends StatefulWidget {
  @override
  _FeaturesOptionListOfStringState createState() =>
      _FeaturesOptionListOfStringState();
}

class _FeaturesOptionListOfStringState
    extends State<FeaturesOptionListOfString> {
  List<int> _categories = [];

  int? _sort = 3;

  List<String> _categoriesOption = [
    'Electronics',
    'Accessories',
    'Smartwatch',
    'Smartphone',
    'Audio & Video',
    'Scientific'
  ];

  List<String> _sortOption = [
    'Popular',
    'Most Reviews',
    'Newest',
    'Low Price',
    'High Price',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        Card(
          elevation: 3,
          margin: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: AnterosSmartSelect<int>.multiple(
                  title: 'Categories',
                  selectedValue: _categories,
                  onChange: (selected) {
                    setState(() => _categories = selected.value);
                  },
                  choiceItems: AnterosChoice.listFrom<int, String>(
                    source: _categoriesOption,
                    value: (index, item) => index,
                    title: (index, item) => item,
                  ),
                  choiceType: AnterosChoiceType.switches,
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
              const SizedBox(
                height: 40,
                child: VerticalDivider(),
              ),
              Expanded(
                child: AnterosSmartSelect<int?>.single(
                  title: 'Sort By',
                  selectedValue: _sort,
                  onChange: (selected) {
                    setState(() => _sort = selected.value);
                  },
                  choiceItems: AnterosChoice.listFrom<int, String>(
                    source: _sortOption,
                    value: (index, item) => index,
                    title: (index, item) => item,
                  ),
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
        const SizedBox(height: 7),
      ],
    );
  }
}
