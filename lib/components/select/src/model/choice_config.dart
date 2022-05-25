import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import './choice_theme.dart';

/// Type of choice input
enum AnterosChoiceType {
  /// use radio as choice widget for single choice
  radios,

  /// use checkbox as choice widget for multiple choice
  checkboxes,

  /// use switch as choice widget  for single and multiple choice
  switches,

  /// use chip as choice widget for single and multiple choice
  chips,

  /// use card as choice widget for single and multiple choice
  cards,
}

/// Layout of choice item
enum AnterosChoiceLayout {
  /// use list view widget
  list,

  /// use wrap view widget
  wrap,

  /// use grid view widget
  grid
}

/// Choices configuration
@immutable
class AnterosChoiceConfig with Diagnosticable {
  /// Choice item widget type
  ///
  /// Single choice can't use [AnterosChoiceType.checkboxes] and Multiple choice can't use [AnterosChoiceType.radios]
  final AnterosChoiceType? type;

  /// Choice list layout
  final AnterosChoiceLayout layout;

  /// Choice list scroll direction
  ///
  /// currently only support when [layout] is [AnterosChoiceLayout.wrap]
  final Axis direction;

  /// How much space to place between children in a run in the main axis.
  ///
  /// When [type] is [AnterosChoiceType.chips] or [layout] is [AnterosChoiceLayout.wrap]
  final double? spacing;

  /// How much space to place between the runs themselves in the cross axis.
  ///
  /// When [type] is [AnterosChoiceType.chips] or [layout] is [AnterosChoiceLayout.wrap]
  final double? runSpacing;

  /// Choices wrapper padding
  final EdgeInsetsGeometry? padding;

  /// Controls the layout of tiles in a grid.
  ///
  /// Used if [layout] is [AnterosChoiceLayout.grid]
  final SliverGridDelegate? gridDelegate;

  /// The number of children in the cross axis.
  ///
  /// Used if [layout] is [AnterosChoiceLayout.grid]
  /// Ignored if [gridDelegate] is defined
  final int gridCount;

  /// Fill the [crossAxisSpacing] and [crossAxisSpacing] with single configuration
  ///
  /// Used if [layout] is [AnterosChoiceLayout.grid]
  /// Ignored if [gridDelegate] is defined
  final double gridSpacing;

  /// Whether the choices item use divider or not
  final bool useDivider;

  /// The divider color
  final Color? dividerColor;

  /// Spacing between divider widget and choice widget
  final double? dividerSpacing;

  /// The divider thickness
  final double? dividerThickness;

  /// Custom color of the glowing indicator when overscroll the choices list
  final Color? overscrollColor;

  /// Configure unselected choices item style
  final AnterosChoiceStyle? style;

  /// Configure selected choices item style
  final AnterosChoiceStyle? activeStyle;

  /// Determines the physics of choices list widget
  final ScrollPhysics physics;

  /// limit per page to display the choices
  ///
  /// Defaults to `null`, it means disabled the paging
  final int? pageLimit;

  /// Time delay before display the choices
  final Duration? delay;

  /// Create choices configuration
  const AnterosChoiceConfig({
    this.type,
    this.layout = AnterosChoiceLayout.list,
    this.direction = Axis.vertical,
    this.spacing,
    this.runSpacing,
    this.padding,
    this.gridDelegate,
    this.gridCount = 2,
    this.gridSpacing = 0,
    this.useDivider = false,
    this.dividerColor,
    this.dividerSpacing,
    this.dividerThickness,
    this.overscrollColor,
    this.style,
    this.activeStyle,
    this.physics = const ScrollPhysics(),
    this.pageLimit,
    this.delay,
  });

  /// Whether the [layout] is [AnterosChoiceLayout.wrap] or [type] is [AnterosChoiceType.chips]
  bool get isWrapLayout =>
      layout == AnterosChoiceLayout.wrap || type == AnterosChoiceType.chips;

  /// Whether the [layout] is [AnterosChoiceLayout.grid] or [type] is [AnterosChoiceType.cards]
  bool get isGridLayout =>
      layout == AnterosChoiceLayout.grid || type == AnterosChoiceType.cards;

  /// Whether the [layout] is [AnterosChoiceLayout.list]
  bool get isListLayout => layout == AnterosChoiceLayout.list;

  /// Creates a copy of this [AnterosChoiceConfig] but with
  /// the given fields replaced with the new values.
  AnterosChoiceConfig copyWith({
    AnterosChoiceType? type,
    AnterosChoiceLayout? layout,
    Axis? direction,
    double? spacing,
    double? runSpacing,
    EdgeInsetsGeometry? padding,
    SliverGridDelegate? gridDelegate,
    int? gridCount,
    double? gridSpacing,
    bool? useDivider,
    Color? dividerColor,
    double? dividerSpacing,
    double? dividerThickness,
    Color? overscrollColor,
    AnterosChoiceStyle? style,
    AnterosChoiceStyle? activeStyle,
    ScrollPhysics? physics,
    int? pageLimit,
    Duration? delay,
  }) {
    return AnterosChoiceConfig(
      type: type ?? this.type,
      layout: layout ?? this.layout,
      direction: direction ?? this.direction,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      padding: padding ?? this.padding,
      gridDelegate: gridDelegate ?? this.gridDelegate,
      gridCount: gridCount ?? this.gridCount,
      gridSpacing: gridSpacing ?? this.gridSpacing,
      useDivider: useDivider ?? this.useDivider,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerSpacing: dividerSpacing ?? this.dividerSpacing,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      overscrollColor: overscrollColor ?? this.overscrollColor,
      style: this.style?.merge(style) ?? style,
      activeStyle: this.activeStyle?.merge(activeStyle) ?? activeStyle,
      physics: physics ?? this.physics,
      pageLimit: pageLimit ?? this.pageLimit,
      delay: delay ?? this.delay,
    );
  }

  /// Creates a copy of this [AnterosChoiceConfig] but with
  /// the given fields replaced with the new values.
  AnterosChoiceConfig merge(AnterosChoiceConfig? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      type: other.type,
      layout: other.layout,
      direction: other.direction,
      spacing: other.spacing,
      runSpacing: other.runSpacing,
      padding: other.padding,
      gridDelegate: other.gridDelegate,
      gridCount: other.gridCount,
      gridSpacing: other.gridSpacing,
      useDivider: other.useDivider,
      dividerColor: other.dividerColor,
      dividerSpacing: other.dividerSpacing,
      dividerThickness: other.dividerThickness,
      overscrollColor: other.overscrollColor,
      style: other.style,
      activeStyle: other.activeStyle,
      physics: other.physics,
      pageLimit: other.pageLimit,
      delay: other.delay,
    );
  }
}
