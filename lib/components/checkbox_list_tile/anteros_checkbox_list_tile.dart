import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosCheckboxListTile extends StatelessWidget {
  /// [AnterosCheckboxListTile] is a tile with small box at right (as in a checklist)
  /// in which to place a check mark to make a selection with various customization options.
  const AnterosCheckboxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.icon,
    this.description,
    this.listItemTextColor = AnterosColors.DARK,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.size = AnterosSize.MEDIUM,
    this.type = AnterosCheckboxType.basic,
    this.activeBgColor = AnterosColors.PRIMARY,
    this.inactiveBgColor = AnterosColors.WHITE,
    this.activeBorderColor = AnterosColors.WHITE,
    this.inactiveBorderColor = AnterosColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: AnterosColors.WHITE,
    ),
    this.inactiveIcon,
    this.customBgColor = AnterosColors.SUCCESS,
    this.position = AnterosPosition.end,
    this.selected = false,
    this.autofocus = false,
  }) : super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String? titleText;

  ///type of [String] used to pass text, alternative to subTitle property and gets higher priority than subTitle
  final String? subTitleText;

  /// The AnterosListTile's background color. Can be given [Color] or [AnterosColors]
  final Color? color;

  /// If position is start Checkbox will come instead of avatar,
  /// type of [Widget] or [AnterosAvatar] used to create rounded user profile
  final Widget? avatar;

  /// The title to display inside the [AnterosListTile]. see [Text]
  final Widget? title;

  /// The subTitle to display inside the [AnterosListTile]. see [Text]
  final Widget? subTitle;

  /// The description to display inside the [AnterosListTile]. see [Text]
  final Widget? description;

  /// defines the margin of AnterosListTile
  final EdgeInsets margin;

  /// defines the padding of AnterosListTile
  final EdgeInsets padding;

  /// type of [AnterosCheckboxType] which is of four type is basic, sqaure, circular and custom
  final AnterosCheckboxType type;

  /// type of [double] which is AnterosSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// The color for the color of the list item text.
  final Color? listItemTextColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool>? onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// Position allows user to set position of [AnterosCheckbox] based on given [AnterosPosition]
  final AnterosPosition position;

  /// type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  /// If position is end Checkbox will come instead of icon, The icon to display inside the [AnterosListTile]. see [Icon]
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final AnterosCheckbox checkbox = AnterosCheckbox(
        autofocus: autofocus,
        onChanged: onChanged,
        value: value,
        size: size,
        activeBgColor: activeBgColor,
        inactiveIcon: inactiveIcon,
        activeBorderColor: activeBorderColor,
        inactiveBgColor: inactiveBgColor,
        activeIcon: activeIcon,
        inactiveBorderColor: inactiveBorderColor,
        customBgColor: customBgColor,
        // checkColor: checkColor,
        type: type);
    return MergeSemantics(
      child: AnterosListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        onTap: onChanged != null
            ? () {
                onChanged!(!value);
              }
            : null,
        selected: selected,
        avatar: position == AnterosPosition.start ? checkbox : avatar,
        titleText: titleText,
        subTitle: subTitle,
        subTitleText: subTitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        listItemTextColor: listItemTextColor,
        icon: position == AnterosPosition.end ? checkbox : icon,
      ),
    );
  }
}
