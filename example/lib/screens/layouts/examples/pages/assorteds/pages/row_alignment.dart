import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAlignmentPage extends StatelessWidget {
  //
  static const List<Widget> boxes = [
    AnterosBox.r(width: 50, height: 20),
    AnterosBox.g(width: 50, height: 35),
    AnterosBox.b(width: 50, height: 50),
  ];

  @override
  Widget build(BuildContext context) {
    //
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
          'Row Alignment Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            //
            const Text("topLeft"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.topLeft,
                innerDistance: 6.0,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("topCenter"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.topCenter,
                innerDistance: 6.0,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("topRight"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.topRight,
                innerDistance: 6.0,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 15.0),
            //
            const Text("centerLeft"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.centerLeft,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("center"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.center,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("centerRight"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.centerRight,
                outerDistance: 20.0,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 15.0),
            //
            const Text("bottomLeft"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.bottomLeft,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("bottomCenter"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.bottomCenter,
                children: boxes,
              ),
            ),
            //
            const AnterosBox(height: 4.0),
            //
            const Text("bottomRight"),
            AnterosBox(
              color: Colors.black,
              width: double.infinity,
              child: AnterosRow(
                alignment: Alignment.bottomRight,
                children: boxes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
