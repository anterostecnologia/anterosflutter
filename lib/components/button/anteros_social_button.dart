import 'package:flutter/material.dart';
import 'package:anterosflutter/colors/anteros_social_color.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/types/anteros_social_type.dart';

class AnterosSocialButton extends StatelessWidget {
  /// Cria botões de todos os tipos. confira [AnterosIconButton] para botões de ícone e [AnterosAdvancedBadge] para emblemas
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

  /// Chamado quando o botão é tocado ou ativado de outra forma.
  final VoidCallback? onPressed;

  /// A elevação do [Material] do botão quando o botão está [habilitado] mas não pressionado.
  final double elevation;

  bool get enabled => onPressed != null;

  /// Tipo de botão de AnterosSocialButtonShape ou seja, padrão, pílulas, quadrado, sombra, ícones
  final AnterosButtonShape shape;

  /// tamanho de [double] ou [AnterosSize], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// tipo significa o tipo de ícone social [AnterosSocialType] ou seja, whatsapp, facebook etc.
  final AnterosSocialType type;

  /// tipo significa o tipo de botão social [AnterosSocialButtonType] ou seja, sólido, delineado etc.
  final AnterosSocialButtonType buttonType;

  /// no estado verdadeiro blockButton fornece o botão de tamanho do bloco
  final bool? blockButton;

  /// no estado verdadeiro O botão de largura total fornece o botão de largura total
  final bool? fullWidthButton;

  /// Chamado quando o botão é pressionado longamente.
  ///
  /// Se este retorno de chamada e [onPressed] forem nulos, o botão será desabilitado.
  ///
  /// Veja também:
  ///
  /// * [enabled], o que é verdade se o botão estiver habilitado.
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
        blurRadius: 10.0, //suaviza a sombra
        spreadRadius: 7.0, //estende a sombra
        offset: Offset(
          5.0, // Move para a direita 10 horizontalmente
          5.0, // Move para baixo 5 Verticalmente
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
        blurRadius: 10.0, //suaviza a sombra
        spreadRadius: 7.0, //estende a sombra
        offset: Offset(
          5.0, // Move para a direita 10 horizontalmente
          5.0, // Move para baixo 5 Verticalmente
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
        blurRadius: 10.0, //suaviza a sombra
        spreadRadius: 7.0, //estende a sombra
        offset: Offset(
          5.0, // Move para a direita 10 horizontalmente
          5.0, // Move para baixo 5 Verticalmente
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
