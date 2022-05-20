import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasyContainerPage extends StatelessWidget {
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
          ),
        ),
        title: const Text(
          'Easy container',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnterosEasyContainer(
          height: 300,
          width: 300,
          child: const CircularProgressIndicator.adaptive(),
          padding: 20,
          elevation: 10,
          onTap: () => debugPrint("Container Tapped"),
          margin: 20,
          borderRadius: 20,
          color: Colors.red,
        ),
      ),
    );
  }
}
