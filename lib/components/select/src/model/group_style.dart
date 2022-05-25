import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// Configure choices group header style
@immutable
class AnterosGroupHeaderStyle with Diagnosticable {
  /// Group header background color
  final Color? backgroundColor;

  /// Highlight color
  final Color? highlightColor;

  /// Group header text style
  final TextStyle? textStyle;

  /// Group header padding
  final EdgeInsetsGeometry? padding;

  /// Group header height
  final double height;

  /// Group header cross axis alignment
  final CrossAxisAlignment? crossAxisAlignment;

  /// Group header main axis alignment
  final MainAxisAlignment? mainAxisAlignment;

  /// Create a configuration of choices group header style
  const AnterosGroupHeaderStyle({
    this.highlightColor,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.height = 45.0,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  /// Creates a copy of this [AnterosGroupHeaderStyle] but with
  /// the given fields replaced with the new values.
  AnterosGroupHeaderStyle copyWith({
    Color? backgroundColor,
    Color? highlightColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? height,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
  }) {
    return AnterosGroupHeaderStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      highlightColor: highlightColor ?? this.highlightColor,
      textStyle: this.textStyle?.merge(textStyle) ?? textStyle,
      padding: padding ?? this.padding,
      height: height ?? this.height,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
    );
  }

  /// Returns a new [AnterosGroupHeaderStyle] that is
  /// a combination of this object and the given [other] style.
  AnterosGroupHeaderStyle merge(AnterosGroupHeaderStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      highlightColor: other.highlightColor,
      textStyle: other.textStyle,
      padding: other.padding,
      height: other.height,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
    );
  }
}
