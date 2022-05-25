import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class ProgrammaticModal extends StatefulWidget {
  @override
  _ProgrammaticModalState createState() => _ProgrammaticModalState();
}

class _ProgrammaticModalState extends State<ProgrammaticModal> {
  List<AnterosChoice<String>> _choices = [
    AnterosChoice<String>(value: 'app', title: 'Apple'),
    AnterosChoice<String>(value: 'ore', title: 'Orange'),
    AnterosChoice<String>(value: 'mel', title: 'Melon'),
  ];

  List<String> _value = [];

  GlobalKey<AnterosMultiState<String>> _smartSelectKey =
      GlobalKey<AnterosMultiState<String>>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _smartSelectKey.currentState?.showModal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnterosSmartSelect<String>.multiple(
      key: _smartSelectKey,
      title: 'Fruit',
      selectedValue: _value,
      onChange: (selected) => setState(() => _value = selected.value),
      choiceItems: _choices,
      tileBuilder: (context, state) {
        return Container();
      },
    );
  }
}
