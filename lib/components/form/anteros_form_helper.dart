import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class AnterosFormHelper {
  AnterosFormHelper._();

  static InputDecoration getAnterosDecorationPattern(bool? hasError, VoidCallback? onClearValue, ThemeData theme, String? labelText, String? hintText, AnterosFormFieldState state) {
    var _suffixIcon = null;
    if (hasError != null) {
      var _icon = hasError
          ? const Icon(Icons.error,
              color: Color.fromARGB(255, 224, 43, 79), size: 18)
          : const Icon(Icons.check, color: Colors.green, size: 18);
      var children = <Widget>[];
      if (onClearValue != null) {
        children.add(new SizedBox(
            height: 22.0,
            width: 22.0,
            child: IconButton(
                padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                icon: Icon(
                  Icons.clear,
                  size: 18,
                ),
                onPressed: onClearValue)));
      }
      children.add(new SizedBox(
          height: 22.0,
          width: 22.0,
          child: IconButton(
              padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
              icon: _icon,
              onPressed: () => {})));
      children.add(new SizedBox(
        height: 22.0,
        width: 4.0,
      ));
    
      _suffixIcon = Row(
        mainAxisAlignment: MainAxisAlignment.start, // added line
        mainAxisSize: MainAxisSize.min, // added line
        children: children,
      );
    } else {
      _suffixIcon = Row(
        mainAxisAlignment: MainAxisAlignment.start, // added line
        mainAxisSize: MainAxisSize.min, // added line
        children: <Widget>[
          new SizedBox(
              height: 22.0,
              width: 22.0,
              child: IconButton(
                  padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                  ),
                  onPressed: onClearValue)),
          new SizedBox(
            height: 22.0,
            width: 4.0,
          )
        ],
      );
    }
    
    var inputDecoration = InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x4437474F),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x4437474F),
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
        errorText: state.errorText,
        suffixIcon: _suffixIcon);
    return inputDecoration;
  }
}