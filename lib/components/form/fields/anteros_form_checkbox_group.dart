import 'package:flutter/material.dart';

import 'package:anterosflutter/anterosflutter.dart';

/// A list of Checkboxes for selecting multiple options
class AnterosFormCheckboxGroup<T> extends AnterosFormField<List<T>> {
  final List<AnterosFormFieldOption<T>> options;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool tristate;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final ControlAffinity controlAffinity;
  final OptionsOrientation orientation;
  final bool shouldRequestFocus;

  /// Creates a list of Checkboxes for selecting multiple options
  AnterosFormCheckboxGroup({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<List<T>>? validator,
    List<T>? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<List<T>?>? onChanged,
    ValueTransformer<List<T>?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<List<T>>? onSaved,
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
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.disabled,
    this.materialTapTargetSize,
    this.tristate = false,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = ControlAffinity.leading,
    this.orientation = OptionsOrientation.wrap,
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
          builder: (FormFieldState<List<T>?> field) {
            final state = field as _FormBuilderCheckboxGroupState<T>;

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
                child: GroupedCheckbox<T>(
                  orientation: orientation,
                  value: state.value,
                  options: options,
                  onChanged: (val) {
                    if (shouldRequestFocus) {
                      state.requestFocus();
                    }
                    field.didChange(val);
                  },
                  disabled: state.enabled
                      ? disabled
                      : options.map((e) => e.value).toList(),
                  activeColor: activeColor,
                  focusColor: focusColor,
                  checkColor: checkColor,
                  materialTapTargetSize: materialTapTargetSize,
                  hoverColor: hoverColor,
                  tristate: tristate,
                  wrapAlignment: wrapAlignment,
                  wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                  wrapDirection: wrapDirection,
                  wrapRunAlignment: wrapRunAlignment,
                  wrapRunSpacing: wrapRunSpacing,
                  wrapSpacing: wrapSpacing,
                  wrapTextDirection: wrapTextDirection,
                  wrapVerticalDirection: wrapVerticalDirection,
                  separator: separator,
                  controlAffinity: controlAffinity,
                ),
              );
            }
            return InputDecorator(
              decoration: state.decoration,
              child: GroupedCheckbox<T>(
                orientation: orientation,
                value: state.value,
                options: options,
                onChanged: (val) {
                  if (shouldRequestFocus) {
                    state.requestFocus();
                  }
                  field.didChange(val);
                },
                disabled: state.enabled
                    ? disabled
                    : options.map((e) => e.value).toList(),
                activeColor: activeColor,
                focusColor: focusColor,
                checkColor: checkColor,
                materialTapTargetSize: materialTapTargetSize,
                hoverColor: hoverColor,
                tristate: tristate,
                wrapAlignment: wrapAlignment,
                wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                wrapDirection: wrapDirection,
                wrapRunAlignment: wrapRunAlignment,
                wrapRunSpacing: wrapRunSpacing,
                wrapSpacing: wrapSpacing,
                wrapTextDirection: wrapTextDirection,
                wrapVerticalDirection: wrapVerticalDirection,
                separator: separator,
                controlAffinity: controlAffinity,
              ),
            );
          },
        );

  @override
  _FormBuilderCheckboxGroupState<T> createState() =>
      _FormBuilderCheckboxGroupState<T>();
}

class _FormBuilderCheckboxGroupState<T>
    extends AnterosFormFieldState<AnterosFormCheckboxGroup<T>, List<T>> {}
