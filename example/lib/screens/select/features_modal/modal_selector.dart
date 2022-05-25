import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesModalSelector extends StatefulWidget {
  @override
  _FeaturesModalSelectorState createState() => _FeaturesModalSelectorState();
}

class _FeaturesModalSelectorState extends State<FeaturesModalSelector> {
  List<String> _fruit = ['mel'];
  List<String> _smartphone = [];
  List<String> _car = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'Fruit',
          selectedValue: _fruit,
          onChange: (selected) {
            setState(() => _fruit = selected.value);
          },
          choiceItems: choices.fruits,
          modalType: AnterosModalType.popupDialog,
          modalConfirm: true,
          modalValidation: (value) {
            return value.length > 0 ? '' : 'Select at least one';
          },
          modalHeaderStyle: AnterosModalHeaderStyle(
            backgroundColor: Theme.of(context).cardColor,
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: Container(
                width: 40,
                alignment: Alignment.center,
                child: const Icon(Icons.shopping_cart),
              ),
            );
          },
          modalActionsBuilder: (context, state) {
            return <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: state.choiceSelectorAll,
              )
            ];
          },
          modalDividerBuilder: (context, state) {
            return const Divider(height: 1);
          },
          modalFooterBuilder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 7.0,
              ),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () => state.closeModal(confirmed: false),
                  ),
                  const SizedBox(width: 5),
                  FlatButton(
                    child: Text('OK (${state.selection?.length ?? 0})'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: (state.selection?.isValid ?? true)
                        ? () => state.closeModal(confirmed: true)
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Phones',
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
            meta: (index, item) => item,
          ),
          choiceType: AnterosChoiceType.chips,
          choiceActiveStyle: AnterosChoiceStyle(
            color: Theme.of(context).primaryColor,
          ),
          modalFilter: true,
          modalType: AnterosModalType.fullPage,
          modalFooterBuilder: (context, state) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ActionButton(
                    label: const Text('All/None'),
                    onTap: () {
                      state.selection?.toggle(state.choices?.items ?? []);
                    },
                  ),
                  ActionButton(
                    label: const Text('Low End'),
                    onTap: () {
                      state.selection?.choice = state.choices?.items
                          ?.where(
                              (item) => item.meta['category'] == 'Budget Phone')
                          .toList();
                    },
                  ),
                  ActionButton(
                    label: const Text('Mid End'),
                    onTap: () {
                      state.selection?.choice = state.choices?.items
                          ?.where((item) =>
                              item.meta['category'] == 'Mid End Phone')
                          .toList();
                    },
                  ),
                  ActionButton(
                    label: const Text('High End'),
                    onTap: () {
                      state.selection?.choice = state.choices?.items
                          ?.where((item) =>
                              item.meta['category'] == 'Flagship Phone')
                          .toList();
                    },
                  ),
                ],
              ),
            );
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              hideValue: true,
              trailing: const Icon(Icons.add_circle_outline),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
              body: AnterosTileChips(
                chipColor: Theme.of(context).primaryColor,
                chipLength: state.selected.length,
                chipLabelBuilder: (context, i) {
                  return Text(state.selected.choice?[i].title ?? '');
                },
                chipOnDelete: (i) {
                  setState(() {
                    _smartphone.remove(state.selected.choice?[i].value);
                  });
                },
                // placeholder: Container(),
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Car',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: AnterosChoice.listFrom<String, Map<String, String>>(
            source: choices.cars,
            value: (index, item) => item['value'] ?? '',
            title: (index, item) => item['title'] ?? '',
            group: (index, item) => item['brand'] ?? '',
          ),
          groupConfig: AnterosGroupConfig(
            enabled: true,
            useSelector: true,
          ),
          modalConfig: AnterosModalConfig(
            type: AnterosModalType.bottomSheet,
            maxHeightFactor: .7,
          ),
          modalActionsBuilder: (context, state) {
            return [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: state.choiceSelectorAll,
              ),
            ];
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
          // groupHeaderBuilder: (context, state, group) {
          //   return AnterosGroupHeader(
          //     style: group.headerStyle.copyWith(
          //       padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
          //     ),
          //     title: AnterosText(
          //       text: group.name,
          //       highlight: state.filter.query,
          //       style: group.headerStyle.textStyle,
          //       highlightColor: group.headerStyle.highlightColor ?? Color(0xFFFFF176),
          //     ),
          //     trailing: state.choiceSelector(group.values)
          //   );
          // },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final Widget label;
  final VoidCallback onTap;

  ActionButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: label,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onTap,
    );
  }
}
