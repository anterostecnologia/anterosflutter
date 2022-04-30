/// [AnterosBadgePosition] is used to position the badges to top start, top bottom,
/// bottom start or bottom end of the icon button
/// See GFIconBadge

class AnterosBadgePosition {
  const AnterosBadgePosition({this.top, this.end, this.bottom, this.start});

  factory AnterosBadgePosition.topStart(
          {double top = -5, double start = -10}) =>
      AnterosBadgePosition(top: top, start: start);

  factory AnterosBadgePosition.topEnd({double top = -8, double end = -10}) =>
      AnterosBadgePosition(top: top, end: end);

  factory AnterosBadgePosition.bottomEnd(
          {double bottom = -8, double end = -10}) =>
      AnterosBadgePosition(bottom: bottom, end: end);

  factory AnterosBadgePosition.bottomStart(
          {double bottom = -8, double start = -10}) =>
      AnterosBadgePosition(bottom: bottom, start: start);

  /// defines the position of badge
  final double? top;

  /// defines the position of badge
  final double? end;

  /// defines the position of badge
  final double? start;

  /// defines the position of badge
  final double? bottom;
}
