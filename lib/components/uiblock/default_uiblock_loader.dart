import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnterosUIBlockDefaultLoader extends StatelessWidget {
  const AnterosUIBlockDefaultLoader({
    this.key,
    this.backgroundColor = Colors.transparent,
    this.valueColor = const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
  }) : super(key: key);
  final Key? key;
  final Color backgroundColor;
  final Animation<Color> valueColor;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: backgroundColor,
      key: key,
      valueColor: valueColor,
    );
  }
}
