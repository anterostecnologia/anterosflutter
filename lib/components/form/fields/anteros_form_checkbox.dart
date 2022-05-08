import 'package:flutter/material.dart';

import 'package:anterosflutter/anterosflutter.dart';

/// Single Checkbox field
class AnterosFormCheckbox extends AnterosFormField<bool> {
  /// The primary content of the CheckboxListTile.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the checkbox.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// The color to use when this checkbox is checked.
  ///
  /// Defaults to accent color of the current [Theme].
  final Color? activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  ///
  /// Defaults to Color(0xFFFFFFFF).
  final Color? checkColor;

  /// Where to place the control relative to its label.
  final ListTileControlAffinity controlAffinity;

  /// Defines insets surrounding the tile's contents.
  ///
  /// This value will surround the [Checkbox], [title], [subtitle], and [secondary]
  /// widgets in [CheckboxListTile].
  ///
  /// When the value is null, the `contentPadding` is `EdgeInsets.symmetric(horizontal: 16.0)`.
  final EdgeInsets contentPadding;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  final bool shouldRequestFocus;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// Checkbox displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
  /// callback will be applied to true if the current value is false, to null if
  /// value is true, and to false if value is null (i.e. it cycles through false
  /// => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [value] state. To have the list tile appear selected when the checkbox is
  /// checked, pass the same value to both.
  ///
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// Creates a single Checkbox field
  AnterosFormCheckbox({
    //From Super
    Key? key,
    required String name,
    FormFieldValidator<bool>? validator,
    bool? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<bool?>? onChanged,
    ValueTransformer<bool?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<bool?>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    VoidCallback? onReset,
    VoidCallback? onClearValue,
    FocusNode? focusNode,
    required BuildContext context,
    String? labelText,
    String? hintText,
    bool? hasError,
    required this.title,
    this.activeColor,
    this.autofocus = false,
    this.checkColor,
    this.contentPadding = EdgeInsets.zero,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.secondary,
    this.selected = false,
    this.shouldRequestFocus = false,
    this.subtitle,
    this.tristate = false,
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
          builder: (FormFieldState<bool?> field) {
            final state = field as _FormBuilderCheckboxState;

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
                child: CheckboxListTile(
                  dense: true,
                  isThreeLine: false,
                  title: title,
                  subtitle: subtitle,
                  value: tristate ? state.value : (state.value ?? false),
                  onChanged: state.enabled
                      ? (value) {
                          if (shouldRequestFocus) {
                            state.requestFocus();
                          }
                          state.didChange(value);
                        }
                      : null,
                  checkColor: checkColor,
                  activeColor: activeColor,
                  secondary: secondary,
                  controlAffinity: controlAffinity,
                  autofocus: autofocus,
                  tristate: tristate,
                  contentPadding: contentPadding,
                  selected: selected,
                ),
              );
            }
            return InputDecorator(
              decoration: state.decoration,
              child: CheckboxListTile(
                dense: true,
                isThreeLine: false,
                title: title,
                subtitle: subtitle,
                value: tristate ? state.value : (state.value ?? false),
                onChanged: state.enabled
                    ? (value) {
                        if (shouldRequestFocus) {
                          state.requestFocus();
                        }
                        state.didChange(value);
                      }
                    : null,
                checkColor: checkColor,
                activeColor: activeColor,
                secondary: secondary,
                controlAffinity: controlAffinity,
                autofocus: autofocus,
                tristate: tristate,
                contentPadding: contentPadding,
                selected: selected,
              ),
            );
          },
        );

  @override
  _FormBuilderCheckboxState createState() => _FormBuilderCheckboxState();
}

class _FormBuilderCheckboxState
    extends AnterosFormFieldState<AnterosFormCheckbox, bool> {}
