import 'package:flutter/material.dart';

class AnterosGlowNotificationWidget extends StatelessWidget {
  const AnterosGlowNotificationWidget(this.child,
      {this.showGlowLeading = false, this.showGlowTrailing = false});

  /// Whether to show the overscroll glow on the side with negative scroll
  /// offsets.
  final bool showGlowLeading;

  /// Whether to show the overscroll glow on the side with positive scroll
  /// offsets.
  final bool showGlowTrailing;

  //scrollable child
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification, child: child);
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if ((notification.leading && !showGlowLeading) ||
        (!notification.leading && !showGlowTrailing)) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }
}
