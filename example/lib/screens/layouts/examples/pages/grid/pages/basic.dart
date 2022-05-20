import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicGridPage extends StatelessWidget {
  const BasicGridPage({Key? key}) : super(key: key);

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
            'Basic layout',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AnterosLayoutGrid(
            columnGap: 12,
            rowGap: 12,
            columnSizes: [1.fr, 1.fr, 1.fr, 0.75.fr],
            rowSizes: [
              32.px,
              32.px,
              32.px,
            ],
            children: [
              AnterosGridPlacement(
                rowStart: 0,
                columnStart: 0,
                columnSpan: 4,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 1,
                columnStart: 0,
                columnSpan: 3,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 1,
                columnStart: 3,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 2,
                columnStart: 0,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 2,
                columnStart: 1,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 2,
                columnStart: 2,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              AnterosGridPlacement(
                rowStart: 2,
                columnStart: 3,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ));
  }
}
