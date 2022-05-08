import 'package:flutter/material.dart';

import 'package:anterosflutter/anterosflutter.dart';

enum OptionsOrientation { horizontal, vertical, wrap }
enum ControlAffinity { leading, trailing }

typedef ValueTransformer<T> = dynamic Function(T value);

/// A single form field.
///
/// This widget maintains the current state of the form field, so that updates
/// and validation errors are visually reflected in the UI.
class AnterosFormField<T> extends FormField<T> {
  /// Used to reference the field within the form, or to reference form data
  /// after the form is submitted.
  final String name;

  /// Called just before field value is saved. Used to massage data just before
  /// committing the value.
  ///
  /// This sample shows how to convert age in a [AnterosFormTextField] to number
  /// so that the final value is numeric instead of a String
  ///
  /// ```dart
  ///   FormBuilderTextField(
  ///     name: 'age',
  ///     decoration: InputDecoration(labelText: 'Age'),
  ///     valueTransformer: (text) => num.tryParse(text),
  ///     validator: FormBuilderValidators.numeric(context),
  ///     initialValue: '18',
  ///     keyboardType: TextInputType.number,
  ///  ),
  /// ```
  final ValueTransformer<T?>? valueTransformer;

  /// Called when the field value is changed.
  final ValueChanged<T?>? onChanged;

  /// The border, labels, icons, and styles used to decorate the field.
  final InputDecoration decoration;

  /// Called when the field value is reset.
  final VoidCallback? onReset;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  //TODO: implement bool autofocus, ValueChanged<bool> onValidated

  /// Creates a single form field.
  const AnterosFormField({
    Key? key,
    //From Super
    FormFieldSetter<T>? onSaved,
    T? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    required FormFieldBuilder<T> builder,
    required this.name,
    this.valueTransformer,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.onReset,
    this.focusNode,
  }) : super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          builder: builder,
          validator: validator,
        );

  @override
  AnterosFormFieldState<AnterosFormField<T>, T> createState() =>
      AnterosFormFieldState<AnterosFormField<T>, T>();
}

class AnterosFormFieldState<F extends AnterosFormField<T>, T>
    extends FormFieldState<T> {
  String? _customErrorText;

  @override
  F get widget => super.widget as F;

  AnterosFormState? get formState => _formBuilderState;

  /// Returns the initial value, which may be declared at the field, or by the
  /// parent [FormBuilder.initialValue]. When declared at both levels, the field
  /// initialValue prevails.
  T? get initialValue =>
      widget.initialValue ??
      (_formBuilderState?.initialValue ??
          const <String, dynamic>{})[widget.name] as T?;

  AnterosFormState? _formBuilderState;

  dynamic get transformedValue => widget.valueTransformer?.call(value) ?? value;

  void registerTransformer(Map<String, Function> _map) {
    final _fun = widget.valueTransformer;
    if (_fun != null) {
      _map[widget.name] = _fun;
    }
  }

  @override
  String? get errorText => super.errorText ?? _customErrorText;

  @override
  bool get hasError =>
      super.hasError || decoration.errorText != null || errorText != null;

  @override
  bool get isValid =>
      super.isValid && decoration.errorText == null && errorText == null;

  bool _touched = false;

  bool get enabled => widget.enabled && (_formBuilderState?.enabled ?? true);

  late FocusNode effectiveFocusNode;

  @override
  void initState() {
    super.initState();
    // Register this field when there is a parent FormBuilder
    _formBuilderState = AnterosForm.of(context);
    // Set the initial value
    _formBuilderState?.registerField(widget.name, this);

    effectiveFocusNode = widget.focusNode ?? FocusNode(debugLabel: widget.name);
    // Register a touch handler
    effectiveFocusNode.addListener(_touchedHandler);
  }

  @override
  void didUpdateWidget(covariant AnterosFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      effectiveFocusNode.removeListener(_touchedHandler);
      effectiveFocusNode = widget.focusNode ?? FocusNode();
      effectiveFocusNode.addListener(_touchedHandler);
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_touchedHandler);
    // Checking if the focusNode is handled by the parent or not
    if (widget.focusNode == null) {
      effectiveFocusNode.dispose();
    }
    _formBuilderState?.unregisterField(widget.name, this);
    super.dispose();
  }

  // @override
  // void save() {
  //   _informFormForFieldChange(
  //     isSetState: true,
  //   );
  //   super.save();
  // }

  void _informFormForFieldChange({
    required bool isSetState,
  }) {
    if (_formBuilderState != null) {
      if (enabled || !_formBuilderState!.widget.skipDisabled) {
        _formBuilderState!.setInternalFieldValue<T>(
          widget.name,
          value,
          isSetState: isSetState,
        );
      } else {
        _formBuilderState!.removeInternalFieldValue(
          widget.name,
          isSetState: isSetState,
        );
      }
    }
  }

  void _touchedHandler() {
    if (effectiveFocusNode.hasFocus && _touched == false) {
      setState(() => _touched = true);
    }
  }

  @override
  void setValue(T? value, {bool populateForm = true}) {
    super.setValue(value);
    if (populateForm) {
      _informFormForFieldChange(
        isSetState: false,
      );
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    _informFormForFieldChange(
      isSetState: false,
    );
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    setValue(initialValue);
    widget.onReset?.call();
  }

  @override
  bool validate({bool clearCustomError = true}) {
    if (clearCustomError) {
      setState(() => _customErrorText = null);
    }
    return super.validate() && !hasError;
  }

  

  void requestFocus() {
    FocusScope.of(context).requestFocus(effectiveFocusNode);
    Scrollable.ensureVisible(context);
  }

  void invalidate(String errorText) {
    setState(() => _customErrorText = errorText);
    validate(clearCustomError: false);
    requestFocus();
  }

  InputDecoration get decoration => widget.decoration.copyWith(
        errorText: widget.decoration.errorText ?? errorText,
      );
}
