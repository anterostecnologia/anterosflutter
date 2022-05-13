import 'dart:async';

import 'package:flutter/material.dart';

import 'src/models/cool_alert_options.dart';
import 'src/utils/animate.dart';
import 'src/widgets/cool_alert_container.dart';

enum AnterosCoolAlertType {
  success,
  error,
  warning,
  confirm,
  info,
  loading,
  custom
}
enum AnterosCoolAlertAnimType {
  scale,
  rotate,
  slideInDown,
  slideInUp,
  slideInLeft,
  slideInRight,
}

/// AnterosCoolAlert.
class AnterosCoolAlert {
  static Future show({
    /// BuildContext
    required BuildContext context,

    /// Title of the dialog
    String? title,

    /// Text of the dialog
    String? text,

    /// Custom Widget of the dialog
    Widget? widget,

    // Alert type [success, error, warning, confirm, info, loading, custom]
    required AnterosCoolAlertType type,

    // Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    AnterosCoolAlertAnimType animType = AnterosCoolAlertAnimType.scale,

    /// Barrier Dissmisable
    bool barrierDismissible = true,

    // Triggered when confirm button is tapped
    VoidCallback? onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    VoidCallback? onCancelBtnTap,

    /// Confirmation button text
    String confirmBtnText = 'Ok',

    /// Cancel button text
    String cancelBtnText = 'Cancel',

    /// Color for confirm button
    Color confirmBtnColor = const Color(0xFF3085D6),

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Dialog Border Radius
    double borderRadius = 10.0,

    /// Header background color
    Color backgroundColor = const Color(0xFF515C6F),

    /// Flare asset path
    String? flareAsset,

    /// Flare animation name
    String flareAnimationName = 'play',

    /// Asset path of your lottie file
    String? lottieAsset,

    /// Width of the dialog
    double? width,

    /// Determines how long the dialog stays open for before closing
    /// [default] is null
    /// When it is null, it won't autoclose
    Duration? autoCloseDuration,

    /// Detemines if the animation loops or not
    bool loopAnimation = false,
  }) {
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration, () {
        var navigator = Navigator.of(context, rootNavigator: true);
        if (navigator != null) {
          if (navigator.canPop()) {
            navigator.pop();
          }
        }
      });
    }

    final options = AnterosCoolAlertOptions(
      title: title,
      text: text,
      widget: widget,
      type: type,
      animType: animType,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      confirmBtnText: confirmBtnText,
      cancelBtnText: cancelBtnText,
      confirmBtnColor: confirmBtnColor,
      confirmBtnTextStyle: confirmBtnTextStyle,
      cancelBtnTextStyle: cancelBtnTextStyle,
      showCancelBtn: showCancelBtn,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      flareAsset: flareAsset,
      flareAnimationName: flareAnimationName,
      lottieAsset: lottieAsset,
      width: width,
      loopAnimation: loopAnimation,
    );

    final child = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: AnterosCoolAlertContainer(
        options: options,
      ),
    );

    return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, anim1, __, widget) {
        switch (animType) {
          case AnterosCoolAlertAnimType.scale:
            return Animate.scale(child: child, animation: anim1);

          case AnterosCoolAlertAnimType.rotate:
            return Animate.rotate(child: child, animation: anim1);

          case AnterosCoolAlertAnimType.slideInDown:
            return Animate.slideInDown(child: child, animation: anim1);

          case AnterosCoolAlertAnimType.slideInUp:
            return Animate.slideInUp(child: child, animation: anim1);

          case AnterosCoolAlertAnimType.slideInLeft:
            return Animate.slideInLeft(child: child, animation: anim1);

          case AnterosCoolAlertAnimType.slideInRight:
            return Animate.slideInRight(child: child, animation: anim1);

          default:
            return child;
        }
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible:
          autoCloseDuration != null ? false : barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, _, __) => Container(),
    );
  }
}
