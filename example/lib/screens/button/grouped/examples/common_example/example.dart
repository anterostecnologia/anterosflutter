import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonExample extends StatelessWidget {
  CommonExample({Key? key}) : super(key: key);

  final controller = AnterosGroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [0, 1, 2, 3, 4],
    disabledIndexes: [10, 12, 13, 14, 15, 23],
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  @override
  Widget build(BuildContext context) {
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
          'Commons Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnterosGroupButton(
          controller: controller,
          isRadio: false,
          buttons: List.generate(25, (i) => '${i + 1}'),
          maxSelected: 10,
          onSelected: (val, i, selected) =>
              debugPrint('Button: $val index: $i selected: $selected'),
        ),
      ),
    );
  }
}
