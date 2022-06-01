import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowSpacerPage extends StatelessWidget {
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
          'RowSpacer Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //
          const SizedBox(height: 10),
          //
          Container(
            color: Colors.yellow,
            child: AnterosRow(
              children: [
                text1(),
                text2(),
              ],
            ),
          ),
          //
          const SizedBox(height: 10),
          //
          Container(
            color: Colors.yellow,
            child: AnterosRow(
              children: [
                text1(),
                text2(),
                AnterosRowSpacer(),
              ],
            ),
          ),
          //
          const SizedBox(height: 10),
          //
          Container(
            color: Colors.yellow,
            child: AnterosRow(
              mainAxisSize: MainAxisSize.max,
              children: [
                text1(),
                text2(),
              ],
            ),
          ),
          //
          const SizedBox(height: 10),
          //
          Container(
            width: 165.0,
            color: Colors.yellow,
            child: AnterosRow(
              children: [
                AnterosRowSpacer(),
                text1(),
                AnterosRowSpacer(),
                text2(),
                AnterosRowSpacer(),
              ],
            ),
          ),
          //
          const SizedBox(height: 10),
          //
          Container(
            width: 165.0,
            color: Colors.yellow,
            child: AnterosRow(
              fitHorizontally: true,
              children: [
                AnterosRowSpacer(),
                text1(),
                AnterosRowSpacer(),
                text2(),
                AnterosRowSpacer(),
              ],
            ),
          ),
          //
          const SizedBox(height: 10),
          Container(width: double.infinity, height: 2.0, color: Colors.black),
          const SizedBox(height: 10),
          //
          // ------------
          //
          Container(
            color: Colors.yellow,
            child: AnterosRow(
              alignment: Alignment.bottomRight,
              innerDistance: 5.0,
              children: <Widget>[
                Container(
                  color: Colors.orange,
                  child: AnterosRow(
                    alignment: Alignment.topRight,
                    children: [
                      text1(),
                      text2(),
                    ],
                  ),
                ),
                AnterosRowSpacer(),
                box1(),
                box2(),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }

  Container text1() => Container(
        color: Colors.red,
        child: const Text("Hello!",
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: TextStyle(fontSize: 27.0)),
      );

  Container text2() => Container(
        color: Colors.blue,
        child: const Text("How are you doing?",
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: TextStyle(fontSize: 20.0)),
      );

  Container box1() => Container(width: 30, height: 40, color: Colors.green);

  Container box2() => Container(width: 30, height: 50, color: Colors.purple);
}
