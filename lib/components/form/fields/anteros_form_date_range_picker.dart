import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

import 'package:anterosflutter/anterosflutter.dart';

/// Field for selecting a range of dates
class AnterosFormDateRangePicker extends AnterosFormField<DateTimeRange> {
  //TODO: Add documentation
  final int maxLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? style;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool autocorrect;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final ValueChanged<DateTimeRange?>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final bool expands;
  final int? minLines;
  final bool showCursor;
  final DateTime firstDate;
  final DateTime lastDate;
  final Locale? locale;
  final intl.DateFormat? format;
  final String? cancelText; // widget.cancelText,
  final String? confirmText; // widget.confirmText,
  final DateTime? currentDate; // widget.currentDate,
  final String? errorFormatText; // widget.erroerrorFormatText,
  final Widget Function(BuildContext, Widget?)?
      pickerBuilder; // widget.builder,
  final String? errorInvalidRangeText; // widget.errorInvalidRangeText,
  final String? errorInvalidText; // widget.errorInvalidText,
  final String? fieldEndHintText; // widget.fieldEndHintText,
  final String? fieldEndLabelText; // widget.fieldEndLabelText,
  final String? fieldStartHintText; // widget.fieldStartHintText,
  final String? fieldStartLabelText; // widget.fieldStartLabelText,
  final String? helpText; // widget.helpText,
  // final DateTimeRange initialDateRange; // widget.initialDateRange,
  final DatePickerEntryMode initialEntryMode; // widget.initialEntryMode,
  final RouteSettings? routeSettings; // widget.routeSettings,
  final String? saveText; // widget.saveText,
  final bool useRootNavigator; // widget.useRootNavigator,

  /// Creates field for selecting a range of dates
  AnterosFormDateRangePicker({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<DateTimeRange>? validator,
    DateTimeRange? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<DateTimeRange?>? onChanged,
    ValueTransformer<DateTimeRange?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<DateTimeRange>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    VoidCallback? onReset,
    FocusNode? focusNode,
    VoidCallback? onClearValue,
    String? labelText,
    String? helperText,
    String? hintText,
    bool? hasError,
    required BuildContext context,
    required this.firstDate,
    required this.lastDate,
    this.format,
    this.maxLines = 1,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.maxLengthEnforcement,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.autocorrect = true,
    this.cursorWidth = 2.0,
    this.keyboardType,
    this.style,
    this.controller,
    this.textInputAction,
    this.strutStyle,
    this.textDirection,
    this.maxLength,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.expands = false,
    this.minLines,
    this.showCursor = false,
    this.locale,
    this.cancelText,
    this.confirmText,
    this.currentDate,
    this.errorFormatText,
    this.pickerBuilder,
    this.errorInvalidRangeText,
    this.errorInvalidText,
    this.fieldEndHintText,
    this.fieldEndLabelText,
    this.fieldStartHintText,
    this.fieldStartLabelText,
    this.helpText,
    // this.initialDateRange,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.routeSettings,
    this.saveText,
    this.useRootNavigator = true,
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
          builder: (FormFieldState<DateTimeRange?> field) {
            final state = field as FormBuilderDateRangePickerState;

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
                          icon: Icon(Icons.clear, size: 18,),
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
                errorMaxLines: 2,
                errorText: state.errorText,
                suffixIcon: _suffixIcon);
            if (identical(decoration, const InputDecoration())) {
              return TextField(
                enabled: state.enabled,
                style: style,
                focusNode: state.effectiveFocusNode,
                decoration: inputDecoration,
                maxLines: maxLines,
                keyboardType: keyboardType,
                obscureText: obscureText,
                onEditingComplete: onEditingComplete,
                controller: state._effectiveController,
                autocorrect: autocorrect,
                autofocus: autofocus,
                buildCounter: buildCounter,
                cursorColor: cursorColor,
                cursorRadius: cursorRadius,
                cursorWidth: cursorWidth,
                enableInteractiveSelection: enableInteractiveSelection,
                maxLength: maxLength,
                inputFormatters: inputFormatters,
                keyboardAppearance: keyboardAppearance,
                maxLengthEnforcement: maxLengthEnforcement,
                scrollPadding: scrollPadding,
                textAlign: textAlign,
                textCapitalization: textCapitalization,
                textDirection: textDirection,
                textInputAction: textInputAction,
                strutStyle: strutStyle,
                readOnly: true,
                expands: expands,
                minLines: minLines,
                showCursor: showCursor,
              );
            }

            return TextField(
              enabled: state.enabled,
              style: style,
              focusNode: state.effectiveFocusNode,
              decoration: state.decoration,
              maxLines: maxLines,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onEditingComplete: onEditingComplete,
              controller: state._effectiveController,
              autocorrect: autocorrect,
              autofocus: autofocus,
              buildCounter: buildCounter,
              cursorColor: cursorColor,
              cursorRadius: cursorRadius,
              cursorWidth: cursorWidth,
              enableInteractiveSelection: enableInteractiveSelection,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              keyboardAppearance: keyboardAppearance,
              maxLengthEnforcement: maxLengthEnforcement,
              scrollPadding: scrollPadding,
              textAlign: textAlign,
              textCapitalization: textCapitalization,
              textDirection: textDirection,
              textInputAction: textInputAction,
              strutStyle: strutStyle,
              readOnly: true,
              expands: expands,
              minLines: minLines,
              showCursor: showCursor,
            );
          },
        );

