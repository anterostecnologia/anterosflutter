import 'package:flutter/material.dart';

import 'indicator_theme.dart';
import 'timeline_theme.dart';

/// [TimelineNode]'s indicator.
mixin AnterosPositionedIndicator on Widget {
  /// {@template timelines.indicator.position}
  /// If this is null, then the [AnterosIndicatorThemeData.position] is used. If that
  /// is also null, then this defaults to [AnterosTimelineThemeData.indicatorPosition].
  /// {@endtemplate}
  double? get position;
  double getEffectivePosition(BuildContext context) {
    return position ??
        AnterosIndicatorTheme.of(context).position ??
        AnterosTimelineTheme.of(context).indicatorPosition;
  }
}

/// Abstract class for predefined indicator widgets.
///
/// See also:
///
///  * [AnterosDotIndicator], which is a [AnterosIndicator] that draws dot.
///  * [AnterosOutlinedDotIndicator], which is a [AnterosIndicator] that draws outlined dot.
///  * [AnterosContainerIndicator], which is a [AnterosIndicator] that draws it's child.
abstract class AnterosIndicator extends StatelessWidget
    with AnterosPositionedIndicator, ThemedIndicatorComponent {
  /// Creates an indicator.
  const AnterosIndicator({
    Key? key,
    this.size,
    this.color,
    this.border,
    this.position,
    this.child,
  })  : assert(size == null || size >= 0),
        assert(position == null || 0 <= position && position <= 1),
        super(key: key);

  /// Creates a dot indicator.
  ///
  /// See also:
  ///
  /// * [AnterosDotIndicator],  exactly the same.
  factory AnterosIndicator.dot({
    Key? key,
    double? size,
    Color? color,
    double? position,
    Border? border,
    Widget? child,
  }) =>
      AnterosDotIndicator(
        size: size,
        color: color,
        position: position,
        border: border,
        child: child,
      );

  /// Creates a outlined dot indicator.
  ///
  /// See also:
  ///
  /// * [AnterosOutlinedDotIndicator], exactly the same.
  factory AnterosIndicator.outlined({
    Key? key,
    double? size,
    Color? color,
    Color? backgroundColor,
    double? position,
    double borderWidth = 2.0,
    Widget? child,
  }) =>
      AnterosOutlinedDotIndicator(
        size: size,
        color: color,
        position: position,
        backgroundColor: backgroundColor,
        borderWidth: borderWidth,
        child: child,
      );

  /// Creates a transparent indicator.
  ///
  /// See also:
  ///
  /// * [AnterosContainerIndicator], this is created without child.
  factory AnterosIndicator.transparent({
    Key? key,
    double? size,
    double? position,
  }) =>
      AnterosContainerIndicator(
        size: size,
        position: position,
      );

  /// Creates a widget indicator.
  ///
  /// See also:
  ///
  /// * [AnterosOutlinedDotIndicator], exactly the same.
  factory AnterosIndicator.widget({
    Key? key,
    double? size,
    double? position,
    Widget? child,
  }) =>
      AnterosContainerIndicator(
        size: size,
        position: position,
        child: child,
      );

  /// The size of the dot in logical pixels.
  ///
  /// {@macro timelines.indicator.size}
  @override
  final double? size;

  /// The color to use when drawing the dot.
  ///
  /// {@macro timelines.indicator.color}
  @override
  final Color? color;

  /// The position of a indicator between the two connectors.
  ///
  /// {@macro timelines.indicator.position}
  @override
  final double? position;

  /// The border to use when drawing the dot's outline.
  final BoxBorder? border;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;
}

/// A widget that displays an [child]. The [child] if null, the indicator is not
/// visible.
class AnterosContainerIndicator extends AnterosIndicator {
  /// Creates a container indicator.
  const AnterosContainerIndicator({
    Key? key,
    double? size,
    double? position,
    this.child,
  }) : super(
          key: key,
          size: size,
          position: position,
          color: Colors.transparent,
        );

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = getEffectiveSize(context);
    return Container(
      width: size,
      height: size,
      child: child,
    );
  }
}

/// A widget that displays an dot.
class AnterosDotIndicator extends AnterosIndicator {
  /// Creates a dot indicator.
  ///
  /// The [size] must be null or non-negative.
  const AnterosDotIndicator({
    Key? key,
    double? size,
    Color? color,
    double? position,
    this.border,
    this.child,
  }) : super(
          key: key,
          size: size,
          color: color,
          position: position,
        );

  /// The border to use when drawing the dot's outline.
  final BoxBorder? border;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = getEffectiveSize(context);
    final effectiveColor = getEffectiveColor(context);
    return Center(
      child: Container(
        width: effectiveSize ?? ((child == null) ? 15.0 : null),
        height: effectiveSize ?? ((child == null) ? 15.0 : null),
        child: child,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: effectiveColor,
          border: border,
        ),
      ),
    );
  }
}

/// A widget that displays an outlined dot.
class AnterosOutlinedDotIndicator extends AnterosIndicator {
  /// Creates a outlined dot indicator.
  ///
  /// The [size] must be null or non-negative.
  const AnterosOutlinedDotIndicator({
    Key? key,
    double? size,
    Color? color,
    double? position,
    this.backgroundColor,
    this.borderWidth = 2.0,
    this.child,
  })  : assert(size == null || size >= 0),
        assert(position == null || 0 <= position && position <= 1),
        super(
          key: key,
          size: size,
          color: color,
          position: position,
        );

  /// The color to use when drawing the dot in outline.
  ///
  /// {@macro timelines.indicator.color}
  final Color? backgroundColor;

  /// The width of this outline, in logical pixels.
  final double borderWidth;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnterosDotIndicator(
      size: size,
      color: backgroundColor ?? Colors.transparent,
      position: position,
      border: Border.all(
        color: color ?? getEffectiveColor(context),
        width: borderWidth,
      ),
      child: child,
    );
  }
}
