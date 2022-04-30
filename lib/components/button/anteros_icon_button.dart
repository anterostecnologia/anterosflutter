import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIconButton extends StatefulWidget {
  /// Create icon buttons of all types. check out [AnterosButton] for buttons
  const AnterosIconButton({
    Key? key,
    this.iconSize = 0.0,
    this.padding = const EdgeInsets.all(8),
    this.alignment = Alignment.center,
    required this.icon,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    required this.onPressed,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.type = AnterosButtonType.solid,
    this.shape = AnterosIconButtonShape.standard,
    this.color = AnterosColors.PRIMARY,
    this.borderShape,
    this.boxShadow,
    this.size = AnterosSize.MEDIUM,
    this.buttonBoxShadow,
    this.borderSide,
  }) : super(key: key);

  /// The size of the icon inside the button.
  final double iconSize;

  /// The padding around the button's icon.
  final EdgeInsetsGeometry padding;

  /// Defines how the icon is positioned within the IconButton.
  final AlignmentGeometry alignment;

  /// The icon to display inside the button.
  final Widget icon;

  /// The color for the button's icon when it has the input focus.
  final Color? focusColor;

  /// The color for the button's icon when a pointer is hovering over it.
  final Color? hoverColor;

  /// Button type of [AnterosButtonType] i.e, solid, outline, outline2x transparent
  final AnterosButtonType type;

  /// Button type of [AnterosIconButtonShape] i.e, standard, pills, square, shadow, icons
  final AnterosIconButtonShape shape;

  /// Pass [AnterosColors] or [Color]
  final Color color;

  /// Pass [AnterosColors] or [Color]. The primary color of the button when the button is in the down (pressed) state.
  final Color? splashColor;

  /// Pass [AnterosColors] or [Color]. The secondary color of the button when the button is in the down (pressed) state.
  final Color? highlightColor;

  /// Pass [AnterosColors] or [Color]. The color to use for the icon inside the button, if the icon is disabled.
  final Color? disabledColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Text that describes the action that will occur when the button is pressed.
  final String? tooltip;

  /// The box shadow for the button's [Material], if AnterosButtonType is solid
  final BoxShadow? boxShadow;

  /// The shape and border for the button's [Material].
  final ShapeBorder? borderShape;

  /// size of [double] or [AnterosSize] i.e, 1.2, small, medium, large etc.
  final double size;

  /// on true state default box shadow appears around button, if AnterosButtonType is solid
  final bool? buttonBoxShadow;

  /// The border side for the button's [Material].
  final BorderSide? borderSide;

  @override
  _AnterosIconButtonState createState() => _AnterosIconButtonState();
}

class _AnterosIconButtonState extends State<AnterosIconButton> {
  late Color color;
  Function? onPressed;
  late AnterosButtonType type;
  late AnterosIconButtonShape shape;
  BoxShadow? boxShadow;
  double? height;
  double? width;
  double iconPixel = 18;

  @override
  void initState() {
    color = widget.color;
    onPressed = widget.onPressed;
    type = widget.type;
    shape = widget.shape;
    super.initState();
  }

  Color getBorderColor() {
    if (widget.onPressed != null) {
      return color;
    } else {
      if (widget.disabledColor != null) {
        return widget.disabledColor!;
      } else {
        return color.withOpacity(0.48);
      }
    }
  }

  Color? getDisabledFillColor() {
    if (widget.type == AnterosButtonType.transparent ||
        widget.type == AnterosButtonType.outline ||
        widget.type == AnterosButtonType.outline2x) {
      return Colors.transparent;
    }
    if (widget.disabledColor != null) {
      return widget.disabledColor;
    } else {
      return color.withOpacity(0.48);
    }
  }

  Color? getColor() {
    if (widget.type == AnterosButtonType.transparent ||
        widget.type == AnterosButtonType.outline ||
        widget.type == AnterosButtonType.outline2x) {
      return Colors.transparent;
    } else {
      return color;
    }
  }

