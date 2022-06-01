import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FitHorizontallyPage()));

class FitHorizontallyPage extends StatelessWidget {
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
          'FitHorizontally Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              const AnterosBox(height: 10),
              const Text("Simple text:"),
              const AnterosBox(height: 10),
              //
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: double.infinity,
                height: 30,
                child: text(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: 250,
                height: 30,
                child: text(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: 150,
                height: 30,
                child: text(),
              ),
              //
              const AnterosBox(height: 30),
              const Text("Text wrapped with FitHorizontally:"),
              const AnterosBox(height: 10),
              //
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: double.infinity,
                height: 30,
                child: AnterosFitHorizontally(child: text()),
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: 250,
                height: 30,
                child: AnterosFitHorizontally(child: text()),
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.yellow,
                width: 150,
                height: 30,
                child: AnterosFitHorizontally(child: text()),
              ),
              const AnterosBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Container separator() =>
      Container(width: 2, height: 50, color: Colors.black26);

  Text text() => const Text(
        "So long, farewell, auf Wiedersehen.",
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 20, color: Colors.blue),
        maxLines: 1,
        softWrap: false,
      );
}
