import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/widgets.dart';

abstract class AnterosSheetSizeCalculator {
  final AnterosSnappingSheetContent? sheetData;
  final double maxHeight;

  AnterosSheetSizeCalculator(
    this.sheetData,
    this.maxHeight,
  );

  double? getSheetStartPosition() {
    var sizeBehavior = sheetData!.sizeBehavior;
    if (sizeBehavior is AnterosSheetSizeFill) return 0;
    if (sizeBehavior is AnterosSheetSizeStatic) {
      if (!sizeBehavior.expandOnOverflow) return null;
      if (getVisibleHeight() > sizeBehavior.size) {
        return 0;
      }
    }
    return null;
  }

  double getVisibleHeight();
  double getSheetEndPosition();
  Positioned positionWidget({required Widget child});
}
