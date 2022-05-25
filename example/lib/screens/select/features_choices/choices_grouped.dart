import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesChoicesGrouped extends StatefulWidget {
  @override
  _FeaturesChoicesGroupedState createState() => _FeaturesChoicesGroupedState();
}

class _FeaturesChoicesGroupedState extends State<FeaturesChoicesGrouped> {
  String? _smartphone;
  List<String> _car = [];

  Color get primaryColor => Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
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
          groupEnabled: true,
          groupSortBy: AnterosGroupSort.byCountInDesc(),
          modalType: AnterosModalType.bottomSheet,
          tileBuilder: (context, state) {
            return AnterosTile<dynamic>(
              title: state.titleWidget,
              value: state.selected?.toWidget() ?? Container(),
              onTap: state.showModal,
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
          title: 'Cars',
          placeholder: 'Choose one or more',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.cars,
            value: (index, item) => item['value'] ?? '',
            title: (index, item) => item['title'] ?? '',
            group: (index, item) => item['body'] ?? '',
          ),
          choiceActiveStyle: const AnterosChoiceStyle(color: Colors.redAccent),
          modalType: AnterosModalType.bottomSheet,
          modalConfirm: true,
          modalFilter: true,
          groupEnabled: true,
          groupSortBy: AnterosGroupSort.byNameInAsc(),
          groupBuilder: (context, state, group) {
            return AnterosStickyHeader(
              stickyContent: state.groupHeader(group),
              content: state.groupChoices(group),
            );
          },
          groupHeaderBuilder: (context, state, group) {
            return Container(
              color: primaryColor,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: AnterosText(
                text: group.name,
                highlight: state.filter?.value,
                highlightColor: Colors.teal,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
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
        const SizedBox(height: 7),
      ],
    );
  }
}
