import 'package:flutter/material.dart';

/// Custom builder method to create custom buttons by index
typedef AnterosGroupButtonIndexedBuilder = Widget Function(
  bool selected,
  int index,
  BuildContext context,
);

/// Custom builder method to create custom buttons by index
typedef AnterosGroupButtonValueBuilder<T> = Widget Function(
  bool selected,
  T value,
  BuildContext context,
);
