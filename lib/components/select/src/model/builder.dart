import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
// import '../state/filter.dart';
import '../widget.dart';
import 'choice_item.dart';
import 'group_data.dart';

/// A common widget builder
typedef Widget AnterosWidgetBuilder<T>(
  BuildContext context,
  T value,
);

/// A common list of widget builder
typedef List<Widget> AnterosListWidgetBuilder<T>(
  BuildContext context,
  T value,
);

/// A complex builder
typedef Widget AnterosComplexWidgetBuilder<A, B>(
  BuildContext context,
  A value,
  B anotherValue,
);

/// A builder for choice list item widget
typedef Widget? AnterosChoiceListBuilder<T>(AnterosChoice<T> choice);

/// collection of builder
@immutable
class AnterosBuilder<T> with Diagnosticable {
  /// Builder for custom divider widget between choices item
  final IndexedWidgetBuilder? choiceDivider;

  // /// Builder for progress indicator on choice load
  // final WidgetBuilder choiceProgressBuilder;

  // /// Builder for progress indicator on choice load
  // final AnterosChoiceBuilder<T> choicePagerBuilder;

  /// default constructor
  const AnterosBuilder({
    this.choiceDivider,
    // this.choiceProgressBuilder,
    // this.choicePagerBuilder,
  });
}

/// Builder collection of single choice widget
class AnterosSingleBuilder<T> extends AnterosBuilder<T> {
  /// Builder for custom tile widget
  final AnterosWidgetBuilder<AnterosSingleState<T>>? tile;

  /// Builder for custom modal widget
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modal;

  /// Builder for custom modal header widget
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalHeader;

  /// Builder for modal filter
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalFilter;

  /// Builder for modal filter toggle
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalFilterToggle;

  /// Builder for custom modal actions widget
  final AnterosListWidgetBuilder<AnterosSingleState<T>>? modalActions;

  /// Builder for modal confirm action widget
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalConfirm;

  /// Builder for divider widget between header, body, and footer modal
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalDivider;

  /// Builder for modal footer widget
  final AnterosWidgetBuilder<AnterosSingleState<T>>? modalFooter;

  /// A widget builder for custom choices group
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosGroup<T>>?
      group;

  /// A widget builder for custom header choices group
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosGroup<T>>?
      groupHeader;

  /// Builder for each custom choices item
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
      choice;

  /// Builder for each custom choices item subtitle
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
      choiceTitle;

  /// Builder for each custom choices item subtitle
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
      choiceSubtitle;

  /// Builder for each custom choices item secondary
  final AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
      choiceSecondary;

  /// Builder for custom empty display
  final AnterosWidgetBuilder<AnterosSingleState<T>>? choiceEmpty;

  /// default contructor
  const AnterosSingleBuilder({
    this.tile,
    this.modal,
    this.modalHeader,
    this.modalActions,
    this.modalFilter,
    this.modalFilterToggle,
    this.modalConfirm,
    this.modalDivider,
    this.modalFooter,
    this.group,
    this.groupHeader,
    this.choice,
    this.choiceTitle,
    this.choiceSubtitle,
    this.choiceSecondary,
    this.choiceEmpty,
    IndexedWidgetBuilder? choiceDivider,
    // WidgetBuilder choiceProgress,
    // AnterosChoiceBuilder<T> choicePager,
  }) : super(
          choiceDivider: choiceDivider,
          // choiceProgressBuilder: choiceProgressBuilder,
          // choicePagerBuilder: choicePagerBuilder,
        );

