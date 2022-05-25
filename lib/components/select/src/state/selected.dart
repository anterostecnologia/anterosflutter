import 'package:flutter/widgets.dart';
import '../model/choice_item.dart';

/// Function to return a single [AnterosChoice] from a single `value`
typedef Future<AnterosChoice<T>> AnterosSingleSelectedResolver<T>(T value);

/// Function to return a `List` of [AnterosChoice] from a `List` of `value`
typedef Future<List<AnterosChoice<T>>> AnterosMultiSelectedResolver<T>(
    List<T>? value);

/// State of the selected choice
abstract class AnterosSelected<T> extends ChangeNotifier {
  /// A `String` to return in `toString` if the `title` is empty
  String? placeholder;

  /// Function to resolve [choice] from [value]
  covariant var resolver;

  /// A Function used to validate the selection(s)
  covariant var validation;

  /// Returns the length of the [choice]
  int get length;

  /// Returns `true` if there are no values in the selection
  bool get isEmpty;

  /// Returns `true` if there is at least one value in the selection
  bool get isNotEmpty;

  /// Override the selected choice with a new one, and validate it
  set choice(covariant var choice);

  /// Override the selected value with a new one, and validate it
  set value(covariant var value);

  get choice;

  get value;

  get title;

  get subtitle;

  get group;

  /// validate the selected
  void validate() {
    error = validation?.call(choice) ?? '';
    notifyListeners();
  }

  /// Validation error message
  String error = '';

  /// Returns `true` when the selected is valid
  bool get isValid => error.isEmpty;

  /// Returns `true` when the selected is not valid
  bool get isNotValid => isValid != true;

  /// Returns `true` if [choice] is not `null`
  bool get isResolved => choice != null;

  /// Returns `true` if one of [choice] or [value] is `null`
  bool get isNotResolved => isResolved != true;

  /// Returns `true` when [choice] is resolving in the background
  bool isResolving = false;

  /// Resolve [choice] from [value] using user defined [resolver],
  /// or fallback to [defaultResolver] if [resolver] is not defined
  resolve();

  // /// Creates a copy of this [AnterosSelected] but with
  // /// the given fields replaced with the new values.
  // copyWith();

  // /// Returns a new [AnterosSelected] that is
  // /// a combination of this object and the given [other] style.
  // merge(covariant AnterosSelected<T> other);

  /// Returns a string that can be used as display,
  /// returns error message if is not valid,
  /// returns title if is valid and is not empty,
  /// returns placeholder if is valid and is empty.
  String toString();

  /// Return a [Text] widget from [toString]
  Widget toWidget() => Text(toString());
}

/// State of single selected choice
class AnterosSingleSelected<T> extends AnterosSelected<T> {
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

  /// Function to resolve [choice] from [value]
  @override
  AnterosSingleSelectedResolver<T>? resolver;

  /// A function used to validate the selection
  @override
  final AnterosValidation<AnterosChoice<T>>? validation;

  /// a `String` to return in `toString` if the `title` is empty
  @override
  final String? placeholder;

  @override
  int get length => choice != null ? 1 : 0;

  @override
  bool get isEmpty => choice == null;

  @override
  bool get isNotEmpty => choice != null;

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

  /// return a single selected [AnterosChoice]
  @override
  AnterosChoice<T>? get choice {
    return _choice;
  }

  /// return [choice.value]
  @override
  T get value {
    return choice?.value ?? _value;
  }

  /// return [choice.title]
  @override
  String? get title {
    return choice?.title;
  }

  /// return [choice.subtitle]
  @override
  String? get subtitle {
    return choice?.subtitle;
  }

  /// return [choice.group]
  @override
  String? get group {
    return choice?.group;
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

/// State of multiple selected choice
class AnterosMultiSelected<T> extends AnterosSelected<T> {
  /// Default Constructor
  AnterosMultiSelected({
    List<T>? value,
    List<AnterosChoice<T>>? choice,
    this.resolver,
    this.validation,
    this.placeholder,
  })  : _value = List<T>.from(value ?? []),
        _choice = choice != null ? List<AnterosChoice<T>>.from(choice) : null;

  List<T> _value;

  List<AnterosChoice<T>>? _choice;

  /// Function to resolve [choice] from [value]
  @override
  AnterosMultiSelectedResolver<T>? resolver;

  /// A function used to validate the selection
  final AnterosValidation<List<AnterosChoice<T>>>? validation;

  /// a `String` to return in `toString` if the `title` is empty
  @override
  final String? placeholder;

  @override
  int get length => choice?.length ?? 0;

  @override
  bool get isEmpty => choice == null || choice?.isEmpty == true;

  @override
  bool get isNotEmpty => choice != null && choice?.isNotEmpty == true;

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
  set value(List<T> val) {
    _value = List<T>.from(val);
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

  /// return an array of `title` of the selected [choice]
  @override
  List<String?>? get title {
    return isNotEmpty
        ? choice!.map((AnterosChoice<T> item) => item.title).toList()
        : null;
  }

  /// return an array of `subtitle` of the selected [choice]
  @override
  List<String?>? get subtitle {
    return isNotEmpty
        ? choice!.map((AnterosChoice<T> item) => item.subtitle).toList()
        : null;
  }

  /// return an array of `group` of the selected [choice]
  @override
  List<String?>? get group {
    return isNotEmpty
        ? choice!.map((AnterosChoice<T> item) => item.group).toList()
        : null;
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
