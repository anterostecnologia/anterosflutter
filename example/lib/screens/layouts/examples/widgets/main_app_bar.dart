import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'items/layout_type.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    required LayoutType layoutType,
    required PreferredSize bottom,
  }) : super(
          title: Text(layoutNames[layoutType]!),
          centerTitle: true,
          backgroundColor: AnterosColors.DARK,
          bottom: bottom,
        );
}
