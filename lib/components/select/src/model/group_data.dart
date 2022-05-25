import 'package:flutter/foundation.dart';
import './choice_item.dart';
import './group_style.dart';

/// choice group data
@immutable
class AnterosGroup<T> with Diagnosticable {
  /// Group name
  final String? name;

  /// Group choice items
  final List<AnterosChoice<T>>? choices;

  /// Group header style
  final AnterosGroupHeaderStyle? headerStyle;

  /// default constructor
  AnterosGroup({
    this.name,
    this.choices,
    this.headerStyle,
  });

  /// Group choice items length
  int get count => choices?.length ?? 0;

  /// Group choice item values
  List<T> get values => choices?.map((e) => e.value).toList().cast<T>() ?? [];

  /// Creates a copy of this [AnterosGroup] but with
  /// the given fields replaced with the new values.
  AnterosGroup copyWith({
    String? name,
    List<AnterosChoice>? choices,
    AnterosGroupHeaderStyle? headerStyle,
  }) {
    return AnterosGroup(
      name: name ?? this.name,
      choices: choices ?? this.choices,
      headerStyle: headerStyle ?? this.headerStyle,
    );
  }

  /// Creates a copy of this [AnterosGroup] but with
  /// the given fields replaced with the new values.
  AnterosGroup merge(AnterosGroup? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      name: other.name,
      choices: other.choices,
      headerStyle: other.headerStyle,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnterosGroup &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
