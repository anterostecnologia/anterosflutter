import 'package:flutter/material.dart';

class AnterosFloatingNavbarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidget;

  AnterosFloatingNavbarItem({
    this.icon,
    this.title,
    this.customWidget,
  }) : assert(icon != null || customWidget != null);
}
