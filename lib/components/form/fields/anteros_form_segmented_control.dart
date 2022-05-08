import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anterosflutter/anterosflutter.dart';

/// Field for selection of a value from the `CupertinoSegmentedControl`
class AnterosFormSegmentedControl<T extends Object>
    extends AnterosFormField<T> {
  /// The color used to fill the backgrounds of unselected widgets and as the
  /// text color of the selected widget.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryContrastingColor` if null.
  final Color? unselectedColor;

  /// The color used to fill the background of the selected widget and as the text
  /// color of unselected widgets.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color? selectedColor;

  /// The color used as the border around each widget.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color? borderColor;

  /// The color used to fill the background of the widget the user is
  /// temporarily interacting with through a long press or drag.
  ///
  /// Defaults to the selectedColor at 20% opacity if null.
  final Color? pressedColor;

  /// The CupertinoSegmentedControl will be placed inside this padding
  ///
  /// Defaults to EdgeInsets.symmetric(horizontal: 16.0)
  final EdgeInsetsGeometry? padding;

  /// The list of options the user can select.
  final List<AnterosFormFieldOption<T>> options;

  final bool shouldRequestFocus;

  /// Creates field for selection of a value from the `CupertinoSegmentedControl`
  AnterosFormSegmentedControl({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<T>? validator,
    T? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    ValueTransformer<T?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<T>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    VoidCallback? onReset,
    FocusNode? focusNode,
    VoidCallback? onClearValue,
    String? labelText,
    String? helperText,
    String? hintText,
    bool? hasError,
    required BuildContext context,
    required this.options,
    this.borderColor,
    this.selectedColor,
    this.pressedColor,
    this.padding,
    this.unselectedColor,
    this.shouldRequestFocus = false,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<T?> field) {
            final state = field as _FormBuilderSegmentedControlState<T>;
            final theme = Theme.of(state.context);

            var _suffixIcon = null;
            if (hasError != null) {
              var _icon = hasError
                  ? const Icon(Icons.error,
                      color: Color.fromARGB(255, 224, 43, 79), size: 18)
                  : const Icon(Icons.check, color: Colors.green, size: 18);
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
                      width: 22.0,
                      child: IconButton(
                          padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                          icon: _icon,
                          onPressed: () => {})),
                  new SizedBox(
                    height: 22.0,
                    width: 4.0,
                  )
                ],
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
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                fillColor: Theme.of(context).cardColor,
                filled: true,
                labelText: labelText,
                hintText: hintText,
                errorMaxLines: 2,
                errorText: state.errorText,
                suffixIcon: _suffixIcon);
            if (identical(decoration, const InputDecoration())) {
              return InputDecorator(
                decoration: inputDecoration,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CupertinoSegmentedControl<T>(
                    borderColor: state.enabled
                        ? borderColor ?? theme.primaryColor
                        : theme.disabledColor,
                    selectedColor: state.enabled
                        ? selectedColor ?? theme.primaryColor
                        : theme.disabledColor,
                    pressedColor: state.enabled
                        ? pressedColor ?? theme.primaryColor
                        : theme.disabledColor,
                    groupValue: state.value,
                    children: <T, Widget>{
                      for (final option in options)
                        option.value: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: option,
                        ),
                    },
                    padding: padding,
                    unselectedColor: unselectedColor,
                    onValueChanged: (value) {
                      if (shouldRequestFocus) {
                        state.requestFocus();
                      }
                      if (state.enabled) {
                        field.didChange(value);
                      } else {
                        field.reset();
                      }
                    },
                  ),
                ),
              );
            }
            return InputDecorator(
              decoration: state.decoration,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CupertinoSegmentedControl<T>(
                  borderColor: state.enabled
                      ? borderColor ?? theme.primaryColor
                      : theme.disabledColor,
                  selectedColor: state.enabled
                      ? selectedColor ?? theme.primaryColor
                      : theme.disabledColor,
                  pressedColor: state.enabled
                      ? pressedColor ?? theme.primaryColor
                      : theme.disabledColor,
                  groupValue: state.value,
                  children: <T, Widget>{
                    for (final option in options)
                      option.value: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: option,
                      ),
                  },
                  padding: padding,
                  unselectedColor: unselectedColor,
                  onValueChanged: (value) {
                    if (shouldRequestFocus) {
                      state.requestFocus();
                    }
                    if (state.enabled) {
                      field.didChange(value);
                    } else {
                      field.reset();
                    }
                  },
                ),
              ),
            );
          },
        );

  @override
  _FormBuilderSegmentedControlState<T> createState() =>
      _FormBuilderSegmentedControlState();
}

class _FormBuilderSegmentedControlState<T extends Object>
    extends AnterosFormFieldState<AnterosFormSegmentedControl<T>, T> {}
