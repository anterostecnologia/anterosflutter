import 'package:flutter/material.dart';
import 'model/builder.dart';
import 'model/choice_config.dart';
import 'model/choice_theme.dart';
import 'model/choice_item.dart';
import 'chip_theme.dart';

/// Resolve the choice builder based on choice type
class AnterosChoiceResolver<T> {
  /// Whether single or multiple choice
  final bool isMultiChoice;

  /// The choice type
  final AnterosChoiceType? type;

  /// Function to build the title widget
  final Widget? Function(AnterosChoice<T>) titleBuilder;

  /// Function to build the subtitle widget
  final Widget? Function(AnterosChoice<T>) subtitleBuilder;

  /// Function to build the secondary widget
  final Widget? Function(AnterosChoice<T>) secondaryBuilder;

  /// Default constructor
  AnterosChoiceResolver({
    required this.isMultiChoice,
    required this.type,
    required this.titleBuilder,
    required this.secondaryBuilder,
    required this.subtitleBuilder,
  });

  /// Returns the correct builder based on choice type
  AnterosWidgetBuilder<AnterosChoice<T>>? get choiceBuilder {
    return type == AnterosChoiceType.checkboxes
        ? checkboxBuilder
        : type == AnterosChoiceType.switches
            ? switchBuilder
            : type == AnterosChoiceType.chips
                ? chipBuilder
                : type == AnterosChoiceType.radios
                    ? radioBuilder
                    : type == AnterosChoiceType.cards
                        ? cardBuilder
                        : null;
  }

  /// Returns the radio choice widget
  Widget radioBuilder(
    BuildContext context,
    AnterosChoice<T> choice,
  ) =>
      RadioListTile<T>(
        key: ValueKey<T>(choice.value),
        title: titleBuilder(choice),
        subtitle: subtitleBuilder(choice),
        secondary: secondaryBuilder(choice),
        activeColor: choice.activeStyle!.color,
        controlAffinity: ListTileControlAffinity
            .values[choice.effectiveStyle!.control?.index ?? 2],
        onChanged:
            choice.disabled != true ? (val) => choice.select!(true) : null,
        groupValue: choice.selected == true ? choice.value : null,
        value: choice.value,
      );

  /// Returns the switch choice widget
  Widget switchBuilder(
    BuildContext context,
    AnterosChoice<T> choice,
  ) =>
      SwitchListTile(
        key: ValueKey<T>(choice.value),
        title: titleBuilder(choice),
        subtitle: subtitleBuilder(choice),
        secondary: secondaryBuilder(choice),
        activeColor:
            choice.activeStyle!.accentColor ?? choice.activeStyle!.color,
        activeTrackColor: choice.activeStyle!.color?.withAlpha(0x80),
        inactiveThumbColor: choice.style!.accentColor,
        inactiveTrackColor: choice.style!.color?.withAlpha(0x80),
        contentPadding: choice.effectiveStyle!.padding,
        controlAffinity: ListTileControlAffinity
            .values[choice.effectiveStyle!.control?.index ?? 2],
        onChanged: choice.disabled != true
            ? (selected) => choice.select!(selected)
            : null,
        value: choice.selected,
      );

  /// Returns the checkbox choice widget
  Widget checkboxBuilder(
    BuildContext context,
    AnterosChoice<T> choice,
  ) =>
      CheckboxListTile(
        key: ValueKey<T>(choice.value),
        title: titleBuilder(choice),
        subtitle: subtitleBuilder(choice),
        secondary: secondaryBuilder(choice),
        activeColor: choice.activeStyle!.color,
        contentPadding: choice.effectiveStyle!.padding,
        controlAffinity: ListTileControlAffinity
            .values[choice.effectiveStyle!.control?.index ?? 2],
        onChanged: choice.disabled != true
            ? (selected) => choice.select!(selected)
            : null,
        value: choice.selected,
      );

  /// Returns the chip choice widget
  Widget chipBuilder(
    BuildContext context,
    AnterosChoice<T> choice,
  ) {
    final AnterosChoiceStyle effectiveStyle = choice.effectiveStyle!;

    return AnterosChipTheme(
      color: effectiveStyle.color,
      outlined: effectiveStyle.outlined,
      raised: effectiveStyle.raised,
      elevation: effectiveStyle.elevation,
      opacity: effectiveStyle.elevation,
      shape: effectiveStyle.shape,
      labelStyle: effectiveStyle.titleStyle,
      selected: choice.selected,
      child: Padding(
        padding: effectiveStyle.margin ?? const EdgeInsets.all(0),
        child: RawChip(
          key: ValueKey<T>(choice.value),
          padding: effectiveStyle.padding ?? const EdgeInsets.all(4),
          label: titleBuilder(choice) ?? const SizedBox.shrink(),
          avatar: secondaryBuilder(choice),
          clipBehavior: effectiveStyle.clipBehavior ?? Clip.none,
          showCheckmark: effectiveStyle.showCheckmark ?? isMultiChoice,
          isEnabled: choice.disabled != true,
          onSelected: (selected) => choice.select!(selected),
          selected: choice.selected,
        ),
      ),
    );
  }

  /// Returns the card choice widget
  Widget cardBuilder(
    BuildContext context,
    AnterosChoice<T> choice,
  ) {
    final Color backgroundColor = choice.selected
        ? choice.activeStyle!.color ?? Theme.of(context).primaryColor
        : choice.style!.color ?? Theme.of(context).cardColor;
    final Brightness backgroundBrightness =
        ThemeData.estimateBrightnessForColor(backgroundColor);
    final Color defaultTextColor =
        backgroundBrightness == Brightness.dark ? Colors.white : Colors.black;

    return Card(
      elevation: choice.effectiveStyle!.elevation,
      margin: choice.effectiveStyle!.margin ?? const EdgeInsets.all(5),
      color: backgroundColor,
      child: InkWell(
        onTap: () => choice.select!(!choice.selected),
        child: Padding(
          padding: choice.effectiveStyle!.padding ?? const EdgeInsets.all(10),
          child: DefaultTextStyle.merge(
            textAlign: TextAlign.center,
            style: TextStyle(color: defaultTextColor),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                secondaryBuilder(choice),
                SizedBox(height: choice.effectiveStyle!.spacing ?? 10),
                titleBuilder(choice),
              ].whereType<Widget>().toList(),
            ),
          ),
        ),
      ),
    );
  }
}