  @override
  FormBuilderDateRangePickerState createState() =>
      FormBuilderDateRangePickerState();

  static String tryFormat(DateTime date, intl.DateFormat format) {
    try {
      return format.format(date);
    } catch (e) {
      // Ignore exception
    }
    return '';
  }
}

class FormBuilderDateRangePickerState
    extends AnterosFormFieldState<AnterosFormDateRangePicker, DateTimeRange> {
  late TextEditingController _effectiveController;

  @override
  void initState() {
    super.initState();
    _effectiveController =
        widget.controller ?? TextEditingController(text: _valueToText());
    effectiveFocusNode.addListener(_handleFocus);
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_handleFocus);
    // Dispose the _effectiveController when initState created it
    if (null == widget.controller) {
      _effectiveController.dispose();
    }
    super.dispose();
  }

  Future<void> _handleFocus() async {
    if (effectiveFocusNode.hasFocus && enabled) {
      effectiveFocusNode.unfocus();
      final picked = await showDateRangePicker(
        context: context,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
        locale: widget.locale,
        textDirection: widget.textDirection,
        cancelText: widget.cancelText,
        confirmText: widget.confirmText,
        currentDate: widget.currentDate,
        errorFormatText: widget.errorFormatText,
        builder: widget.pickerBuilder,
        errorInvalidRangeText: widget.errorInvalidRangeText,
        errorInvalidText: widget.errorInvalidText,
        fieldEndHintText: widget.fieldEndHintText,
        fieldEndLabelText: widget.fieldEndLabelText,
        fieldStartHintText: widget.fieldStartHintText,
        fieldStartLabelText: widget.fieldStartLabelText,
        helpText: widget.helpText,
        initialDateRange: value,
        initialEntryMode: widget.initialEntryMode,
        routeSettings: widget.routeSettings,
        saveText: widget.saveText,
        useRootNavigator: widget.useRootNavigator,
      );
      if (picked != null) {
        didChange(picked);
      }
    }
  }

  String _valueToText() {
    if (value == null) {
      return '';
    }

    return '${format(value!.start)} - ${format(value!.end)}';
  }

  String format(DateTime date) => AnterosFormDateRangePicker.tryFormat(
      date, widget.format ?? intl.DateFormat.yMd());

  void _setTextFieldString() {
    setState(() => _effectiveController.text = _valueToText());
  }

  @override
  void didChange(DateTimeRange? value) {
    super.didChange(value);
    _setTextFieldString();
  }

  @override
  void reset() {
    super.reset();
    _setTextFieldString();
  }
}
