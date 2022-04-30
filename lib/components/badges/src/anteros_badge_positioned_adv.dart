import 'package:anterosflutter/components/badges/src/anteros_badge_position_adv.dart';
import 'package:flutter/widgets.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [AnterosAdvancedBadgeBadgePosition] and [child].
class AnterosAdvancedBadgePositioned extends StatelessWidget {
  /// This specify a badge position according to [child]
  final AnterosAdvancedBadgePosition? position;

  /// It is a child that will be displayed according to [position]
  final Widget child;

  /// This creates a new instance of [AnterosAdvancedBadgePositioned].
  ///
  /// See also:
  /// * [PositionedDirectional]
  const AnterosAdvancedBadgePositioned(
      {Key? key, this.position, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topRight = AnterosAdvancedBadgePosition.topEnd();
      return PositionedDirectional(
        top: topRight.top,
        end: topRight.end,
        child: child,
      );
    }

    if (position.isCenter) {
      return Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      );
    }

    return PositionedDirectional(
      top: position.top,
      end: position.end,
      bottom: position.bottom,
      start: position.start,
      child: child,
    );
  }
}
