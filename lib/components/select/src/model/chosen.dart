import 'package:flutter/widgets.dart';
import 'choice_item.dart';

/// Function to return a single [AnterosChoice] from a single `value`
typedef Future<AnterosChoice<T>?> AnterosSingleSelectedResolver<T>(T value);

/// Function to return a `List` of [AnterosChoice] from a `List` of `value`
typedef Future<List<AnterosChoice<T>>?> AnterosMultiSelectedResolver<T>(
    List<T>? value);

/// Chosen data class
abstract class AnterosChosenData<T> {
  /// Returns the choice item(s)
  get choice;

  /// Returns the value(s) data
  get value;

  /// Returns the title(s) data
  get title;

  /// Returns the subtitle(s) data
  get subtitle;

  /// Returns the group(s) data
  get group;

  /// Returns the length of the [choice]
  int get length;

  /// Returns `true` if there are no values in the chosen data
  bool get isEmpty;

  /// Returns `true` if there is at least one value in the chosen data
  bool get isNotEmpty;

  /// Returns `true` if the chosen contains the supplied choice item
  bool has(AnterosChoice<T> choice);

  /// Returns `true` if the chosen has any of the supplied choice items
  bool hasAny(List<AnterosChoice<T>> choices);

  /// Returns `true if the chosen has every of the supplied choice items
  bool hasAll(List<AnterosChoice<T>> choices);

  /// Returns a string that can be used as display,
  /// returns title if is valid and is not empty,
  /// returns placeholder if is valid and is empty.
  String toString();

  /// Return a [Text] widget from [toString]
  Widget toWidget() => Text(toString());
}

/// Chosen data for single choice widget
mixin AnterosSingleChosenData<T> on AnterosChosenData<T> {
  /// Returns [choice.value]
  @override
  T get value {
    return choice?.value;
  }

  /// Returns [choice.title]
  @override
  String? get title {
    return choice?.title;
  }

  /// Returns [choice.subtitle]
  @override
  String? get subtitle {
    return choice?.subtitle;
  }

  /// Returns [choice.group]
  @override
  String? get group {
    return choice?.group;
  }

  @override
  String toString() {
    return title!;
  }

  @override
  int get length => choice != null ? 1 : 0;

  @override
  bool get isEmpty => choice == null;

  @override
  bool get isNotEmpty => choice != null;

  @override
  bool has(AnterosChoice<T> choice) {
    return this.choice == choice;
  }

  @override
  bool hasAny(List<AnterosChoice<T>> choices) {
    throw UnsupportedError(
        'AnterosSingleChosen is not supported "hasAny" method');
  }

  @override
  bool hasAll(List<AnterosChoice<T>> choices) {
    throw UnsupportedError(
        'AnterosSingleChosen is not supported "hasAll" method');
  }
}

/// Chosen data for single choice widget
mixin AnterosMultiChosenData<T> on AnterosChosenData<T> {
  /// Returns an array of `value` of the current [choice]
  @override
  List<T>? get value {
    return choice != null && choice.length > 0
        ? choice.map((AnterosChoice<T> item) => item.value).toList().cast<T>()
        : [];
  }

  /// Returns an array of `title` of the [choice]
  @override
  List<String>? get title {
    return isNotEmpty
        ? choice
            .map((AnterosChoice<T> item) => item.title)
            .toList()
            .cast<String>()
        : null;
  }

  /// Returns an array of `subtitle` of the [choice]
  @override
  List<String>? get subtitle {
    return isNotEmpty
        ? choice
            .map((AnterosChoice<T> item) => item.subtitle)
            .toList()
            .cast<String>()
        : null;
  }

  /// Returns an array of `group` of the [choice]
  @override
  List<String>? get group {
    return isNotEmpty
        ? choice
            .map((AnterosChoice<T> item) => item.group)
            .toList()
            .cast<String>()
        : null;
  }

  @override
  String toString() {
    if (title == null) {
      return '';
    }
    return title!.join(', ');
  }

  @override
  int get length => choice?.length ?? 0;

  @override
  bool get isEmpty => length == 0;

  @override
  bool get isNotEmpty => length > 0;

  @override
  bool has(AnterosChoice<T> choice) {
    return this.choice?.contains(choice) ?? false;
  }

  /// Returns `true` if the selection has any of the supplied values
  bool hasAny(List<AnterosChoice<T>> choices) {
    return choices.any((e) => has(e));
  }

  /// Returns `true if the selection has every of the supplied values
  bool hasAll(List<AnterosChoice<T>> choices) {
    return choices.every((e) => has(e));
  }
}

class AnterosSingleChosen<T> extends AnterosChosenData<T>
    with AnterosSingleChosenData<T> {
  /// Default constructor
  AnterosSingleChosen(AnterosChoice<T>? choice) : _choice = choice;

  /// The choice item
  final AnterosChoice<T>? _choice;

  @override
  AnterosChoice<T>? get choice {
    return _choice;
  }
}

