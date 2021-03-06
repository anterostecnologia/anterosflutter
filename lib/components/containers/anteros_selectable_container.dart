import 'package:flutter/material.dart';

/// Box that can be tapped.
/// When selected a check Icon appears
class AnterosSelectableContainer extends StatelessWidget {
  /// Background color for the space between the child and the
  /// Defaul value: scaffoldBackgroundColor
  final Color? marginColor;

  /// Background color when container is selected.
  /// Default value : dialogBackgroundColor
  final Color? selectedBackgroundColor;

  /// Background color when container is not selected.
  /// Default value : dialogBackgroundColor
  final Color? unselectedBackgroundColor;

  /// Border color when container is selected.
  /// Default value : primaryColor
  final Color? selectedBorderColor;

  /// Border color when container is not selected.
  /// Default value :primaryColorDark
  final Color? unselectedBorderColor;

  /// Icon's color
  /// Default value : white
  final Color iconColor;

  /// Icon's size
  /// Default value : 16
  final int iconSize;

  /// The child to render inside the container
  final Widget? child;

  /// Border size
  /// Default value : 2 pixels
  final int borderSize;

  /// Callback when container get tapped
  final Function? onPressed;

  /// Callback of type ValueChanged
  final ValueChanged<bool> onValueChanged;

  /// Opacity when container is not selected.
  /// When not 1 it will be animated when tapped.
  /// Default value : 0.5
  final double unselectedOpacity;

  /// Opacity when container is selected.
  /// When not 1 it will be animated when tapped.
  /// Default value : 1
  final double selectedOpacity;

  /// Opacity animation duration in milliseconds.
  /// Default value : 600
  final int opacityAnimationDuration;

  /// Icon to be shown when selected.
  /// Default value : Icons.check
  final IconData icon;

  /// Icon to be shown when unselected.
  /// Default value : geen
  final IconData? unselectedIcon;

  /// Icon position.
  /// Default value : Alignment.topRight
  final Alignment iconAlignment;

  /// Padding of child content
  /// Default value : 0.0
  final double padding;

  /// Elevation
  /// Default value : 0.0
  final double elevation;

  ///Default value : 10.0
  final double borderRadius;

  ///Default not selected
  final bool selected;

  AnterosSelectableContainer(
      {required this.selected,
      this.marginColor,
      this.unselectedBackgroundColor,
      this.selectedBackgroundColor,
      this.selectedBorderColor,
      this.unselectedBorderColor,
      @Deprecated('Use onValueChanged') this.onPressed,
      required this.onValueChanged,
      this.iconSize = 16,
      this.iconColor = Colors.white,
      this.icon = Icons.check,
      this.unselectedIcon,
      this.iconAlignment = Alignment.topRight,
      this.borderSize = 2,
      this.selectedOpacity = 1.0,
      this.unselectedOpacity = 0.5,
      this.opacityAnimationDuration = 600,
      this.padding = 0,
      this.elevation = 0.0,
      this.borderRadius = 10.0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onValueChanged(!selected);
      },
      child: AnimatedOpacity(
        opacity: selected ? selectedOpacity : unselectedOpacity,
        duration: Duration(milliseconds: opacityAnimationDuration),
        child: Material(
          elevation: 0.0,
          child: Material(
            elevation: elevation,
            color: marginColor ?? theme.scaffoldBackgroundColor,
            child: Stack(
              alignment: iconAlignment,
              children: <Widget>[
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(iconSize / 2),
                  padding: EdgeInsets.all(padding),
                  child: child,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: selected
                              ? selectedBorderColor ?? theme.primaryColor
                              : unselectedBorderColor ?? theme.primaryColorDark,
                          width: borderSize.toDouble()),
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: selected
                          ? selectedBackgroundColor ??
                              theme.dialogBackgroundColor
                          : unselectedBackgroundColor ??
                              theme.dialogBackgroundColor),
                ),
                Visibility(
                    visible: !selected && unselectedIcon != null,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          color:
                              unselectedBorderColor ?? theme.primaryColorDark),
                      child: Icon(
                        unselectedIcon,
                        size: iconSize.toDouble(),
                        color: iconColor,
                      ),
                    )),
                Visibility(
                  visible: selected,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,
                        color: selectedBorderColor ?? theme.primaryColor),
                    child: Icon(
                      icon,
                      size: iconSize.toDouble(),
                      color: iconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
