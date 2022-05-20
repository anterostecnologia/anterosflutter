import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class PietPaintingPage extends StatelessWidget {
  const PietPaintingPage({Key? key}) : super(key: key);

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
            'Grid layout',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: background,
          child: AnterosLayoutGrid(
            columnGap: 12,
            rowGap: 12,
            areas: '''
          r R B B  B
          r R Y Y  Y
          y R Y Y  Y
          y R g b yy
        ''',
            // A number of extension methods are provided for concise track sizing
            columnSizes: [1.0.fr, 3.5.fr, 1.3.fr, 1.3.fr, 1.3.fr],
            rowSizes: [
              1.0.fr,
              0.3.fr,
              1.5.fr,
              1.2.fr,
            ],
            children: [
              // Column 1
              gridArea('r').containing(Container(color: cellRed)),
              gridArea('y').containing(Container(color: cellMustard)),
              // Column 2
              gridArea('R').containing(Container(color: cellRed)),
              // Column 3
              gridArea('B').containing(Container(color: cellBlue)),
              gridArea('Y').containing(Container(color: cellMustard)),
              gridArea('g').containing(Container(color: cellGrey)),
              // Column 4
              gridArea('b').containing(Container(color: cellBlue)),
              // Column 5
              gridArea('yy').containing(Container(color: cellMustard)),
            ],
          ),
        ));
  }
}