class AnterosMultiChosen<T> extends AnterosChosenData<T>
    with AnterosMultiChosenData<T> {
  /// Default constructor
  AnterosMultiChosen(List<AnterosChoice<T>>? choice) : _choice = choice;

  /// The choice item
  final List<AnterosChoice<T>>? _choice;

  @override
  List<AnterosChoice<T>>? get choice {
    return _choice;
  }
}

abstract class AnterosChosenNotifier<T> extends ChangeNotifier
    with AnterosChosenData<T> {
  /// A Function used to validate the selection(s)
  covariant var validation;

  /// Validation error message
  String error = '';

  /// Returns true when the selection is valid
  bool get isValid => error.isEmpty;

  /// Returns true when the selection is not valid
  bool get isNotValid => isValid != true;

  /// Validate the selection
  void validate();

  /// Validate the selection
  // void validate() {
  //   error = validation?.call(choice) ?? '';
  //   notifyListeners();
  // }
}

mixin AnterosSingleChosenNotifier<T> on AnterosChosenNotifier<T> {
  /// A function used to validate the selection
  @override
  AnterosValidation<AnterosSingleChosen<T>>? validation;

  /// Validate the selection
  @override
  void validate() {
    error = validation?.call(AnterosSingleChosen(choice)) ?? '';
    notifyListeners();
  }
}

mixin AnterosMultiChosenNotifier<T> on AnterosChosenNotifier<T> {
  /// A function used to validate the selection
  @override
  AnterosValidation<AnterosMultiChosen<T>>? validation;

  /// Validate the selection
  @override
  void validate() {
    error = validation?.call(AnterosMultiChosen(choice)) ?? '';
    notifyListeners();
  }
}

/// State of the selected choice
abstract class AnterosSelected<T> extends AnterosChosenNotifier<T> {
  /// A `String` to return in `toString` if the `title` is empty
  String? placeholder;

  /// Function to resolve [choice] from [value]
  covariant var resolver;

  /// Returns `true` if [choice] is not `null`
  bool get isResolved => choice != null;

  /// Returns `true` if one of [choice] or [value] is `null`
  bool get isNotResolved => isResolved != true;

  /// Returns `true` when [choice] is resolving in the background
  bool isResolving = false;

  /// Resolve [choice] from [value] using user defined [resolver],
  /// or fallback to [defaultResolver] if [resolver] is not defined
  resolve();

  /// Override the selected choice with a new one, and validate it
  set choice(covariant var choice);

  /// Override the selected value with a new one, and validate it
  set value(covariant var value);
}

class AnterosSingleSelected<T> extends AnterosSelected<T>
    with AnterosSingleChosenData<T> {
  /// Default constructor
  AnterosSingleSelected({
    required T value,
    AnterosChoice<T>? choice,
    this.resolver,
    this.validation,
    this.placeholder,
  })  : _value = value,
        _choice = choice;

  T _value;

  AnterosChoice<T>? _choice;

  /// a `String` to return in `toString` if the `title` is empty
  @override
  final String? placeholder;

  /// A function used to validate the selection
  @override
  final AnterosValidation<AnterosSingleChosen<T>>? validation;

  @override
  void validate() {
    error = validation?.call(AnterosSingleChosen(choice)) ?? '';
    notifyListeners();
  }

  /// Function to resolve [choice] from [value]
  @override
  AnterosSingleSelectedResolver<T>? resolver;

  @override
  void resolve({
    AnterosSingleSelectedResolver<T>? defaultResolver,
  }) async {
    if (isResolved) return null;

    isResolving = true;
    resolver = resolver ?? defaultResolver;
    notifyListeners();

    try {
      _choice = await resolver?.call(_value);
    } catch (e) {
      throw e;
    } finally {
      isResolving = false;
      validate();
    }
  }

  @override
  set choice(AnterosChoice<T>? val) {
    _choice = val;
    ////////////// ???????????? /////////////
    // _value = null;
    ////////////// ???????????? /////////////
    validate();
  }

  @override
  set value(T val) {
    _value = val;
    _choice = null;
    resolve();
  }

  /// Returns a single selected [AnterosChoice]
  @override
  AnterosChoice<T>? get choice {
    return _choice;
  }

  /// Returns [choice.value]
  @override
  T get value {
    return choice?.value ?? _value;
  }

  @override
  String toString() {
    return isResolving == true
        ? 'Resolving'
        : isValid == true
            ? title ?? placeholder ?? 'Select one'
            : error;
  }
}

