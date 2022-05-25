import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class FeaturesTheme extends StatefulWidget {
  @override
  _FeaturesThemeState createState() => _FeaturesThemeState();
}

class _FeaturesThemeState extends State<FeaturesTheme> {
  Color _themeColor = Colors.red;

  ThemeData get theme => Theme.of(context);

  List<List> modes = [
    [ThemeMode.system, 'System', Icons.brightness_auto],
    [ThemeMode.light, 'Light', Icons.brightness_low],
    [ThemeMode.dark, 'Dark', Icons.brightness_2],
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AnterosSmartSelect<ThemeMode?>.single(
            title: 'Brightness',
            selectedValue: ThemeMode.system,
            onChange: (selected) {},
            modalType: AnterosModalType.bottomSheet,
            modalHeader: false,
            choiceItems: AnterosChoice.listFrom<ThemeMode, List>(
              source: modes,
              value: (i, v) => v[0],
              title: (i, v) => v[1],
              meta: (i, v) => v[2],
            ),
            choiceLayout: AnterosChoiceLayout.grid,
            choiceGrid: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            choiceBuilder: (context, state, choice) {
              return Card(
                elevation: 3,
                color: choice.selected ? theme.primaryColor : theme.cardColor,
                child: InkWell(
                  onTap: () => choice.select?.call(true),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        choice.meta,
                        size: 48,
                        color: choice.selected ? Colors.white : null,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        choice.title ?? '',
                        style: TextStyle(
                          color: choice.selected ? Colors.white : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            tileBuilder: (context, state) {
              return AnterosTile.fromState(state,
                  isTwoLine: true, trailing: const Icon(Icons.brightness_low));
            },
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(width: 1),
        ),
        Expanded(
          child: AnterosSmartSelect<Color>.single(
            title: 'Color',
            selectedValue: _themeColor,
            onChange: (selected) {},
            choiceItems: AnterosChoice.listFrom<Color, Color>(
              source: Colors.primaries,
              value: (i, v) => v,
              title: (i, v) => '',
            ),
            choiceLayout: AnterosChoiceLayout.grid,
            choiceGrid: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 5,
            ),
            choiceBuilder: (context, state, choice) {
              return Card(
                color: choice.value,
                child: InkWell(
                  onTap: () => choice.select?.call(true),
                  child: choice.selected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Container(),
                ),
              );
            },
            modalType: AnterosModalType.popupDialog,
            modalHeader: false,
            tileBuilder: (context, state) {
              return AnterosTile<Color?>.fromState(
                state,
                isTwoLine: true,
                trailing: Card(
                  color: _themeColor,
                  child: const SizedBox(
                    width: 24,
                    height: 24,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
