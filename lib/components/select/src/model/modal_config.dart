import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import './modal_theme.dart';

/// Target to open choices list
enum AnterosModalType {
  /// open in full page
  fullPage,

  /// open in popup dialog
  popupDialog,

  /// open in sliding bottom sheet
  bottomSheet,
}

/// Modal configuration
@immutable
class AnterosModalConfig with Diagnosticable {
  /// Modal type to display choices
  final AnterosModalType type;

  /// Use different title with the trigger widget title
  final String? title;

  /// Whether the options list modal use header or not
  final bool useHeader;

  /// Whether the option list need to confirm
  /// to return the changed value
  final bool useConfirm;

  /// custom confirmation icon
  final Icon? confirmIcon;

  /// custom confirmation label
  final Widget? confirmLabel;

  /// custom confirmation color
  final Color? confirmColor;

  /// custom confirmation padding
  final EdgeInsetsGeometry? confirmMargin;

  /// custom confirmation brightness
  final Brightness confirmBrightness;

  /// Whether the option list is filterable or not
  final bool useFilter;

  /// Custom searchbar hint
  final String? filterHint;

  /// Whether the filter is autocomplete or need confirmation
  final bool filterAuto;

  /// The filter autocomplete delay
  final Duration filterDelay;

  /// If [type] is [AnterosModalType.bottomSheet], specifies the max height factor, the value must be between `0` and` 1`
  final double maxHeightFactor;

  /// If [type] is [AnterosModalType.bottomSheet], specifies whether the bottom sheet can be dragged up and down and dismissed by swiping downwards.
  final bool enableDrag;

  /// The [barrierDismissible] argument is used to indicate whether tapping on the
  /// barrier will dismiss the dialog. It is `true` by default and can not be `null`.
  final bool barrierDismissible;

  /// The [barrierColor] argument is used to specify the color of the modal
  /// barrier that darkens everything the dialog. If `null` the default color
  /// `Colors.black54` is used.
  final Color? barrierColor;

  /// Configure modal style
  final AnterosModalStyle style;

  /// Configure modal header style
  final AnterosModalHeaderStyle headerStyle;

  /// Create modal configuration
  const AnterosModalConfig({
    this.type = AnterosModalType.fullPage,
    this.title,
    this.useHeader = true,
    this.useConfirm = false,
    this.confirmIcon,
    this.confirmLabel,
    this.confirmColor,
    this.confirmMargin,
    this.confirmBrightness = Brightness.light,
    this.useFilter = false,
    this.filterAuto = false,
    this.filterDelay = const Duration(milliseconds: 300),
    this.filterHint,
    this.maxHeightFactor = 0.6,
    this.enableDrag = true,
    this.barrierDismissible = true,
    this.barrierColor,
    this.style = const AnterosModalStyle(),
    this.headerStyle = const AnterosModalHeaderStyle(),
  }) : assert(maxHeightFactor > 0 && maxHeightFactor <= 1);

  /// Returns true if the modal type is full page
  bool get isFullPage => type == AnterosModalType.fullPage;

  /// Returns true if the modal type is bottom sheet
  bool get isBottomSheet => type == AnterosModalType.bottomSheet;

  /// Returns true if the modal type is popup dialog
  bool get isPopupDialog => type == AnterosModalType.popupDialog;

  /// Returns true if the confirm button brightness is dark
  bool get confirmIsDark => confirmBrightness == Brightness.dark;

  /// Returns true if the confirm button brightness is light
  bool get confirmIsLight => confirmBrightness == Brightness.light;

  /// Creates a copy of this [AnterosModalConfig] but with
  /// the given fields replaced with the new values.
  AnterosModalConfig copyWith({
    AnterosModalType? type,
    String? title,
    bool? useHeader,
    bool? useConfirm,
    Icon? confirmIcon,
    Widget? confirmLabel,
    Color? confirmColor,
    EdgeInsetsGeometry? confirmMargin,
    Brightness? confirmBrightness,
    bool? useFilter,
    bool? filterAuto,
    Duration? filterDelay,
    String? filterHint,
    double? maxHeightFactor,
    bool? enableDrag,
    bool? barrierDismissible,
    Color? barrierColor,
    AnterosModalStyle? style,
    AnterosModalHeaderStyle? headerStyle,
  }) {
    return AnterosModalConfig(
      type: type ?? this.type,
      title: title ?? this.title,
      useHeader: useHeader ?? this.useHeader,
      useConfirm: useConfirm ?? this.useConfirm,
      confirmIcon: confirmIcon ?? this.confirmIcon,
      confirmLabel: confirmLabel ?? this.confirmLabel,
      confirmColor: confirmColor ?? this.confirmColor,
      confirmMargin: confirmMargin ?? this.confirmMargin,
      confirmBrightness: confirmBrightness ?? this.confirmBrightness,
      useFilter: useFilter ?? this.useFilter,
      filterAuto: filterAuto ?? this.filterAuto,
      filterDelay: filterDelay ?? this.filterDelay,
      filterHint: filterHint ?? this.filterHint,
      maxHeightFactor: maxHeightFactor ?? this.maxHeightFactor,
      enableDrag: enableDrag ?? this.enableDrag,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      barrierColor: barrierColor ?? this.barrierColor,
      style: style == null ? this.style : this.style.merge(style),
      headerStyle: headerStyle == null
          ? this.headerStyle
          : this.headerStyle.merge(headerStyle),
    );
  }

  /// Returns a new [AnterosModalConfig] that is
  /// a combination of this object and the given [other] style.
  AnterosModalConfig merge(AnterosModalConfig? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      type: other.type,
      title: other.title,
      useHeader: other.useHeader,
      useConfirm: other.useConfirm,
      confirmIcon: other.confirmIcon,
      confirmLabel: other.confirmLabel,
      confirmColor: other.confirmColor,
      confirmMargin: other.confirmMargin,
      confirmBrightness: other.confirmBrightness,
      useFilter: other.useFilter,
      filterAuto: other.filterAuto,
      filterDelay: other.filterDelay,
      filterHint: other.filterHint,
      maxHeightFactor: other.maxHeightFactor,
      enableDrag: other.enableDrag,
      barrierDismissible: other.barrierDismissible,
      barrierColor: other.barrierColor,
      style: other.style,
      headerStyle: other.headerStyle,
    );
  }
}
