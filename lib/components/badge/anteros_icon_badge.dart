import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIconBadge extends StatefulWidget {
  /// Create badges of all types, check out [AnterosBadge] for button badges and [AnterosIconBadge] for icon badges.
  const AnterosIconBadge(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 8),
      required this.child,
      required this.counterChild,
      this.position})
      : super(key: key);

  /// child of type [Widget] is used to show icon.
  /// Use [AnterosIconButton] widget for compatibility.
  final Widget child;

  /// widget of type [Widget] is used to show counter to the top right corner of child.
  /// You can use [AnterosBadge] for compatibility.
  final Widget counterChild;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  /// defines the position of [AnterosBadge].
  final AnterosBadgePosition? position;

  @override
  _AnterosIconBadgeState createState() => _AnterosIconBadgeState();
}

class _AnterosIconBadgeState extends State<AnterosIconBadge> {
  @override
  Widget build(BuildContext context) => Container(
      padding: widget.padding,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          widget.child,
          widget.position == null
              ? PositionedDirectional(
                  top: AnterosBadgePosition.topEnd().top,
                  end: AnterosBadgePosition.topEnd().end,
                  child: widget.counterChild,
                )
              : PositionedDirectional(
                  top: widget.position!.top,
                  end: widget.position!.end,
                  bottom: widget.position!.bottom,
                  start: widget.position!.start,
                  child: widget.counterChild,
                )
        ],
      ));
}
