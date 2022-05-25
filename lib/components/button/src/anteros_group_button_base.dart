// ignore_for_file: deprecated_member_use_from_same_package

import 'package:anterosflutter/components/button/src/anteros_group_button_body.dart';
import 'package:anterosflutter/components/button/src/options/options.dart';
import 'package:anterosflutter/components/button/src/utils/controller/controller.dart';
import 'package:anterosflutter/components/button/src/utils/models/models.dart';
import 'package:flutter/material.dart';

class AnterosGroupButton<T> extends StatelessWidget {
  const AnterosGroupButton({
    Key? key,
    required this.buttons,
    this.onSelected,
    this.controller,
    this.options = const AnterosGroupButtonOptions(),
    this.isRadio = true,
    this.buttonIndexedBuilder,
    this.buttonBuilder,
    this.enableDeselect = false,
    this.maxSelected,
  })  : assert(
          maxSelected != null ? maxSelected >= 0 : true,
          'maxSelected must not be negative',
        ),
        assert((buttonBuilder == null && buttonIndexedBuilder == null) ||
            !(buttonBuilder != null && buttonIndexedBuilder != null)),
        super(key: key);

  /// [String] list that will be displayed on buttons in the [AnterosGroupButton]
  final List<T> buttons;

  /// Callback [Function] works by clicking on a group element
  ///
  /// Return int [index] of selected button and [isSelected] if [isRadio] = false
  final Function(T value, int index, bool isSelected)? onSelected;

  /// bool variable for switching between modes [CheckBox] and [Radio]
  ///
  /// if the [isRadio] = true, only one button can be selected
  /// if the [isRadio] = false, you can select several at once
  final bool isRadio;

  /// bool variable for enable radio button to be deselected
  ///
  /// * if the [isRadio] = true :
  /// - if the [enableDeselect] = true , the selected radio button can be deselected
  /// - if the [enableDeselect] = false , the selected radio button can't be deselected
  ///
  /// * if the [isRadio] = false:
  /// - [enableDeselect] have no effect
  final bool? enableDeselect;

  /// int variable for setting max selected buttons for [CheckBox]
  ///
  /// [maxSelected] must not be negative.
  final int? maxSelected;

  /// Controller to making widget logic
  final AnterosGroupButtonController? controller;

  /// UI settings of package
  final AnterosGroupButtonOptions options;

  /// Custom builder method to create
  /// your own custom buttons by button [int] index
  final AnterosGroupButtonIndexedBuilder? buttonIndexedBuilder;

  /// Custom builder method to create
  /// your own custom buttons by button [T] value
  final AnterosGroupButtonValueBuilder<T>? buttonBuilder;

  @override
  Widget build(BuildContext context) {
    return AnterosGroupButtonBody<T>(
      controller: controller,
      buttons: buttons,
      onSelected: onSelected,
      isRadio: isRadio,
      buttonIndexedBuilder: buttonIndexedBuilder,
      buttonBuilder: buttonBuilder,
      enableDeselect: enableDeselect,
      maxSelected: maxSelected,

      /// Options
      direction: options.direction,
      spacing: options.spacing,
      runSpacing: options.runSpacing,
      selectedTextStyle: options.selectedTextStyle,
      unselectedTextStyle: options.unselectedTextStyle,
      selectedColor: options.selectedColor,
      unselectedColor: options.unselectedColor,
      selectedBorderColor: options.selectedBorderColor,
      unselectedBorderColor: options.unselectedBorderColor,
      borderRadius: options.borderRadius,
      selectedShadow: options.selectedShadow,
      unselectedShadow: options.unselectedShadow,
      buttonWidth: options.buttonWidth,
      buttonHeigth: options.buttonHeight,
      mainGroupAlignment: options.mainGroupAlignment,
      crossGroupAlignment: options.crossGroupAlignment,
      groupRunAlignment: options.groupRunAlignment,
      groupingType: options.groupingType,
      textAlign: options.textAlign,
      textPadding: options.textPadding,
      alignment: options.alignment,
      elevation: options.elevation,
    );
  }
}
