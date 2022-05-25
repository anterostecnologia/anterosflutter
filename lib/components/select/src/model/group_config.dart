import 'package:flutter/foundation.dart';
import './group_style.dart';
import './group_sort.dart';

/// Choices configuration
@immutable
class AnterosGroupConfig with Diagnosticable {
  /// Whether the choices list is grouped or not, based on [AnterosChoice.group]
  final bool enabled;

  /// If [enabled] is `true`, whether the group header displays the choices selector toggle or not,
  final bool useSelector;

  /// If [enabled] is `true`, whether the group header displays the choices counter or not
  final bool useCounter;

  /// If [enabled] is `true`, comparator function to sort the group keys
  ///
  /// Defaults to `null`, and it means disabled the sorting
  final AnterosGroupSort? sortBy;

  /// Configure choices group header theme
  final AnterosGroupHeaderStyle headerStyle;

  /// Create choices configuration
  const AnterosGroupConfig({
    this.enabled = false,
    this.useSelector = false,
    this.useCounter = true,
    this.sortBy,
    this.headerStyle = const AnterosGroupHeaderStyle(),
  });

  /// Opposite value of enabled
  bool get disabled => !enabled;

  /// Creates a copy of this [AnterosGroupConfig] but with
  /// the given fields replaced with the new values.
  AnterosGroupConfig copyWith({
    bool? enabled,
    bool? useSelector,
    bool? useCounter,
    AnterosGroupSort? sortBy,
    AnterosGroupHeaderStyle? headerStyle,
  }) {
    return AnterosGroupConfig(
      enabled: enabled ?? this.enabled,
      useSelector: useSelector ?? this.useSelector,
      useCounter: useCounter ?? this.useCounter,
      sortBy: sortBy ?? this.sortBy,
      headerStyle: headerStyle == null
          ? this.headerStyle
          : this.headerStyle.merge(headerStyle),
    );
  }

  /// Returns a new [AnterosGroupConfig] that is
  /// a combination of this object and the given [other] style.
  AnterosGroupConfig merge(AnterosGroupConfig? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      enabled: other.enabled,
      useSelector: other.useSelector,
      useCounter: other.useCounter,
      sortBy: other.sortBy,
      headerStyle: other.headerStyle,
    );
  }
}
