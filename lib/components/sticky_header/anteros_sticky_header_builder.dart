import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

typedef StickyHeaderWidgetBuilder = Widget Function(
  BuildContext context,
  double stuckValue,
);

class AnterosStickyHeaderBuilder extends StatefulWidget {
  /// Place this widget inside a [ListView], [GridView], [CustomScrollView], [SingleChildScrollView] or similar.
  /// Constructs a new [AnterosStickyHeaderBuilder] widget.
  const AnterosStickyHeaderBuilder({
    Key? key,
    required this.stickyContentBuilder,
    required this.content,
    this.direction = Axis.vertical,
    this.enableHeaderOverlap = false,
    this.callback,
    this.stickyContentPosition = AnterosPosition.start,
  }) : super(key: key);

  /// builder widget can be used to define [stickyContentBuilder].
  final StickyHeaderWidgetBuilder stickyContentBuilder;

  /// widget can be used to define [content].
  final Widget content;

  /// On state true, the [stickyContentBuilder] will overlap the [content].
  /// Only works when direction is [Axis.vertical]. Default set to false.
  final bool enableHeaderOverlap;

  /// [AnterosPosition] allows to [stickyContentPosition] to stick at top in [Axis.vertical] and stick at start in [Axis.horizontal]
  /// Defaults to [AnterosPosition.start]
  final AnterosPosition stickyContentPosition;

  /// Allows to add custom stickyHeader stuck offset value
  final RenderGFStickyHeaderCallback? callback;

  ///  [direction] allows children to align in vertical / horizontal way
  ///  Defaults to [Axis.vertical]
  final Axis direction;

  @override
  _AnterosStickyHeaderBuilderState createState() =>
      _AnterosStickyHeaderBuilderState();
}

class _AnterosStickyHeaderBuilderState
    extends State<AnterosStickyHeaderBuilder> {
  double? _stuckValue;

  @override
  Widget build(BuildContext context) => AnterosStickyHeader(
        enableHeaderOverlap: widget.enableHeaderOverlap,
        direction: widget.direction,
        stickyContentPosition: widget.stickyContentPosition,
        stickyContent: LayoutBuilder(
          builder: (context, _) =>
              widget.stickyContentBuilder(context, _stuckValue ?? 0.0),
        ),
        content: widget.content,
        callback: (double stuckValue) {
          if (_stuckValue != stuckValue) {
            _stuckValue = stuckValue;
            WidgetsBinding.instance?.endOfFrame.then((_) {
              if (mounted) {
                setState(() {});
              }
            });
          }
        },
      );
}
