abstract class AnterosSheetSizeBehavior {
  const AnterosSheetSizeBehavior();
}

/// Fills the available hight in a sheet.
class AnterosSheetSizeFill implements AnterosSheetSizeBehavior {
  const AnterosSheetSizeFill();
}

/// Make the sheet have a static height.
class AnterosSheetSizeStatic implements AnterosSheetSizeBehavior {
  /// If true, the sheet expands to the available height when it is greater
  /// than the given [size].
  final bool expandOnOverflow;

  /// The height of the sheet
  final double size;

  AnterosSheetSizeStatic({
    this.expandOnOverflow = true,
    required this.size,
  });
}