class AnterosMultiSelected<T> extends AnterosSelected<T>
    with AnterosMultiChosenData<T> {
  /// Default Constructor
  AnterosMultiSelected({
    List<T> value = const [],
    List<AnterosChoice<T>>? choice,
    this.resolver,
    this.validation,
    this.placeholder,
  })  : _value = List<T>.from(value),
        _choice = choice != null ? List<AnterosChoice<T>>.from(choice) : null;

  List<T> _value;

  List<AnterosChoice<T>>? _choice;

  /// A `String` to return in `toString` if the `title` is empty
  @override
  final String? placeholder;

  /// A function used to validate the selection
  final AnterosValidation<AnterosMultiChosen<T>>? validation;

  @override
  void validate() {
    error = validation?.call(AnterosMultiChosen(choice)) ?? '';
    notifyListeners();
  }

  /// Function to resolve [choice] from [value]
  @override
  AnterosMultiSelectedResolver<T>? resolver;

  @override
  void resolve({
    AnterosMultiSelectedResolver<T>? defaultResolver,
  }) async {
    if (isResolved) return null;

    isResolving = true;
    resolver = resolver ?? defaultResolver;
    notifyListeners();

    try {
      _choice = await resolver?.call(_value);
    } catch (e) {
      throw e;
    } finally {
      isResolving = false;
      validate();
    }
  }

  @override
  set choice(List<AnterosChoice<T>>? choices) {
    _choice = List<AnterosChoice<T>>.from(choices ?? []);
    _value = [];
    validate();
  }

  @override
  set value(List<T>? val) {
    _value = List<T>.from(val ?? []);
    _choice = null;
    resolve();
  }

  /// return an array of the selected [AnterosChoice]
  @override
  List<AnterosChoice<T>>? get choice {
    return _choice;
  }

  /// return an array of `value` of the selected [choice]
  @override
  List<T> get value {
    return isNotEmpty
        ? choice!.map((AnterosChoice<T> item) => item.value).toList()
        : _value;
  }

  @override
  String toString() {
    return isResolving == true
        ? 'Resolving'
        : isValid == true
            ? title?.join(', ') ?? placeholder ?? 'Select one or more'
            : error;
  }
}

abstract class AnterosSelection<T> extends AnterosChosenNotifier<T> {
  /// The initial selection
  covariant var initial;

  /// Override choice(s) in the current selection with a new value(s), and validate it
  set choice(covariant var choice);

  /// Select or unselect a choice
  void select(AnterosChoice<T> choice, {bool selected = true});

  /// Reset the current selection to the initial selection
  void reset();

  /// Removes all choice(s) from the selection
  void clear();
}

class AnterosSingleSelection<T> extends AnterosSelection<T>
    with AnterosSingleChosenData<T> {
  /// The initial selection
  @override
  final AnterosChoice<T>? initial;

  /// A function used to validate the selection
  @override
  final AnterosValidation<AnterosSingleChosen<T>>? validation;

  /// Default constructor
  AnterosSingleSelection({
    required this.initial,
    this.validation,
  }) : _choice = initial;

  /// The choice of the current selection
  AnterosChoice<T>? _choice;

  @override
  AnterosChoice<T>? get choice => _choice;

  @override
  void validate() {
    error = validation?.call(AnterosSingleChosen(choice)) ?? '';
    notifyListeners();
  }

  @override
  set choice(AnterosChoice<T>? val) {
    _choice = val;
    validate();
  }

  @override
  String toString() {
    return isValid == true ? (title ?? '') : error;
  }

  @override
  void select(AnterosChoice<T> choice, {bool selected = true}) {
    _choice = choice;
    validate();
  }

  @override
  void reset() {
    choice = initial;
  }

  @override
  void clear() {
    choice = null;
  }
}

class AnterosMultiSelection<T> extends AnterosSelection<T>
    with AnterosMultiChosenData<T> {
  /// The Initial selection
  @override
  final List<AnterosChoice<T>> initial;

  /// A function used to validate the selection
  final AnterosValidation<AnterosMultiChosen<T>>? validation;

  /// Default constructor
  AnterosMultiSelection({
    required List<AnterosChoice<T>>? initial,
    this.validation,
  })  : initial = List.from(initial ?? []),
        _choice = List.from(initial ?? []);

  /// The choice(s) of the current selection
  List<AnterosChoice<T>> _choice;

  @override
  List<AnterosChoice<T>> get choice => _choice;

  @override
  void validate() {
    error = validation?.call(AnterosMultiChosen(choice)) ?? '';
    notifyListeners();
  }

  @override
  set choice(List<AnterosChoice<T>>? choice) {
    _choice = List<AnterosChoice<T>>.from(choice ?? []);
    validate();
  }

  @override
  String toString() {
    return isValid == true ? (title?.join(', ') ?? '') : error;
  }

  @override
  void select(AnterosChoice<T> choice, {bool selected = true}) {
    if (selected) {
      _choice.add(choice);
    } else {
      _choice.remove(choice);
    }
    validate();
  }

  @override
  void reset() {
    choice = List.from(initial);
  }

  @override
  void clear() {
    choice = null;
  }

  /// Add every value in supplied values into the selection
  void merge(List<AnterosChoice<T>> choices) {
    choice = List.from(choice)
      ..addAll(choices)
      ..toSet()
      ..toList();
  }

  /// Removes every value in supplied values from the selection
  void omit(List<AnterosChoice<T>>? choices) {
    choice = List.from(choice)..removeWhere((e) => choices!.contains(e));
  }

  /// Toggle put/pull the supplied values from the selection
  void toggle(List<AnterosChoice<T>> choices, {bool? pull}) {
    if (pull == true) {
      omit(choices);
    } else if (pull == false) {
      merge(choices);
    } else {
      if (hasAny(choices))
        omit(choices);
      else
        merge(choices);
    }
  }
}
