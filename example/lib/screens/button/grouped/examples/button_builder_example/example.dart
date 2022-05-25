import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBuilderExample extends StatefulWidget {
  ButtonBuilderExample({Key? key}) : super(key: key);

  @override
  State<ButtonBuilderExample> createState() => _ButtonBuilderExampleState();
}

class _ButtonBuilderExampleState extends State<ButtonBuilderExample> {
  late AnterosGroupButtonController _checkboxesController;
  late AnterosGroupButtonController _radioController;

  final _checkboxButtons = [
    'Michael Jordan',
    'Magic Johnson',
    'LeBron James',
    'Kareem Abdul-Jabbar',
    'Wilt Chamberlain',
    'Larry Bird',
  ];

  final _radioButtons = [
    'Cola',
    'Potato chips',
    'Pudding',
  ];

  @override
  void initState() {
    _checkboxesController = AnterosGroupButtonController(
      selectedIndexes: [2],
      disabledIndexes: [4],
      onDisablePressed: (index) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_checkboxButtons[index]} is disabled')),
      ),
    );

    _radioController = AnterosGroupButtonController(
      selectedIndexes: [1],
      disabledIndexes: [2, 3],
      onDisablePressed: (index) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_radioButtons[index]} is disabled')),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Group Button',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Checkbox buttons',
              style: theme.textTheme.headline5,
            ),
          ),
          AnterosGroupButton(
            controller: _checkboxesController,
            isRadio: false,
            options: AnterosGroupButtonOptions(
              groupingType: AnterosGroupingType.column,
            ),
            buttons: _checkboxButtons,
            buttonIndexedBuilder: (selected, index, context) {
              return CheckBoxTile(
                title: _checkboxButtons[index],
                selected: selected,
                onTap: () {
                  if (!selected) {
                    _checkboxesController.selectIndex(index);
                    return;
                  }
                  _checkboxesController.unselectIndex(index);
                },
              );
            },
            onSelected: (val, i, selected) =>
                debugPrint('Button: $val index: $i $selected'),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Radio buttons',
              style: theme.textTheme.headline5,
            ),
          ),
          AnterosGroupButton(
            controller: _radioController,
            isRadio: true,
            options: AnterosGroupButtonOptions(
                groupingType: AnterosGroupingType.column),
            buttons: _radioButtons,
            buttonIndexedBuilder: (selected, index, context) {
              return RadioTile(
                title: _radioButtons[index],
                selected: _radioController.selectedIndex,
                index: index,
                onTap: () {
                  _radioController.selectIndex(index);
                },
              );
            },
            onSelected: (val, i, selected) =>
                debugPrint('Button: $val index: $i $selected'),
          ),
        ],
      ),
    );
  }
}

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.index,
    required this.title,
  }) : super(key: key);

  final String title;
  final int index;
  final int? selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: Radio<int>(
        groupValue: selected,
        value: index,
        onChanged: (val) {
          onTap();
        },
      ),
    );
  }
}

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: Checkbox(
        value: selected,
        onChanged: (val) {
          onTap();
        },
      ),
    );
  }
}
