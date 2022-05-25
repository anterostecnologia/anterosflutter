import 'package:anterosflutter/components/select/src/utils/accent.dart';
import 'package:flutter/foundation.dart';
import 'choice_theme.dart';

/// Validation callback
typedef String AnterosValidation<T>(T value);

/// Choice data configuration
@immutable
class AnterosChoice<T> with Diagnosticable {
  /// Value to return
  final T value;

  /// Represent as primary text
  final String? title;

  /// Represent as secondary text
  final String? subtitle;

  /// The choice will grouped by this property value
  final String? group;

  /// Whether the choice is disabled or enabled
  final bool disabled;

  /// Whether the choice is displayed or not
  final bool hidden;

  /// This prop is useful for choice builder
  final dynamic meta;

  /// Individual unselected choice item style
  final AnterosChoiceStyle? style;

  /// Individual selected choice item style
  final AnterosChoiceStyle? activeStyle;

  /// Callback to select choice
  final ValueSetter<bool?>? select;

  /// Whether the choice is selected or not
  final bool selected;

  /// Default constructor
  AnterosChoice({
    required this.value,
    required this.title,
    this.subtitle,
    this.group,
    this.disabled = false,
    this.hidden = false,
    this.meta,
    this.style,
    this.activeStyle,
    this.select,
    this.selected = false,
  });

  /// Helper to create option list from any list
  static List<AnterosChoice<R>> listFrom<R, E>({
    required List<E> source,
    required _AnterosOptionProp<E, R> value,
    required _AnterosOptionProp<E, String> title,
    _AnterosOptionProp<E, String>? subtitle,
    _AnterosOptionProp<E, String>? group,
    _AnterosOptionProp<E, bool>? disabled,
    _AnterosOptionProp<E, bool>? hidden,
    _AnterosOptionProp<E, dynamic>? meta,
    _AnterosOptionProp<E, AnterosChoiceStyle>? style,
    _AnterosOptionProp<E, AnterosChoiceStyle>? activeStyle,
  }) =>
      source
          .asMap()
          .map((index, item) => MapEntry(
              index,
              AnterosChoice<R>(
                value: value.call(index, item),
                title: title.call(index, item),
                subtitle: subtitle?.call(index, item),
                group: group?.call(index, item),
                disabled: disabled?.call(index, item) ?? false,
                hidden: hidden?.call(index, item) ?? false,
                meta: meta?.call(index, item),
                style: style?.call(index, item),
                activeStyle: activeStyle?.call(index, item),
              )))
          .values
          .toList();

  bool contains(String query) {
    return _testPropBy(title, query) ||
        _testPropBy(subtitle, query) ||
        _testPropBy(group, query);
  }

  bool _testPropBy(String? prop, String query) {
    return prop != null ? normalized(prop).contains(normalized(query)) : false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnterosChoice &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  AnterosChoiceStyle? get effectiveStyle =>
      selected == true ? activeStyle : style;

  /// Creates a copy of this [AnterosChoice] but with
  /// the given fields replaced with the new values.
  AnterosChoice<T> copyWith({
    T? value,
    String? title,
    String? subtitle,
    String? group,
    bool? disabled,
    bool? hidden,
    dynamic meta,
    AnterosChoiceStyle? style,
    AnterosChoiceStyle? activeStyle,
    ValueSetter<bool?>? select,
    bool? selected,
  }) {
    return AnterosChoice<T>(
      value: value ?? this.value,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      group: group ?? this.group,
      disabled: disabled ?? this.disabled,
      hidden: hidden ?? this.hidden,
      meta: meta ?? this.meta,
      style: style ?? this.style,
      activeStyle: activeStyle ?? this.activeStyle,
      select: select ?? this.select,
      selected: selected ?? this.selected,
    );
  }

  /// Creates a copy of this [AnterosChoice] but with
  /// the given fields replaced with the new values.
  AnterosChoice<T> merge(AnterosChoice<T>? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      value: other.value,
      title: other.title,
      subtitle: other.subtitle,
      group: other.group,
      disabled: other.disabled,
      hidden: other.hidden,
      meta: other.meta,
      style: other.style,
      activeStyle: other.activeStyle,
      select: other.select,
      selected: other.selected,
    );
  }
}

typedef R _AnterosOptionProp<E, R>(int index, E item);
