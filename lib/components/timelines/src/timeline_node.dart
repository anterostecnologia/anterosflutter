import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'connectors.dart';
import 'indicators.dart';
import 'timeline_theme.dart';
import 'util.dart';

/// [AnterosTimelineTile]'s timeline node
mixin AnterosTimelineTileNode on Widget {
  /// {@template timelines.node.position}
  /// If this is null, then the [AnterosTimelineThemeData.nodePosition] is used.
  /// {@endtemplate}
  double? get position;
  double getEffectivePosition(BuildContext context) {
    return position ?? AnterosTimelineTheme.of(context).nodePosition;
  }
}

/// A widget that displays indicator and two connectors.
///
/// The [indicator] displayed between the [startConnector] and [endConnector]
class AnterosTimelineNode extends StatelessWidget with AnterosTimelineTileNode {
  /// Creates a timeline node.
  ///
  /// The [indicatorPosition] must be null or a value between 0 and 1.
  const AnterosTimelineNode({
    Key? key,
    this.direction,
    this.startConnector,
    this.endConnector,
    this.indicator = const AnterosContainerIndicator(),
    this.indicatorPosition,
    this.position,
    this.overlap,
  })  : assert(indicatorPosition == null ||
            0 <= indicatorPosition && indicatorPosition <= 1),
        super(key: key);

  /// Creates a timeline node that connects the dot indicator in a solid line.
  AnterosTimelineNode.simple({
    Key? key,
    Axis? direction,
    Color? color,
    double? lineThickness,
    double? nodePosition,
    double? indicatorPosition,
    double? indicatorSize,
    Widget? indicatorChild,
    double? indent,
    double? endIndent,
    bool drawStartConnector = true,
    bool drawEndConnector = true,
    bool? overlap,
  }) : this(
          key: key,
          direction: direction,
          startConnector: drawStartConnector
              ? AnterosSolidLineConnector(
                  direction: direction,
                  color: color,
                  thickness: lineThickness,
                  indent: indent,
                  endIndent: endIndent,
                )
              : null,
          endConnector: drawEndConnector
              ? AnterosSolidLineConnector(
                  direction: direction,
                  color: color,
                  thickness: lineThickness,
                  indent: indent,
                  endIndent: endIndent,
                )
              : null,
          indicator: AnterosDotIndicator(
            child: indicatorChild,
            position: indicatorPosition,
            size: indicatorSize,
            color: color,
          ),
          indicatorPosition: indicatorPosition,
          position: nodePosition,
          overlap: overlap,
        );

  /// {@macro timelines.direction}
  final Axis? direction;

  /// The connector of the start edge of this node
  final Widget? startConnector;

  /// The connector of the end edge of this node
  final Widget? endConnector;

  /// The indicator of the node
  final Widget indicator;

  /// The position of a indicator between the two connectors.
  ///
  /// {@macro timelines.indicator.position}
  final double? indicatorPosition;

  /// A position of timeline node between both two contents.
  ///
  /// {@macro timelines.node.position}
  @override
  final double? position;

  /// Determine whether each connectors and indicator will overlap.
  ///
  /// When each connectors overlap, they are drawn from the center offset of the
  /// indicator.
  final bool? overlap;

  double _getEffectiveIndicatorPosition(BuildContext context) {
    var indicatorPosition = this.indicatorPosition;
    indicatorPosition ??= (indicator is AnterosPositionedIndicator)
        ? (indicator as AnterosPositionedIndicator)
            .getEffectivePosition(context)
        : AnterosTimelineTheme.of(context).indicatorPosition;
    return indicatorPosition;
  }

  bool _getEffectiveOverlap(BuildContext context) {
    var overlap =
        this.overlap ?? AnterosTimelineTheme.of(context).nodeItemOverlap;
    return overlap;
  }

  @override
  Widget build(BuildContext context) {
    final direction =
        this.direction ?? AnterosTimelineTheme.of(context).direction;
    final overlap = _getEffectiveOverlap(context);
    // TODO: support both flex and logical pixel
    final indicatorFlex = _getEffectiveIndicatorPosition(context);
    Widget line = indicator;
    final lineItems = [
      if (indicatorFlex > 0)
        Flexible(
          flex: (indicatorFlex * kFlexMultiplier).toInt(),
          child: startConnector ?? TransparentConnector(),
        ),
      if (!overlap) indicator,
      if (indicatorFlex < 1)
        Flexible(
          flex: ((1 - indicatorFlex) * kFlexMultiplier).toInt(),
          child: endConnector ?? TransparentConnector(),
        ),
    ];

    switch (direction) {
      case Axis.vertical:
        line = Column(
          mainAxisSize: MainAxisSize.min,
          children: lineItems,
        );
        break;
      case Axis.horizontal:
        line = Row(
          mainAxisSize: MainAxisSize.min,
          children: lineItems,
        );
        break;
    }

    Widget result;
    if (overlap) {
      Widget positionedIndicator = indicator;
      final positionedIndicatorItems = [
        if (indicatorFlex > 0)
          Flexible(
            flex: (indicatorFlex * kFlexMultiplier).toInt(),
            child: TransparentConnector(),
          ),
        indicator,
        Flexible(
          flex: ((1 - indicatorFlex) * kFlexMultiplier).toInt(),
          child: TransparentConnector(),
        ),
      ];

      switch (direction) {
        case Axis.vertical:
          positionedIndicator = Column(
            mainAxisSize: MainAxisSize.min,
            children: positionedIndicatorItems,
          );
          break;
        case Axis.horizontal:
          positionedIndicator = Row(
            mainAxisSize: MainAxisSize.min,
            children: positionedIndicatorItems,
          );
          break;
      }

      result = Stack(
        alignment: Alignment.center,
        children: [
          line,
          positionedIndicator,
        ],
      );
    } else {
      result = line;
    }

    if (AnterosTimelineTheme.of(context).direction != direction) {
      result = AnterosTimelineTheme(
        data: AnterosTimelineTheme.of(context).copyWith(
          direction: direction,
        ),
        child: result,
      );
    }

    return result;
  }
}
