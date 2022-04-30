import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class Toasts extends StatefulWidget {
  @override
  _ToastsState createState() => _ToastsState();
}

class _ToastsState extends State<Toasts> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: AnterosColors.SUCCESS,
              ),
            )),
        title: const Text(
          'Toasts',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () => AnterosToast.showToast(
                    'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                    context,
                  ),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Show Toast',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
          GestureDetector(
              onTap: () => AnterosToast.showToast(
                    'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                    context,
                    textStyle: TextStyle(fontSize: 16, color: Colors.black54),
                    backgroundColor: Colors.white,
                  ),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Show Toast with background color',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
          GestureDetector(
              onTap: () => AnterosToast.showToast(
                    'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                    context,
                    toastPosition: AnterosToastPosition.BOTTOM,
                  ),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Show Toast with toast position',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
          GestureDetector(
              onTap: () => AnterosToast.showToast(
                  'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                  context,
                  textStyle: TextStyle(fontSize: 16, color: Colors.black54),
                  backgroundColor: AnterosColors.LIGHT,
                  toastBorderRadius: 5.0,
                  border: Border.all(color: AnterosColors.SUCCESS),
                  toastDuration: 5,
                  toastPosition: AnterosToastPosition.BOTTOM),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Show Toast with rounded border',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
          GestureDetector(
              onTap: () => AnterosToast.showToast(
                  'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                  context,
                  toastPosition: AnterosToastPosition.BOTTOM,
                  textStyle: TextStyle(fontSize: 16, color: AnterosColors.DARK),
                  backgroundColor: AnterosColors.LIGHT,
                  trailing: Icon(
                    Icons.notifications,
                    color: AnterosColors.SUCCESS,
                  )),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: AnterosColors.DARK,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.40), blurRadius: 5)
                    ]),
                child: AnterosListTile(
                    color: AnterosColors.DARK,
                    title: const Text(
                      'Show Toast with trailing',
                      style: TextStyle(color: AnterosColors.WHITE),
                    ),
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: AnterosColors.SUCCESS,
                    )),
              )),
        ],
      ));
}
