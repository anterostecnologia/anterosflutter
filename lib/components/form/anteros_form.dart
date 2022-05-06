import 'dart:developer';

import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

/// Um contêiner para campos de formulário.
class AnterosForm extends StatefulWidget {
  /// Chamado quando um dos campos de formulário muda.
  ///
  /// Além deste retorno de chamada sendo invocado, todos os próprios campos de forma
  /// vai reconstruir.
  final VoidCallback? onChanged;

  /// permite que o formulário vete as tentativas do usuário de descartar o [ModalRoute]
  /// que contém o formulário.
  ///
  /// Se o retorno de chamada retornar um future que resolve para false, a rota do formulário
  /// não será estourado.
  ///
  /// Veja também:
  ///
  /// * [WillpopScope], outro widget que fornece uma maneira de interceptar o
  ///    botão "voltar".
  final WillPopCallback? onWillPop;

  /// o widget abaixo deste widget na árvore.
  ///
  /// Esta é a raiz da hierarquia do widget que contém esse formulário.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// usado para ativar/desativar os campos de validação automática e atualizar seu erro
  /// texto.
  ///
  /// {@macro flutter.widgets.form.autovalidateMode}
  final AutovalidateMode? autovalidateMode;

  /// An optional Map of field initialValues. Keys correspond to the field's
  /// name and value to the initialValue of the field.
  ///
  /// The initialValues set here will be ignored if the field has a local
  /// initialValue set.
  final Map<String, dynamic> initialValue;

  /// Whether the form should ignore submitting values from fields where
  /// `enabled` is `false`.
  /// This behavior is common in HTML forms where _readonly_ values are not
  /// submitted when the form is submitted.
  ///
  /// When `true`, the final form value will not contain disabled fields.
  /// Default is `false`.
  final bool skipDisabled;

  /// Whether the form is able to receive user input.
  ///
  /// Defaults to true.
  ///
  /// When `false` all the form fields will be disabled - won't accept input -
  /// and their enabled state will be ignored.
  final bool enabled;

  /// Whether the form should auto focus on the first field that fails validation.
  final bool autoFocusOnValidationFailure;

  /// Creates a container for form fields.
  ///
  /// The [child] argument must not be null.
  const AnterosForm({
    Key? key,
    required this.child,
    this.onChanged,
    this.autovalidateMode,
    this.onWillPop,
    this.initialValue = const <String, dynamic>{},
    this.skipDisabled = false,
    this.enabled = true,
    this.autoFocusOnValidationFailure = false,
  }) : super(key: key);

  static AnterosFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<AnterosFormState>();

  @override
  AnterosFormState createState() => AnterosFormState();
}

class AnterosFormState extends State<AnterosForm> {
  final _formKey = GlobalKey<FormState>();

  bool get enabled => widget.enabled;

  final _fields = <String, AnterosFormFieldState>{};

  //because dart type system will not accept ValueTransformer<dynamic>
  final _transformers = <String, Function>{};
  final _instantValue = <String, dynamic>{};
  final _savedValue = <String, dynamic>{};

  Map<String, dynamic> get instantValue =>
      Map<String, dynamic>.unmodifiable(_instantValue.map((key, value) =>
          MapEntry(key, _transformers[key]?.call(value) ?? value)));

  /// Returns the saved value only
  Map<String, dynamic> get value =>
      Map<String, dynamic>.unmodifiable(_savedValue.map((key, value) =>
          MapEntry(key, _transformers[key]?.call(value) ?? value)));

  /// Returns values after saving
  Map<String, dynamic> get initialValue => widget.initialValue;

  Map<String, AnterosFormFieldState> get fields => _fields;

  dynamic transformValue<T>(String name, T? v) {
    final t = _transformers[name];
    return t != null ? t.call(v) : v;
  }

  dynamic getTransformedValue<T>(String name, {bool fromSaved = false}) {
    return transformValue<T>(name, getRawValue(name));
  }

  T? getRawValue<T>(String name, {bool fromSaved = false}) {
    return (fromSaved ? _savedValue[name] : _instantValue[name]) ??
        initialValue[name];
  }

  void setInternalFieldValue<T>(
    String name,
    T? value, {
    required bool isSetState,
  }) {
    _instantValue[name] = value;
    if (isSetState) {
      setState(() {});
    }
  }

  bool get isValid =>
      fields.values.where((element) => !element.isValid).isEmpty;

  void removeInternalFieldValue(
    String name, {
    required bool isSetState,
  }) {
    _instantValue.remove(name);
    if (isSetState) {
      setState(() {});
    }
  }

  void registerField(String name, AnterosFormFieldState field) {
    // Each field must have a unique name.  Ideally we could simply:
    //   assert(!_fields.containsKey(name));
    // However, Flutter will delay dispose of deactivated fields, so if a
    // field is being replaced, the new instance is registered before the old
    // one is unregistered.  To accommodate that use case, but also provide
    // assistance to accidental duplicate names, we check and emit a warning.
    final oldField = _fields[name];
    assert(() {
      if (oldField != null) {
        debugPrint('Warning! Replacing duplicate Field for $name'
            ' -- this is OK to ignore as long as the field was intentionally replaced');
      }
      return true;
    }());

    _fields[name] = field;
    field.registerTransformer(_transformers);
    if (oldField != null) {
      // ignore: invalid_use_of_protected_member
      field.setValue(
        oldField.value,
        populateForm: false,
      );
    } else {
      // ignore: invalid_use_of_protected_member
      field.setValue(
        _instantValue[name] ??= field.initialValue,
        populateForm: false,
      );
    }
  }

  void unregisterField(String name, AnterosFormFieldState field) {
    assert(_fields.containsKey(name));
    // Only remove the field when it is the one registered.  It's possible that
    // the field is replaced (registerField is called twice for a given name)
    // before unregisterField is called for the name, so just emit a warning
    // since it may be intentional.
    if (field == _fields[name]) {
      _fields.remove(name);
      _transformers.remove(name);
    } else {
      assert(() {
        // This is OK to ignore when you are intentionally replacing a field
        // with another field using the same name.
        debugPrint('Warning! Ignoring Field unregistration for $name'
            ' -- this is OK to ignore as long as the field was intentionally replaced');
        return true;
      }());
    }
    // Removes internal field value
    // _savedValue.remove(name);
  }

  void save() {
    _formKey.currentState!.save();
    //copy values from instant to saved
    _savedValue.clear();
    _savedValue.addAll(_instantValue);
  }

  void invalidateField({required String name, String? errorText}) =>
      fields[name]?.invalidate(errorText ?? '');

  void invalidateFirstField({required String errorText}) =>
      fields.values.first.invalidate(errorText);

  bool validate() {
    final hasError = !_formKey.currentState!.validate();
    if (hasError && widget.autoFocusOnValidationFailure) {
      final wrongFields =
          fields.values.where((element) => element.hasError).toList();
      wrongFields.first.requestFocus();
    }
    return !hasError;
  }

  bool saveAndValidate() {
    save();
    return validate();
  }

  void reset() {
    log('reset called');
    _formKey.currentState!.reset();
    for (var item in _fields.entries) {
      try {
        item.value.didChange(getRawValue(item.key));
      } catch (e, st) {
        log(
          'Error when resetting field: ${item.key}',
          error: e,
          stackTrace: st,
          level: 2000,
        );
      }
    }
    // _formKey.currentState!.setState(() {});
  }

  void patchValue(Map<String, dynamic> val) {
    val.forEach((key, dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidateMode,
      onWillPop: widget.onWillPop,
      onChanged: widget.onChanged,
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: widget.child,
      ),
    );
  }
}