  /// Creates a copy of this [AnterosSingleBuilder] but with
  /// the given fields replaced with the new values.
  AnterosSingleBuilder<T> copyWith({
    AnterosWidgetBuilder<AnterosSingleState<T>>? tile,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modal,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalHeader,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalFilter,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalFilterToggle,
    AnterosListWidgetBuilder<AnterosSingleState<T>>? modalActions,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalConfirm,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalDivider,
    AnterosWidgetBuilder<AnterosSingleState<T>>? modalFooter,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosGroup<T>>? group,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosGroup<T>>?
        groupHeader,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
        choice,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
        choiceTitle,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
        choiceSubtitle,
    AnterosComplexWidgetBuilder<AnterosSingleState<T>, AnterosChoice<T>>?
        choiceSecondary,
    AnterosWidgetBuilder<AnterosSingleState<T>>? choiceEmpty,
    IndexedWidgetBuilder? choiceDivider,
    // WidgetBuilder choiceProgress,
    // AnterosChoiceBuilder<T> choicePager,
  }) {
    return AnterosSingleBuilder<T>(
      tile: tile ?? this.tile,
      modal: modal ?? this.modal,
      modalHeader: modalHeader ?? this.modalHeader,
      modalActions: modalActions ?? this.modalActions,
      modalFilter: modalFilter ?? this.modalFilter,
      modalFilterToggle: modalFilterToggle ?? this.modalFilterToggle,
      modalConfirm: modalConfirm ?? this.modalConfirm,
      modalDivider: modalDivider ?? this.modalDivider,
      modalFooter: modalFooter ?? this.modalFooter,
      group: group ?? this.group,
      groupHeader: groupHeader ?? this.groupHeader,
      choice: choice ?? this.choice,
      choiceTitle: choiceTitle ?? this.choiceTitle,
      choiceSubtitle: choiceSubtitle ?? this.choiceSubtitle,
      choiceSecondary: choiceSecondary ?? this.choiceSecondary,
      choiceEmpty: choiceEmpty ?? this.choiceEmpty,
      choiceDivider: choiceDivider ?? this.choiceDivider,
      // choiceProgressBuilder: choiceProgressBuilder ?? this.choiceProgressBuilder,
      // choicePagerBuilder: choicePagerBuilder ?? this.choicePagerBuilder,
    );
  }

  /// Creates a copy of this [AnterosSingleBuilder] but with
  /// the given fields replaced with the new values.
  AnterosSingleBuilder<T> merge(AnterosSingleBuilder<T>? other) {
    // if null return current object
    if (other == null) return this;

    return AnterosSingleBuilder<T>(
      tile: other.tile,
      modal: other.modal,
      modalHeader: other.modalHeader,
      modalActions: other.modalActions,
      modalFilter: other.modalFilter,
      modalFilterToggle: other.modalFilterToggle,
      modalConfirm: other.modalConfirm,
      modalDivider: other.modalDivider,
      modalFooter: other.modalFooter,
      group: other.group,
      groupHeader: other.groupHeader,
      choice: other.choice,
      choiceTitle: other.choiceTitle,
      choiceSubtitle: other.choiceSubtitle,
      choiceSecondary: other.choiceSecondary,
      choiceEmpty: other.choiceEmpty,
      choiceDivider: other.choiceDivider,
      // choiceProgressBuilder: other.choiceProgressBuilder,
      // choicePagerBuilder: other.choicePagerBuilder,
    );
  }
}

/// Builder collection of multiple choice widget
class AnterosMultiBuilder<T> extends AnterosBuilder<T> {
  /// Builder for custom tile widget
  final AnterosWidgetBuilder<AnterosMultiState<T>>? tile;

  /// Builder for custom modal widget
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modal;

  /// Builder for custom modal header widget
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalHeader;

  /// Builder for modal filter
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalFilter;

  /// Builder for modal filter toggle
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalFilterToggle;

  /// Builder for custom modal actions widget
  final AnterosListWidgetBuilder<AnterosMultiState<T>>? modalActions;

  /// Builder for custom modal confirm action widget
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalConfirm;

  /// Builder for divider widget between header, body, and footer modal
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalDivider;

  /// Builder for custom modal footer widget
  final AnterosWidgetBuilder<AnterosMultiState<T>>? modalFooter;

  /// A widget builder for custom choices group
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosGroup<T>>?
      group;

  /// A widget builder for custom header choices group
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosGroup<T>>?
      groupHeader;

  /// Builder for each custom choices item
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
      choice;

  /// Builder for each custom choices item subtitle
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
      choiceTitle;

  /// Builder for each custom choices item subtitle
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
      choiceSubtitle;

  /// Builder for each custom choices item secondary
  final AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
      choiceSecondary;

  /// Builder for custom empty display
  final AnterosWidgetBuilder<AnterosMultiState<T>>? choiceEmpty;

  /// default constructor
  const AnterosMultiBuilder({
    this.tile,
    this.modal,
    this.modalHeader,
    this.modalFilter,
    this.modalFilterToggle,
    this.modalActions,
    this.modalConfirm,
    this.modalDivider,
    this.modalFooter,
    this.group,
    this.groupHeader,
    this.choice,
    this.choiceTitle,
    this.choiceSubtitle,
    this.choiceSecondary,
    this.choiceEmpty,
    IndexedWidgetBuilder? choiceDivider,
    // WidgetBuilder choiceProgress,
    // AnterosChoiceBuilder<T> choicePager,
  }) : super(
          choiceDivider: choiceDivider,
          // choiceProgressBuilder: choiceProgressBuilder,
          // choicePagerBuilder: choicePagerBuilder,
        );

