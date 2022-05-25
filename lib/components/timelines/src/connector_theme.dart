import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'connectors.dart';
import 'timeline_node.dart';
import 'timeline_theme.dart';

/// Defines the visual properties of [AnterosSolidLineConnector], connectors inside
/// [AnterosTimelineNode].
///
/// Descendant widgets obtain the current [AnterosConnectorThemeData] object using
/// `ConnectorTheme.of(context)`. Instances of [AnterosConnectorThemeData] can be
/// customized with [AnterosConnectorThemeData.copyWith].
///
/// Typically a [AnterosConnectorThemeData] is specified as part of the overall
/// [AnterosTimelineTheme] with [AnterosTimelineThemeData.connectorTheme].
///
/// All [AnterosConnectorThemeData] properties are `null` by default. When null, the
/// widgets will provide their own defaults.
///
/// See also:
///
///  * [AnterosTimelineThemeData], which describes the overall theme information for
///  the timeline.
@immutable
class AnterosConnectorThemeData with Diagnosticable {
  /// Creates a theme that can be used for [AnterosConnectorTheme] or
  /// [AnterosTimelineThemeData.connectorTheme].
  const AnterosConnectorThemeData({
    this.color,
    this.space,
    this.thickness,
    this.indent,
  });

  /// The color of [AnterosSolidLineConnector]s and connectors inside [AnterosTimelineNode]s,
  /// and so forth.
  final Color? color;

  /// This represents the amount of horizontal or vertical space the connector
  /// takes up.
  final double? space;

  /// The thickness of the line drawn within the connector.
  final double? thickness;

  /// The amount of empty space at the edge of [AnterosSolidLineConnector].
  final double? indent;

  /// Creates a copy of this object with the given fields replaced with the new
  /// values.
  AnterosConnectorThemeData copyWith({
    Color? color,
    double? space,
    double? thickness,
    double? indent,
  }) {
    return AnterosConnectorThemeData(
      color: color ?? this.color,
      space: space ?? this.space,
      thickness: thickness ?? this.thickness,
      indent: indent ?? this.indent,
    );
  }

  /// Linearly interpolate between two Connector themes.
  ///
  /// The argument `t` must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static AnterosConnectorThemeData lerp(
      AnterosConnectorThemeData? a, AnterosConnectorThemeData? b, double t) {
    return AnterosConnectorThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      space: lerpDouble(a?.space, b?.space, t),
      thickness: lerpDouble(a?.thickness, b?.thickness, t),
      indent: lerpDouble(a?.indent, b?.indent, t),
    );
  }

  @override
  int get hashCode {
    return hashValues(
      color,
      space,
      thickness,
      indent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AnterosConnectorThemeData &&
        other.color == color &&
        other.space == space &&
        other.thickness == thickness &&
        other.indent == indent;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color, defaultValue: null))
      ..add(DoubleProperty('space', space, defaultValue: null))
      ..add(DoubleProperty('thickness', thickness, defaultValue: null))
      ..add(DoubleProperty('indent', indent, defaultValue: null));
  }
}

/// An inherited widget that defines the configuration for
/// [AnterosSolidLineConnector]s, connectors inside [AnterosTimelineNode]s.
class AnterosConnectorTheme extends InheritedTheme {
  /// Creates a connector theme that controls the configurations for
  /// [AnterosSolidLineConnector]s, connectors inside [AnterosTimelineNode]s.
  const AnterosConnectorTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// The properties for descendant [AnterosSolidLineConnector]s, connectors inside
  /// [AnterosTimelineNode]s.
  final AnterosConnectorThemeData data;

  /// The closest instance of this class's [data] value that encloses the given
  /// context.
  ///
  /// If there is no ancestor, it returns [AnterosTimelineThemeData.connectorTheme].
  /// Applications can assume that the returned value will not be null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ConnectorThemeData theme = ConnectorTheme.of(context);
  /// ```
  static AnterosConnectorThemeData of(BuildContext context) {
    final connectorTheme =
        context.dependOnInheritedWidgetOfExactType<AnterosConnectorTheme>();
    return connectorTheme?.data ??
        AnterosTimelineTheme.of(context).connectorTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<AnterosConnectorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : AnterosConnectorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AnterosConnectorTheme oldWidget) =>
      data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// Connector component configured through [AnterosConnectorTheme]
mixin ThemedConnectorComponent on Widget {
  /// {@template timelines.connector.direction}
  /// If this is null, then the [AnterosTimelineThemeData.direction] is used.
  /// {@endtemplate}
  Axis? get direction;
  Axis getEffectiveDirection(BuildContext context) {
    return direction ?? AnterosTimelineTheme.of(context).direction;
  }

  /// {@template timelines.connector.thickness}
  /// If this is null, then the [AnterosConnectorThemeData.thickness] is used which
  /// defaults to 2.0.
  /// {@endtemplate}
  double? get thickness;
  double getEffectiveThickness(BuildContext context) {
    return thickness ?? AnterosConnectorTheme.of(context).thickness ?? 2.0;
  }

  /// {@template timelines.connector.space}
  /// If this is null, then the [AnterosConnectorThemeData.space] is used. If that is
  /// also null, then this defaults to double.infinity.
  /// {@endtemplate}
  double? get space;
  double? getEffectiveSpace(BuildContext context) {
    return space ?? AnterosConnectorTheme.of(context).space;
  }

  double? get indent;
  double getEffectiveIndent(BuildContext context) {
    return indent ?? AnterosConnectorTheme.of(context).indent ?? 0.0;
  }

  double? get endIndent;
  double getEffectiveEndIndent(BuildContext context) {
    return endIndent ?? AnterosConnectorTheme.of(context).indent ?? 0.0;
  }

  Color? get color;
  Color getEffectiveColor(BuildContext context) {
    return color ??
        AnterosConnectorTheme.of(context).color ??
        AnterosTimelineTheme.of(context).color;
  }
}
