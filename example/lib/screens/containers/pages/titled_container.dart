import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitledContainerPage extends StatefulWidget {
  @override
  _TitledContainerPageState createState() => _TitledContainerPageState();
}

class _TitledContainerPageState extends State<TitledContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Titled container',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnterosTitledContainer(
          titleColor: Colors.blue,
          title: 'Center Title',
          textAlign: AnterosTextAlignTitledContainer.Left,
          fontSize: 14.0,
          backgroundColor: Colors.white,
          child: Container(
            width: 250.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Text(
                'Center Align text',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
