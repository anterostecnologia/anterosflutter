import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalizedOverflowBoxPage extends StatelessWidget {
  static const text =
      Text("If you set your goals ridiculously high and it's a failure, "
          "you will fail above everyone else's success.");

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
          'NormalizedOverflowBox Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnterosBox(
          width: 300,
          child: Column(
            children: const [
              SizedBox(height: 10),
              AnterosBox(
                color: Colors.green,
                height: 105,
                width: 110,
                child: AnterosNormalizedOverflowBox(minWidth: 50, child: text),
              ),
              AnterosBox(height: 10),
              AnterosBox(
                color: Colors.blue,
                height: 105,
                width: 110,
                child: OverflowBox(minWidth: 100, child: text),
              ),
              AnterosBox(height: 10),
              AnterosBox(
                color: Colors.red,
                height: 105,
                width: 110,
                child: AnterosNormalizedOverflowBox(minWidth: 130, child: text),
              ),
              AnterosBox(height: 10),
              AnterosBox(
                color: Colors.purple,
                height: 105,
                width: 110,
                child: AnterosNormalizedOverflowBox(minWidth: 200, child: text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
