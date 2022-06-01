import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowFillPage extends StatelessWidget {
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
          'Row Fill Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //
            const SizedBox(height: 20.0),
            const Text("fill: false"),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("MainAxisSize.max"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("MainAxisSize.max"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("MainAxisSize.min"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("MainAxisSize.min"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("Hello"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("This is some larger text"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("Hello"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("This is some really very, "
                        "extremely large text "
                        "that won't fit a single line at all"),
                  )
                ],
              ),
            ),
            //
            // -------------------
            //
            const SizedBox(height: 40.0),
            Container(width: double.infinity, height: 1.0, color: Colors.black),
            const SizedBox(height: 40.0),
            const Text("fill: true"),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                fill: true,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("MainAxisSize.max"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("MainAxisSize.max"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                fill: true,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("MainAxisSize.min"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("MainAxisSize.min"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                fill: true,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("Hello"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("This is some larger text"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.yellow,
              child: AnterosRow(
                fill: true,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text("Hello"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue.withOpacity(0.80),
                    child: const Text("This is some really very, "
                        "extremely large text "
                        "that won't fit a single line at all"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
