import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClippersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
              ),
            )),
        title: const Text(
          'Clippers',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          ClipPath(
            clipper: AnterosWaveClipperOne(flip: true, reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(
                  child:
                      Text("AnterosWaveClipperTwo(flip: true,reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperOne(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("AnterosWaveClipperTwo(flip: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperTwo(flip: true, reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(
                  child:
                      Text("AnterosWaveClipperTwo(flip: true,reverse:true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperTwo(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("AnterosWaveClipperTwo(flip: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosOvalBottomBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Center(child: Text("AnterosOvalBottomBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosOvalRightBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.red,
              child: Center(child: Text("AnterosOvalRightBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosSideCutClipper(),
            child: Container(
              height: 200,
              color: Colors.pink,
              //play with scals to get more clear versions
              child: Center(child: Text("AnterosSideCutClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosOvalLeftBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(child: Text("AnterosOvalLeftBorderClipper()")),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosArcClipper(),
            child: Container(
              height: 100,
              color: Colors.pink,
              child: Center(child: Text("AnterosArcClipper()")),
            ),
          ),
          ClipPath(
            clipper: AnterosPointsClipper(),
            child: Container(
              height: 100,
              color: Colors.indigo,
              child: Center(child: Text("AnterosPointsClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosTriangleClipper(),
            child: Container(
              height: 100,
              color: Colors.deepOrange,
              child: Center(child: Text("AnterosTriangleClipper()")),
            ),
          ),
          ClipPath(
            clipper: AnterosMovieTicketClipper(),
            child: Container(
              height: 100,
              color: Colors.deepPurple,
              child: Center(child: Text("AnterosMovieTicketClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosMovieTicketBothSidesClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child:
                  Center(child: Text("AnterosMovieTicketBothSidesClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosMultipleRoundedCurveClipper(),
            child: Container(
              height: 100,
              color: Colors.pink,
              child:
                  Center(child: Text("AnterosMultipleRoundedCurveClipper()")),
            ),
          ),
          SizedBox(height: 20.0),
          ClipPath(
            clipper: AnterosMultiplePointedEdgeClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(child: Text("AnterosMultiplePointedEdgeClipper()")),
            ),
          ),
          SizedBox(height: 20.0),
          ClipPath(
            clipper: AnterosOctagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.red,
              child: Center(child: Text("AnterosOctagonalClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosHexagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.blueAccent,
              child: Center(child: Text("AnterosHexagonalClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosHexagonalClipper(reverse: true),
            child: Container(
              height: 220,
              color: Colors.orangeAccent,
              child:
                  Center(child: Text("AnterosHexagonalClipper(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosParallelogramClipper(),
            child: Container(
              height: 220,
              color: Colors.pinkAccent,
              child: Center(child: Text("AnterosParallelogramClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosDiagonalPathClipperOne(),
            child: Container(
              height: 120,
              color: Colors.red,
              child: Center(child: Text("AnterosDiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosDiagonalPathClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: Center(child: Text("AnterosDiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperOne(),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child: Center(child: Text("AnterosWaveClipperOne()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperOne(reverse: true),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child:
                  Center(child: Text("AnterosWaveClipperOne(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: Center(child: Text("AnterosWaveClipperTwo()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosWaveClipperTwo(reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child:
                  Center(child: Text("AnterosWaveClipperTwo(reverse: true)")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosRoundedDiagonalPathClipper(),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.orange,
              ),
              child: Center(child: Text("AnterosRoundedDiagonalPathClipper()")),
            ),
          ),
          SizedBox(height: 10.0),
          ClipPath(
            clipper: AnterosOvalTopBorderClipper(),
            child: Container(
              height: 120,
              color: Colors.yellow,
              child: Center(child: Text("AnterosOvalTopBorderClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: AnterosArrowClipper(70, 80, Edge.LEFT),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: Center(child: Text("AnterosArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: AnterosArrowClipper(70, 80, Edge.RIGHT),
            child: Container(
              height: 120,
              color: Colors.red,
              child: Center(child: Text("AnterosArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: AnterosArrowClipper(20, 300, Edge.TOP),
            child: Container(
              height: 70,
              width: 50,
              color: Colors.blue,
              child: Center(child: Text("AnterosArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: AnterosArrowClipper(70, 80, Edge.BOTTOM),
            child: Container(
              height: 120,
              color: Colors.green,
              child: Center(child: Text("AnterosArrowClipper()")),
            ),
          ),
          SizedBox(height: 10),
          ClipPath(
            clipper: AnterosStarClipper(8),
            child: Container(
              height: 450,
              color: Colors.indigo,
              child: Center(child: Text("AnterosStarClipper()")),
            ),
          ),
          ClipPath(
            clipper: AnterosMessageClipper(borderRadius: 16),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.red,
              ),
              child: Center(child: Text("AnterosMessageClipper()")),
            ),
          ),
        ],
      ),
    );
  }
}
