import 'dart:async';

import 'package:anterosflutter/anterosflutter.dart';
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
    Color confirmBtnColor = Colors.green,

    /// Color for cancel button
    Color cancelBtnColor = AnterosColors.DANGER,

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Dialog Border Radius
    double borderRadius = 10.0,

    /// Cor de fundo do cabeçalho
    Color backgroundColor = const Color(0xFF515C6F),

    /// Flare asset path
    String? flareAsset,

    /// Flare animation name
    String flareAnimationName = 'play',

    /// Asset path of your lottie file
    String? lottieAsset,

    /// Width of the dialog
    double? width,

    /// Determina quanto tempo a caixa de diálogo permanece aberta antes de fechar
    /// [default] é nulo
    /// Quando for nulo, não será automático
    Duration? autoCloseDuration,

    /// Determina se os loops de animação ou não
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
      cancelBtnColor: cancelBtnColor,
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