  /// Creates a copy of this [AnterosMultiBuilder] but with
  /// the given fields replaced with the new values.
  AnterosMultiBuilder<T> copyWith({
    AnterosWidgetBuilder<AnterosMultiState<T>>? tile,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modal,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalHeader,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalFilter,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalFilterToggle,
    AnterosListWidgetBuilder<AnterosMultiState<T>>? modalActions,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalConfirm,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalDivider,
    AnterosWidgetBuilder<AnterosMultiState<T>>? modalFooter,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosGroup<T>>? group,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosGroup<T>>?
        groupHeader,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>? choice,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
        choiceTitle,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
        choiceSubtitle,
    AnterosComplexWidgetBuilder<AnterosMultiState<T>, AnterosChoice<T>>?
        choiceSecondary,
    AnterosWidgetBuilder<AnterosMultiState<T>>? choiceEmpty,
    IndexedWidgetBuilder? choiceDivider,
    // WidgetBuilder choiceProgress,
    // AnterosChoiceBuilder<T> choicePager,
  }) {
    return AnterosMultiBuilder<T>(
      tile: tile ?? this.tile,
      modal: modal ?? this.modal,
      modalHeader: modalHeader ?? this.modalHeader,
      modalActions: modalActions ?? this.modalActions,
      modalConfirm: modalConfirm ?? this.modalConfirm,
      modalDivider: modalDivider ?? this.modalDivider,
      modalFooter: modalFooter ?? this.modalFooter,
      modalFilter: modalFilter ?? this.modalFilter,
      modalFilterToggle: modalFilterToggle ?? this.modalFilterToggle,
      group: group ?? this.group,
      groupHeader: groupHeader ?? this.groupHeader,
      choice: choice ?? this.choice,
      choiceTitle: choiceTitle ?? this.choiceTitle,
      choiceSubtitle: choiceSubtitle ?? this.choiceSubtitle,
      choiceSecondary: choiceSecondary ?? this.choiceSecondary,
      choiceEmpty: choiceEmpty ?? this.choiceEmpty,
      choiceDivider: choiceDivider ?? this.choiceDivider,
      // choiceProgressBuilder: choiceProgressBuilder ?? this.choiceProgressBuilder,
      // choicePagerBuilder: choicePagerBuilder ?? this.choicePagerBuilder,
    );
  }

  /// Creates a copy of this [AnterosMultiBuilder] but with
  /// the given fields replaced with the new values.
  AnterosMultiBuilder<T> merge(AnterosMultiBuilder<T>? other) {
    // if null return current object
    if (other == null) return this;

    return AnterosMultiBuilder<T>(
      tile: other.tile,
      modal: other.modal,
      modalHeader: other.modalHeader,
      modalFilter: other.modalFilter,
      modalFilterToggle: other.modalFilterToggle,
      modalActions: other.modalActions,
      modalConfirm: other.modalConfirm,
      modalDivider: other.modalDivider,
      modalFooter: other.modalFooter,
      group: other.group,
      groupHeader: other.groupHeader,
      choice: other.choice,
      choiceTitle: other.choiceTitle,
      choiceSubtitle: other.choiceSubtitle,
      choiceSecondary: other.choiceSecondary,
      choiceEmpty: other.choiceEmpty,
      choiceDivider: other.choiceDivider,
      // choiceProgressBuilder: other.choiceProgressBuilder,
      // choicePagerBuilder: other.choicePagerBuilder,
    );
  }
}

// /// Builder collection of multiple choice widget
// class AnterosBuilders<T> {

//   /// Builder for custom tile widget
//   final AnterosWidgetBuilder<AnterosState<T>> tile;

//   /// Builder for custom modal widget
//   final AnterosWidgetBuilder<AnterosState<T>> modal;

//   /// Builder for custom modal header widget
//   final AnterosWidgetBuilder<AnterosState<T>> modalHeader;

//   /// Builder for custom modal actions widget
//   final AnterosListWidgetBuilder<AnterosState<T>> modalActions;

//   /// Builder for custom modal confirm action widget
//   final AnterosWidgetBuilder<AnterosState<T>> modalConfirm;

//   /// Builder for divider widget between header, body, and footer modal
//   final AnterosWidgetBuilder<AnterosState<T>> modalDivider;

//   /// Builder for custom modal footer widget
//   final AnterosWidgetBuilder<AnterosState<T>> modalFooter;

//   /// Builder for modal filter
//   final AnterosWidgetBuilder<AnterosState<T>> modalFilter;

//   /// Builder for modal filter toggle
//   final AnterosWidgetBuilder<AnterosState<T>> modalFilterToggle;

