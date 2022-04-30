import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosRadioListTile<T> extends StatelessWidget {
  /// [AnterosRadioListTile] is a list title of with [AnterosRadio] in it.
  const AnterosRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = AnterosSize.SMALL,
    this.type = AnterosRadioType.basic,
    this.radioColor = AnterosColors.SUCCESS,
    this.activeBgColor = AnterosColors.WHITE,
    this.inactiveBgColor = AnterosColors.WHITE,
    this.activeBorderColor = AnterosColors.DARK,
    this.inactiveBorderColor = AnterosColors.DARK,
    this.position = AnterosPosition.end,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: AnterosColors.DARK,
    ),
    this.inactiveIcon,
    this.customBgColor = AnterosColors.SUCCESS,
    this.autofocus = false,
    this.focusNode,
    this.toggleable = false,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
  }) : super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String? titleText;

  ///type of [String] used to pass text, alternative to subTitle property and gets higher priority than subTitle
  final String? subTitleText;

  /// The AnterosListTile's background color. Can be given [Color] or [AnterosColors]
  final Color? color;

  /// If position is start Checkbox will come instead of avatar, type of [Widget] or [AnterosAvatar] used to create rounded user profile
  final Widget? avatar;

  /// The title to display inside the [AnterosListTile]. see [Text]
  final Widget? title;

  /// The subTitle to display inside the [AnterosListTile]. see [Text]
  final Widget? subTitle;

  /// The description to display inside the [AnterosListTile]. see [Text]
  final Widget? description;

  /// If position is end Checkbox will come instead of icon, The icon to display inside the [AnterosListTile]. see [Icon]
  final Widget? icon;

  /// defines the margin of AnterosListTile
  final EdgeInsets margin;

  /// defines the padding of AnterosListTile
  final EdgeInsets padding;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback? onTap;

  /// Position allows user to set position of [AnterosCheckbox] based on given [AnterosPosition]
  final AnterosPosition position;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback? onLongPress;

  /// If this tile is also [enabled] then icons and text are rendered with the same color.
  ///
  /// By default the selected color is the theme's primary color. The selected color
  /// can be overridden with a [ListTileTheme].
  final bool selected;

  /// The color for the tile's [Material] when it has the input focus.
  final Color? focusColor;

  /// The color for the tile's [Material] when a pointer is hovering over it.
  final Color? hoverColor;

  /// on true state this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused
  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// type of [AnterosRadioType] which is of four type is basic, sqaure, circular and custom
  final AnterosRadioType type;

  /// type of [double] which is AnterosSize ie, small, medium and large and can use any double value
  final double size;

  /// type pf [Color] used to change the checkcolor when the checkbox is active
  final Color radioColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<dynamic>? onChanged;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons. Radio button is considered selected if its [value] matches the [groupValue].
  final T groupValue;

  /// sets the radio value
  final bool toggleable;

  /// Whether this radio button is checked. To control this value, set [value] and [groupValue] appropriately.
  bool get checked => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final AnterosRadio radio = AnterosRadio(
      onChanged: onChanged,
      value: value,
      groupValue: groupValue,
      size: size,
      type: type,
      radioColor: radioColor,
      activeBgColor: activeBgColor,
      inactiveIcon: inactiveIcon,
      activeBorderColor: activeBorderColor,
      inactiveBgColor: inactiveBgColor,
      activeIcon: activeIcon,
      inactiveBorderColor: inactiveBorderColor,
      customBgColor: customBgColor,
      toggleable: toggleable,
    );
    return MergeSemantics(
      child: AnterosListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        focusNode: focusNode,
        onTap: onChanged != null
            ? () {
                if (toggleable && checked) {
                  onChanged!(null);
                  return;
                }
                if (!checked) {
                  onChanged!(value);
                }
              }
            : null,
        selected: selected,
        avatar: position == AnterosPosition.start ? radio : avatar,
        titleText: titleText,
        subTitle: subTitle,
        subTitleText: subTitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        icon: position == AnterosPosition.end ? radio : icon,
      ),
    );
  }
}
