import 'package:flutter/material.dart';

class AnterosBuilderHelper {
  AnterosBuilderHelper._();
  static InputDecoration buildInputDecorationAnterosPattern(
      ThemeData theme, String? labelText, String? hintText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.cardColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.cardColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.primaryColor,
        ),
      ),
      fillColor: theme.cardColor,
      filled: true,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 2,
    );
  }
}
