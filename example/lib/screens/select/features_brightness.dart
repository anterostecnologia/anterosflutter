import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class FeaturesBrightness extends StatefulWidget {
  @override
  _FeaturesBrightnessState createState() => _FeaturesBrightnessState();
}

class _FeaturesBrightnessState extends State<FeaturesBrightness> {
  ThemeData get theme => Theme.of(context);

  final List<AnterosChoice<int>> modes = [
    AnterosChoice(value: 0, title: 'System', meta: Icons.brightness_auto),
    AnterosChoice(value: 1, title: 'Light', meta: Icons.brightness_low),
    AnterosChoice(value: 2, title: 'Dark', meta: Icons.brightness_2),
  ];

  @override
  Widget build(BuildContext context) {
    return AnterosSmartSelect<int>.single(
      title: 'Brightness',
      selectedValue: ThemeMode.system.index,
      onChange: (selected) {},
      modalType: AnterosModalType.bottomSheet,
      modalHeader: false,
      choiceItems: modes,
      choiceConfig: const AnterosChoiceConfig(
        type: AnterosChoiceType.cards,
        layout: AnterosChoiceLayout.grid,
        gridCount: 3,
        gridSpacing: 5,
      ),
      choiceStyle: AnterosChoiceStyle(spacing: 7),
      choiceActiveStyle: AnterosChoiceStyle(
        titleStyle: TextStyle(color: Colors.white),
      ),
      choiceSecondaryBuilder: (context, state, choice) {
        return Icon(
          choice.meta,
          size: 48,
          color: choice.selected ? Colors.white : null,
        );
      },
      tileBuilder: (context, state) {
        return IconButton(
          icon: Icon(modes[state.selected?.value ?? 0].meta),
          onPressed: state.showModal,
        );
      },
    );
  }
}
