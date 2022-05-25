import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class FeaturesColor extends StatefulWidget {
  @override
  _FeaturesColorState createState() => _FeaturesColorState();
}

class _FeaturesColorState extends State<FeaturesColor> {
  Color _themeColor = Colors.red;

  List<AnterosChoice<Color>> colors = AnterosChoice.listFrom<Color, Color>(
    source: Colors.primaries,
    value: (i, v) => v,
    title: (i, v) => '',
  );

  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return AnterosSmartSelect<Color>.single(
      title: 'Color',
      selectedValue: _themeColor,
      onChange: (selected) {
        setState(() => _themeColor = selected.value);
      },
      choiceItems: colors,
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
        return IconButton(
          icon: Icon(Icons.color_lens),
          onPressed: state.showModal,
        );
      },
    );
  }
}
