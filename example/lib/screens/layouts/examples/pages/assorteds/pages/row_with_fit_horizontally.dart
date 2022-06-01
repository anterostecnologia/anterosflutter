import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWithFitHorizontallyPage extends StatelessWidget {
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
          'Row with FitHorizontally Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              const SizedBox(height: 10),
              //
              for (double width = 360; width >= 0.0; width -= 100)
                Column(children: [
                  const SizedBox(height: 8),
                  //
                  // fitHorizontally: false
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: 55,
                    color: Colors.yellow[600],
                    child: AnterosRow(
                      separator: separator(),
                      outerDistance: 6.0,
                      innerDistance: 12.0,
                      fitHorizontally: false,
                      children: [
                        text1(),
                        text2(),
                        text3(),
                      ],
                    ),
                  ),
                  //
                  // fitHorizontally: true
                  // (shrinkLimit is the default: 67%)
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: 55,
                    color: Colors.yellow[500],
                    child: AnterosRow(
                      separator: separator(),
                      outerDistance: 6.0,
                      innerDistance: 12.0,
                      fitHorizontally: true,
                      children: [
                        text1(),
                        text2(),
                        text3(),
                      ],
                    ),
                  ),
                  // fitHorizontally: true
                  // shrinkLimit: 0.0
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: 55,
                    color: Colors.yellow[300],
                    child: AnterosRow(
                      separator: separator(),
                      outerDistance: 6.0,
                      innerDistance: 12.0,
                      fitHorizontally: true,
                      shrinkLimit: 0.0,
                      children: [
                        text1(),
                        text2(),
                        text3(),
                      ],
                    ),
                  ),
                ]),
              //
            ],
          ),
        ),
      ),
    );
  }

  Container separator() =>
      Container(width: 2, height: 50, color: Colors.black26);

  Text text1() => const Text(
        "So long",
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 20, color: Colors.blue),
        maxLines: 1,
        softWrap: false,
      );

  Text text2() => const Text(
        "farewell",
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 20, color: Colors.red),
        maxLines: 1,
        softWrap: false,
      );

  Text text3() => const Text(
        "auf Wiedersehen",
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 20, color: Colors.red),
        maxLines: 1,
        softWrap: false,
      );
}
