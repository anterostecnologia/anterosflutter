import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

AnterosDialog BottomSheetDialog() {
  return AnterosDialog().build()
    ..gravity = AnterosDialogGravity.bottom
    ..gravityAnimationEnable = true
    ..backgroundColor = Colors.transparent
    ..widget(Container(
      width: 300,
      height: 45,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text("Block"),
      ),
    ))
    ..widget(Container(
      width: 300,
      height: 45,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "cancel",
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
    ))
    ..show();
}
