import 'package:flutter/material.dart';

AnterosDialog FixTextFieldDialog() {
  return AnterosDialog().build()
    ..width = 120
    ..height = 110
    ..backgroundColor = Colors.white
    ..borderRadius = 10.0
    ..gravity = Gravity.bottom
    ..widget(
      Padding(
        padding: EdgeInsets.all(24),
        child: TextField(),
      ),
    )
    ..show();
}
