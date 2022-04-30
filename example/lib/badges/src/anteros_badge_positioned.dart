import 'package:flutter/widgets.dart';
import 'package:gf_app/badges/anteros_badges.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [AnterosBadgePosition] and [child].
class AnterosBadgePositioned extends StatelessWidget {
  /// This specify a badge position according to [child]
  final AnterosBadgePosition? position;

  /// It is a child that will be displayed according to [position]
  final Widget child;

  /// This creates a new instance of [AnterosBadgePositioned].
  ///
  /// See also:
  /// * [PositionedDirectional]
  const AnterosBadgePositioned({Key? key, this.position, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topRight = AnterosBadgePosition.topEnd();
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