  Color? getIconColor() {
    if (widget.type == AnterosButtonType.transparent ||
        widget.type == AnterosButtonType.outline ||
        widget.type == AnterosButtonType.outline2x) {
      return widget.onPressed != null
          ? color == AnterosColors.TRANSPARENT
              ? AnterosColors.DARK
              : color
          : color.withOpacity(0.48);
    } else if (color == AnterosColors.TRANSPARENT) {
      return widget.onPressed != null
          ? AnterosColors.DARK
          : AnterosColors.WHITE;
    } else {
      return AnterosColors.WHITE;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final Color themeColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    final BorderSide outlineBorder = BorderSide(
      color: widget.borderSide == null
          ? getBorderColor()
          : widget.borderSide!.color,
      width: (widget.borderSide?.width == null
          ? widget.type == AnterosButtonType.outline2x
              ? 2.0
              : 1.0
          : widget.borderSide?.width)!,
    );

    final BorderSide shapeBorder = widget.type == AnterosButtonType.outline ||
            widget.type == AnterosButtonType.outline2x
        ? outlineBorder
        : widget.borderSide ??
            BorderSide(
              color: color,
              width: 0,
            );

    ShapeBorder? shapeBorderType;

    if (shape == AnterosIconButtonShape.pills) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: shapeBorder,
      );
    } else if (shape == AnterosIconButtonShape.square) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: shapeBorder,
      );
    } else if (shape == AnterosIconButtonShape.standard) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: shapeBorder,
      );
    } else if (shape == AnterosIconButtonShape.circle) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: shapeBorder,
      );
    }

    if (widget.size == AnterosSize.SMALL) {
      height = 30.0;
      width = 30.0;
      iconPixel = 18.0;
    } else if (widget.size == AnterosSize.MEDIUM) {
      height = 35.0;
      width = 35.0;
      iconPixel = 28.0;
    } else if (widget.size == AnterosSize.LARGE) {
      height = 40.0;
      width = 40.0;
      iconPixel = 38.0;
    }

    Widget result = Container(
      // height: widget.shape == AnterosIconButtonShape.circle ? height + 6.0 : height,
      // width: widget.shape == AnterosIconButtonShape.pills
      //     ? width + 10
      //     : widget.shape == AnterosIconButtonShape.circle
      //         ? height + 6
      //         : width,
      padding: widget.padding,
      child: SizedBox(
        height: widget.iconSize != 0 ? widget.iconSize : iconPixel,
        width: widget.iconSize != 0 ? widget.iconSize : iconPixel,
        child: Align(
          alignment: Alignment.center,
          child: IconTheme.merge(
            data: IconThemeData(
              size: widget.iconSize > 0.0 ? widget.iconSize : iconPixel,
              color: getIconColor(),
            ),
            child: widget.icon,
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      result = Tooltip(
        message: widget.tooltip!,
        child: result,
      );
    }

    BoxDecoration? getBoxShadow() {
      if (widget.type != AnterosButtonType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
              color: widget.onPressed != null
                  ? getColor()
                  : getDisabledFillColor(),
              borderRadius: widget.shape == AnterosIconButtonShape.circle
                  ? BorderRadius.circular(50)
                  : widget.shape == AnterosIconButtonShape.standard
                      ? BorderRadius.circular(3)
                      : widget.shape == AnterosIconButtonShape.pills
                          ? BorderRadius.circular(20)
                          : BorderRadius.zero,
              boxShadow: [
                widget.boxShadow == null && widget.buttonBoxShadow == true
                    ? BoxShadow(
                        color: themeColor,
                        blurRadius: 1.5,
                        spreadRadius: 2,
                        offset: Offset.zero,
                      )
                    : widget.boxShadow ??
                        BoxShadow(
                          color: Theme.of(context).canvasColor,
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset.zero,
                        )
              ]);
        }
      }
      return null;
    }

    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        child: Container(
          // height:
          //     widget.shape == AnterosIconButtonShape.circle ? height + 6 : height,
          // width: widget.shape == AnterosIconButtonShape.pills
          //     ? width + 10
          //     : widget.shape == AnterosIconButtonShape.circle
          //         ? height + 6
          //         : width,
          decoration:
              widget.type == AnterosButtonType.solid ? getBoxShadow() : null,
          child: Material(
            shape: widget.type == AnterosButtonType.transparent
                ? null
                : widget.borderShape ?? shapeBorderType,
            color:
                widget.onPressed != null ? getColor() : getDisabledFillColor(),
            type: widget.type == AnterosButtonType.transparent
                ? MaterialType.transparency
                : MaterialType.button,
            child: InkResponse(
              onTap: widget.onPressed,
              child: result,
              focusColor: widget.focusColor ?? Theme.of(context).focusColor,
              hoverColor: widget.hoverColor ?? Theme.of(context).hoverColor,
              highlightColor:
                  widget.highlightColor ?? Theme.of(context).highlightColor,
              splashColor: widget.splashColor ?? Theme.of(context).splashColor,
              radius: math.max(
                  Material.defaultSplashRadius,
                  (widget.iconSize > 0.0
                          ? widget.iconSize
                          : iconPixel +
                              math.min(
                                widget.padding.horizontal,
                                widget.padding.vertical,
                              )) *
                      0.7),
            ),
          ),
        ),
      ),
    );
  }
}
