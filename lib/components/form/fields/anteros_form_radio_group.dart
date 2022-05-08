import 'package:flutter/material.dart';

import 'package:anterosflutter/anterosflutter.dart';

/// Field to select one value from a list of Radio Widgets
class AnterosFormRadioGroup<T> extends AnterosFormField<T> {
  final Axis wrapDirection;
  final bool shouldRadioRequestFocus;
  final Color? activeColor;
  final Color? focusColor;
  final Color? hoverColor;
  final ControlAffinity controlAffinity;
  final double wrapRunSpacing;
  final double wrapSpacing;
  final List<AnterosFormFieldOption<T>> options;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final OptionsOrientation orientation;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final WrapAlignment wrapAlignment;
  final WrapAlignment wrapRunAlignment;
  final WrapCrossAlignment wrapCrossAxisAlignment;

  /// Creates field to select one value from a list of Radio Widgets
  AnterosFormRadioGroup({
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool enabled = true,
    FocusNode? focusNode,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    InputDecoration decoration = const InputDecoration(),
    Key? key,
    VoidCallback? onClearValue,
    String? labelText,
    String? helperText,
    String? hintText,
    bool? hasError,
    required BuildContext context,
    required String name, //From Super
    required this.options,
    T? initialValue,
    this.shouldRadioRequestFocus = false,
    this.activeColor,
    this.controlAffinity = ControlAffinity.leading,
    this.disabled,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.orientation = OptionsOrientation.wrap,
    this.separator,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapDirection = Axis.horizontal,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapSpacing = 0.0,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    ValueChanged<T?>? onChanged,
    ValueTransformer<T?>? valueTransformer,
    VoidCallback? onReset,
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
          focusNode: focusNode,
          decoration: decoration,
          builder: (FormFieldState<T?> field) {
            final state = field as _FormBuilderRadioGroupState<T>;

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
                child: GroupedRadio<T>(
                  activeColor: activeColor,
                  controlAffinity: controlAffinity,
                  disabled: state.enabled
                      ? disabled
                      : options.map((option) => option.value).toList(),
                  focusColor: focusColor,
                  hoverColor: hoverColor,
                  materialTapTargetSize: materialTapTargetSize,
                  onChanged: (value) {
                    if (shouldRadioRequestFocus) {
                      state.requestFocus();
                    }
                    state.didChange(value);
                  },
                  options: options,
                  orientation: orientation,
                  separator: separator,
                  value: state.value,
                  wrapAlignment: wrapAlignment,
                  wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                  wrapDirection: wrapDirection,
                  wrapRunAlignment: wrapRunAlignment,
                  wrapRunSpacing: wrapRunSpacing,
                  wrapSpacing: wrapSpacing,
                  wrapTextDirection: wrapTextDirection,
                  wrapVerticalDirection: wrapVerticalDirection,
                ),
              );
            }
            return InputDecorator(
              decoration: state.decoration,
              child: GroupedRadio<T>(
                activeColor: activeColor,
                controlAffinity: controlAffinity,
                disabled: state.enabled
                    ? disabled
                    : options.map((option) => option.value).toList(),
                focusColor: focusColor,
                hoverColor: hoverColor,
                materialTapTargetSize: materialTapTargetSize,
                onChanged: (value) {
                  if (shouldRadioRequestFocus) {
                    state.requestFocus();
                  }
                  state.didChange(value);
                },
                options: options,
                orientation: orientation,
                separator: separator,
                value: state.value,
                wrapAlignment: wrapAlignment,
                wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                wrapDirection: wrapDirection,
                wrapRunAlignment: wrapRunAlignment,
                wrapRunSpacing: wrapRunSpacing,
                wrapSpacing: wrapSpacing,
                wrapTextDirection: wrapTextDirection,
                wrapVerticalDirection: wrapVerticalDirection,
              ),
            );
          },
        );

  @override
  _FormBuilderRadioGroupState<T> createState() =>
      _FormBuilderRadioGroupState<T>();
}

class _FormBuilderRadioGroupState<T>
    extends AnterosFormFieldState<AnterosFormRadioGroup<T>, T> {}