//   /// A widget builder for custom choices group
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosGroup<T>> group;

//   /// A widget builder for custom header choices group
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosGroup<T>> groupHeader;

//   /// Builder for each custom choices item
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choice;

//   /// Builder for each custom choices item subtitle
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceTitle;

//   /// Builder for each custom choices item subtitle
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceSubtitle;

//   /// Builder for each custom choices item secondary
//   final AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceSecondary;

//   /// Builder for custom empty display
//   final AnterosWidgetBuilder<AnterosState<T>> choiceEmpty;

//   /// Builder for custom divider widget between choices item
//   final IndexedWidgetBuilder choiceDivider;

//   /// default constructor
//   const AnterosBuilders({
//     this.tile,
//     this.modal,
//     this.modalHeader,
//     this.modalActions,
//     this.modalConfirm,
//     this.modalDivider,
//     this.modalFooter,
//     this.modalFilter,
//     this.modalFilterToggle,
//     this.group,
//     this.groupHeader,
//     this.choice,
//     this.choiceTitle,
//     this.choiceSubtitle,
//     this.choiceSecondary,
//     this.choiceEmpty,
//     this.choiceDivider,
//   });

//   /// Creates a copy of this [AnterosBuilders] but with
//   /// the given fields replaced with the new values.
//   AnterosBuilders<T> copyWith({
//     AnterosWidgetBuilder<AnterosState<T>> tile,
//     AnterosWidgetBuilder<AnterosState<T>> modal,
//     AnterosWidgetBuilder<AnterosState<T>> modalHeader,
//     AnterosListWidgetBuilder<AnterosState<T>> modalActions,
//     AnterosWidgetBuilder<AnterosState<T>> modalConfirm,
//     AnterosWidgetBuilder<AnterosState<T>> modalDivider,
//     AnterosWidgetBuilder<AnterosState<T>> modalFooter,
//     AnterosWidgetBuilder<AnterosFilter> modalFilter,
//     AnterosWidgetBuilder<AnterosFilter> modalFilterToggle,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosGroup<T>> group,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosGroup<T>> groupHeader,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choice,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceTitle,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceSubtitle,
//     AnterosComplexWidgetBuilder<AnterosState<T>, AnterosChoice<T>> choiceSecondary,
//     AnterosWidgetBuilder<AnterosState<T>> choiceEmpty,
//     IndexedWidgetBuilder choiceDivider,
//   }) {
//     return AnterosBuilders<T>(
//       tile: tile ?? this.tile,
//       modal: modal ?? this.modal,
//       modalHeader: modalHeader ?? this.modalHeader,
//       modalActions: modalActions ?? this.modalActions,
//       modalConfirm: modalConfirm ?? this.modalConfirm,
//       modalDivider: modalDivider ?? this.modalDivider,
//       modalFooter: modalFooter ?? this.modalFooter,
//       modalFilter: modalFilter ?? this.modalFilter,
//       modalFilterToggle: modalFilterToggle ?? this.modalFilterToggle,
//       group: group ?? this.group,
//       groupHeader: groupHeader ?? this.groupHeader,
//       choice: choice ?? this.choice,
//       choiceTitle: choiceTitle ?? this.choiceTitle,
//       choiceSubtitle: choiceSubtitle ?? this.choiceSubtitle,
//       choiceSecondary: choiceSecondary ?? this.choiceSecondary,
//       choiceEmpty: choiceEmpty ?? this.choiceEmpty,
//       choiceDivider: choiceDivider ?? this.choiceDivider,
//     );
//   }

//   /// Creates a copy of this [AnterosBuilders] but with
//   /// the given fields replaced with the new values.
//   AnterosBuilders<T> merge(AnterosBuilders<T> other) {
//     // if null return current object
//     if (other == null) return this;

//     return AnterosBuilders<T>(
//       tile: other.tile,
//       modal: other.modal,
//       modalHeader: other.modalHeader,
//       modalActions: other.modalActions,
//       modalConfirm: other.modalConfirm,
//       modalDivider: other.modalDivider,
//       modalFooter: other.modalFooter,
//       modalFilter: other.modalFilter,
//       modalFilterToggle: other.modalFilterToggle,
//       group: other.group,
//       groupHeader: other.groupHeader,
//       choice: other.choice,
//       choiceTitle: other.choiceTitle,
//       choiceSubtitle: other.choiceSubtitle,
//       choiceSecondary: other.choiceSecondary,
//       choiceEmpty: other.choiceEmpty,
//       choiceDivider: other.choiceDivider,
//     );
//   }
// }
