import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

AnterosDialog ProgressDialogNoBody() {
  return AnterosDialog().build()
    ..width = 200
    ..borderRadius = 4.0
    ..circularProgress(
      padding: EdgeInsets.all(24.0),
      valueColor: Colors.orange[500],
    )
    ..show();
}

AnterosDialog ProgressDialogBody() {
  return AnterosDialog().build()
    ..width = 200
    ..borderRadius = 4.0
    ..circularProgress(
      padding: EdgeInsets.all(24.0),
      valueColor: Colors.orange[500],
    )
    ..text(
      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 12.0),
      text: "Carregando...",
      alignment: Alignment.center,
      color: Colors.orange[500],
      fontSize: 18.0,
    )
    ..show();
}
