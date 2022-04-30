import 'package:flutter/material.dart';
import 'package:anterosflutter/colors/anteros_social_color.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/types/anteros_social_type.dart';

class AnterosSocialButton extends StatelessWidget {
  /// Create buttons of all types. check out [AnterosIconButton] for icon buttons, and [AnterosBadge] for badges
  const AnterosSocialButton({
    Key? key,
    required this.onPressed,
    required this.type,
    required this.buttonType,
    this.elevation = 0.0,
    this.shape = AnterosButtonShape.standard,
    this.size = AnterosSize.MEDIUM,
    this.blockButton,
    this.fullWidthButton,
    this.onLongPress,
  }) : super(key: key);

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The elevation for the button's [Material] when the button is [enabled] but not pressed.
  final double elevation;

  bool get enabled => onPressed != null;

  /// Button type of AnterosSocialButtonShape i.e, standard, pills, square, shadow, icons
  final AnterosButtonShape shape;

  /// size of [double] or [AnterosSize] i.e, 1.2, small, medium, large etc.
  final double size;

  /// type signify the social icon type [AnterosSocialType] ie, whatsapp, facebook etc.
  final AnterosSocialType type;

  /// type signify the type of social button [AnterosSocialButtonType] ie, solid, outlined etc.
  final AnterosSocialButtonType buttonType;

  /// on true state blockButton gives block size button
  final bool? blockButton;

  /// on true state full width Button gives full width button
  final bool? fullWidthButton;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    String? text;
    Color? color;
    final double imageSize = (size == AnterosSize.LARGE)
        ? 30
        : (size == AnterosSize.MEDIUM)
            ? 25
            : 20;
    switch (type) {
      case AnterosSocialType.whatsapp:
        icon = Image.asset(
          "icons/whatsapp.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.WHATSAPP
              : Colors.white,
        );
        text = 'Whatsapp';
        color = AnterosSocialColors.WHATSAPP;
        break;
      case AnterosSocialType.facebook:
        icon = Image.asset(
          "icons/facebook.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.FACEBOOK
              : Colors.white,
        );
        text = 'Facebook';
        color = AnterosSocialColors.FACEBOOK;
        break;
      case AnterosSocialType.twitter:
        icon = Image.asset(
          "icons/twitter.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.TWITTER
              : Colors.white,
        );
        text = 'Twitter';
        color = AnterosSocialColors.TWITTER;
        break;
      case AnterosSocialType.google:
        icon = Image.asset(
          "icons/google.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.GOOGLE
              : Colors.white,
        );
        text = 'Google';
        color = AnterosSocialColors.GOOGLE;
        break;
      case AnterosSocialType.youtube:
        icon = Image.asset(
          "icons/youtube.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.YOUTUBE
              : Colors.white,
        );
        text = 'Youtube';
        color = AnterosSocialColors.YOUTUBE;
        break;
      case AnterosSocialType.dribble:
        icon = Image.asset(
          "icons/dribble.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.DRIBBLE
              : Colors.white,
        );
        text = 'Dribble';
        color = AnterosSocialColors.DRIBBLE;
        break;
      case AnterosSocialType.linkedin:
        icon = Image.asset(
          "icons/linkedin.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.LINKEDIN
              : Colors.white,
        );
        text = 'Linkedin';
        color = AnterosSocialColors.LINKEDIN;
        break;
      case AnterosSocialType.pinterest:
        icon = Image.asset(
          "icons/pinterest.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.PININTEREST
              : Colors.white,
        );
        text = 'Pinterest';
        color = AnterosSocialColors.PININTEREST;
        break;
      case AnterosSocialType.slack:
        icon = Image.asset(
          "icons/slack.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.SLACK
              : Colors.white,
        );
        text = 'Slack';
        color = AnterosSocialColors.SLACK;
        break;
      case AnterosSocialType.line:
        icon = Image.asset(
          "icons/line.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.LINE
              : Colors.white,
        );
        text = 'Line';
        color = AnterosSocialColors.LINE;
        break;
      case AnterosSocialType.wechat:
        icon = Image.asset(
          "icons/wechat.png",
          height: imageSize,
          width: imageSize,
          color: (buttonType == AnterosSocialButtonType.outline ||
                  buttonType == AnterosSocialButtonType.outline2x ||
                  buttonType == AnterosSocialButtonType.transparent)
              ? AnterosSocialColors.WECHAT
              : Colors.white,
        );
        text = 'WeChat';
        color = AnterosSocialColors.WECHAT;
        break;
    }

    switch (buttonType) {
      case AnterosSocialButtonType.solid:
        return socialButtonSolid(icon, text, color);
      case AnterosSocialButtonType.outline:
        return socialButtonOutlined(icon, text, color);
      case AnterosSocialButtonType.outline2x:
        return socialButtonOutlined2x(icon, text, color);
      case AnterosSocialButtonType.transparent:
        return socialButtonTransparent(icon, text, color);
      case AnterosSocialButtonType.icon:
        return socialButtonIcon(icon, color);
    }
  }

  Widget socialButtonSolid(Widget? icon, String? text, Color color) {
    return AnterosButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: shape,
      size: size,
      text: text,
      blockButton: blockButton,
      fullWidthButton: fullWidthButton,
      onLongPress: onLongPress,
      icon: icon,
      color: color,
    );
  }

  Widget socialButtonOutlined(Widget? icon, String? text, Color color) {
    return AnterosButton(
      onPressed: () {},
      type: AnterosButtonType.outline,
      shape: shape,
      size: size,
      text: text,
      blockButton: blockButton,
      fullWidthButton: fullWidthButton,
      onLongPress: onLongPress,
      icon: icon,
      color: color,
      boxShadow: const BoxShadow(
        color: Colors.black,
        blurRadius: 10.0, // soften the shadow
        spreadRadius: 7.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 5 Vertically
        ),
      ),
    );
  }

  Widget socialButtonOutlined2x(Widget icon, String text, Color color) {
    return AnterosButton(
      onPressed: () {},
      type: AnterosButtonType.outline2x,
      shape: shape,
      size: size,
      text: text,
      blockButton: blockButton,
      fullWidthButton: fullWidthButton,
      onLongPress: onLongPress,
      icon: icon,
      color: color,
      boxShadow: const BoxShadow(
        color: Colors.black,
        blurRadius: 10.0, // soften the shadow
        spreadRadius: 7.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 5 Vertically
        ),
      ),
    );
  }

  Widget socialButtonTransparent(Widget icon, String text, Color color) {
    return AnterosButton(
      onPressed: () {},
      type: AnterosButtonType.transparent,
      shape: shape,
      size: size,
      text: text,
      blockButton: blockButton,
      fullWidthButton: fullWidthButton,
      onLongPress: onLongPress,
      icon: icon,
      color: color,
      boxShadow: const BoxShadow(
        color: Colors.black,
        blurRadius: 10.0, // soften the shadow
        spreadRadius: 7.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 5 Vertically
        ),
      ),
    );
  }

  Widget socialButtonIcon(Widget? icon, Color color) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: shape == AnterosButtonShape.pills
            ? BorderRadius.circular(50.0)
            : BorderRadius.circular(0.0),
      ),
      elevation: elevation,
      child: AnterosIconButton(
        onPressed: () {},
        icon: icon!,
        color: color,
        size: size,
        type: AnterosButtonType.solid,
        shape: shape == AnterosButtonShape.standard
            ? AnterosIconButtonShape.standard
            : shape == AnterosButtonShape.pills
                ? AnterosIconButtonShape.circle
                : AnterosIconButtonShape.square,
      ),
    );
  }
}
