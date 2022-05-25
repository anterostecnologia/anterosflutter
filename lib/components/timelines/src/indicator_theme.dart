import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'indicators.dart';
import 'timeline_node.dart';
import 'timeline_theme.dart';

/// Defines the visual properties of [AnterosDotIndicator], indicators inside
/// [AnterosTimelineNode]s.
///
/// Descendant widgets obtain the current [AnterosIndicatorThemeData] object using
/// `IndicatorTheme.of(context)`. Instances of [AnterosIndicatorThemeData] can be
/// customized with [AnterosIndicatorThemeData.copyWith].
///
/// Typically a [AnterosIndicatorThemeData] is specified as part of the overall
/// [AnterosTimelineTheme] with [AnterosTimelineThemeData.indicatorTheme].
///
/// All [AnterosIndicatorThemeData] properties are `null` by default. When null, the
/// widgets will provide their own defaults.
///
/// See also:
///
///  * [AnterosTimelineThemeData], which describes the overall theme information for
///  the timeline.
@immutable
class AnterosIndicatorThemeData with Diagnosticable {
  /// Creates a theme that can be used for [AnterosIndicatorTheme] or
  /// [AnterosTimelineThemeData.indicatorTheme].
  const AnterosIndicatorThemeData({
    this.color,
    this.size,
    this.position,
  });

  /// The color of [AnterosDotIndicator]s and indicators inside [AnterosTimelineNode]s, and so
  /// forth.
  final Color? color;

  /// The size of [AnterosDotIndicator]s and indicators inside [AnterosTimelineNode]s, and so
  /// forth in logical pixels.
  ///
  /// Indicators occupy a square with width and height equal to size.
  final double? size;

  /// A position of indicator inside both two connectors.
  final double? position;

  /// Creates a copy of this object with the given fields replaced with the new
  /// values.
  AnterosIndicatorThemeData copyWith({
    Color? color,
    double? size,
    double? position,
  }) {
    return AnterosIndicatorThemeData(
      color: color ?? this.color,
      size: size ?? this.size,
      position: position ?? this.position,
    );
  }

  /// Linearly interpolate between two Indicator themes.
  ///
  /// The argument `t` must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static AnterosIndicatorThemeData lerp(
      AnterosIndicatorThemeData? a, AnterosIndicatorThemeData? b, double t) {
    return AnterosIndicatorThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      size: lerpDouble(a?.size, b?.size, t),
      position: lerpDouble(a?.position, b?.position, t),
    );
  }

  @override
  int get hashCode => hashValues(color, size, position);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AnterosIndicatorThemeData &&
        other.color == color &&
        other.size == size &&
        other.position == position;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color, defaultValue: null))
      ..add(DoubleProperty('size', size, defaultValue: null))
      ..add(DoubleProperty('position', size, defaultValue: null));
  }
}

/// Controls the default color and size of indicators in a widget subtree.
///
/// The indicator theme is honored by [AnterosTimelineNode], [AnterosDotIndicator] and
/// [AnterosOutlinedDotIndicator] widgets.
class AnterosIndicatorTheme extends InheritedTheme {
  /// Creates an indicator theme that controls the color and size for
  /// [AnterosDotIndicator]s, indicators inside [AnterosTimelineNode]s.
  const AnterosIndicatorTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// The properties for descendant [AnterosDotIndicator]s, indicators inside
  /// [AnterosTimelineNode]s.
  final AnterosIndicatorThemeData data;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// Defaults to the current [AnterosTimelineThemeData.indicatorTheme].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  ///  IndicatorThemeData theme = IndicatorTheme.of(context);
  /// ```
  static AnterosIndicatorThemeData of(BuildContext context) {
    final indicatorTheme =
        context.dependOnInheritedWidgetOfExactType<AnterosIndicatorTheme>();
    return indicatorTheme?.data ??
        AnterosTimelineTheme.of(context).indicatorTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<AnterosIndicatorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : AnterosIndicatorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AnterosIndicatorTheme oldWidget) =>
      data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// Indicator component configured through [AnterosIndicatorTheme]
mixin ThemedIndicatorComponent on AnterosPositionedIndicator {
  /// {@template timelines.indicator.color}
  /// Defaults to the current [AnterosIndicatorTheme] color, if any.
  ///
  /// If no [AnterosIndicatorTheme] and no [AnterosTimelineTheme] is specified, indicators
  /// will default to blue.
  /// {@endtemplate}
  Color? get color;
  Color getEffectiveColor(BuildContext context) {
    return color ??
        AnterosIndicatorTheme.of(context).color ??
        AnterosTimelineTheme.of(context).color;
  }

  /// {@template timelines.indicator.size}
  /// Indicators occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [AnterosIndicatorTheme] size, if any. If there is no
  /// [AnterosIndicatorTheme], or it does not specify an explicit size, then it
  /// defaults to own child size(0.0).
  /// {@endtemplate}
  double? get size;
  double? getEffectiveSize(BuildContext context) {
    return size ?? AnterosIndicatorTheme.of(context).size;
  }
}
