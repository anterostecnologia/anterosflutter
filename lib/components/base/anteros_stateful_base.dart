import 'package:anterosflutter/mixin/anteros_after_layout.dart';
import 'package:flutter/material.dart';

abstract class AnterosBaseStateful extends StatefulWidget {
  AnterosBaseStateful({Key? key}) : super(key: key);
}

abstract class AnterosBaseState<T extends AnterosBaseStateful> extends State<T>
    with AnterosAfterLayoutMixin {}
