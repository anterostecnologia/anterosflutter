import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
            'Wrap Example',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[800],
          alignment: Alignment.center,
          child: Container(
            width: 200,
            color: Colors.grey[300],
            child: AnterosWrap(
              alignment: AnterosWrapAlignment.center,
              wrapType: AnterosWrapType.balanced,
              spacing: 5.0,
              lineSpacing: 2.0,
              children: [
                const AnterosBox(color: Colors.black, width: 200, height: 2),
                const AnterosBox.r(width: 100 - 5.0, height: 20),
                const AnterosBox.g(width: 100, height: 20),
                const AnterosBox(color: Colors.black, width: 200, height: 2),
                const AnterosBox.r(width: 60, height: 20),
                const AnterosBox.g(width: 60, height: 20),
                const AnterosBox.b(width: 60, height: 20),
                const AnterosBox.y(width: 60, height: 20),
                const AnterosBox(color: Colors.black, width: 200, height: 2),
                const AnterosBox.r(width: 50, height: 30),
                const AnterosBox.g(width: 140, height: 50),
                const AnterosBox.b(width: 180, height: 70),
                const AnterosBox.y(width: 40, height: 25),
                const AnterosBox.r(width: 50, height: 25),
                const AnterosBox.g(width: 60, height: 25),
                const AnterosBox.b(width: 80, height: 25),
                const AnterosBox.y(width: 120, height: 30),
                const AnterosBox.r(width: 5, height: 40),
                const AnterosBox(color: Colors.black, width: 200, height: 2),
                ...List<Widget>.filled(
                    200 ~/ (4 + 5), const AnterosBox.g(width: 4, height: 5)),
              ],
            ),
          ),
        ),
      );
}
