import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitHorizontallyBasePage extends StatelessWidget {
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
          'FitHorizontally Baseline Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: AnterosBox(
        // color: Colors.red[800],
        child: Center(
          child: Column(
            children: [
              const AnterosBox(height: 40),
              const Text("Row with CrossAxisAlignment.center:"),
              const AnterosBox(height: 20),
              _row(false),
              const AnterosBox(height: 70),
              const Text("Row with CrossAxisAlignment.baseline:"),
              const AnterosBox(height: 20),
              _row(true),
            ],
          ),
        ),
      ),
    );
  }

  Row _row(bool baseline) {
    return Row(
      crossAxisAlignment:
          baseline ? CrossAxisAlignment.baseline : CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: const [
        //
        SizedBox(height: 10),
        AnterosBox.g(
          child: AnterosTextOneLine("Hello", style: TextStyle(fontSize: 28)),
        ),
        AnterosBox.y(
          width: 45,
          child: AnterosFitHorizontally(
            alignment: Alignment.centerLeft,
            child: AnterosTextOneLine("Hello", style: TextStyle(fontSize: 28)),
          ),
        ),
        AnterosBox.g(
          child: AnterosTextOneLine("Hello", style: TextStyle(fontSize: 60)),
        ),
        AnterosBox.y(
          width: 56,
          child: AnterosFitHorizontally(
            alignment: Alignment.centerLeft,
            child: AnterosTextOneLine("Hello", style: TextStyle(fontSize: 60)),
          ),
        ),
      ],
    );
  }
}
