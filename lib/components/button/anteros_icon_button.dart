import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIconButton extends StatefulWidget {
  /// Cria botões de ícones de todos os tipos. confira [AnterosButton] para botões
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

  /// O tamanho do ícone dentro do botão.
  final double iconSize;

  /// O preenchimento ao redor do ícone do botão.
  final EdgeInsetsGeometry padding;

  /// Define como o ícone é posicionado dentro do IconButton.
  final AlignmentGeometry alignment;

  /// O ícone a ser exibido dentro do botão.
  final Widget icon;

  /// A cor do ícone do botão quando ele tem o foco de entrada.
  final Color? focusColor;

  /// A cor do ícone do botão quando um ponteiro está sobre ele.
  final Color? hoverColor;

  /// Tipo de botão de [AnterosButtonType] ou seja, sólido, contorno, contorno2x transparente
  final AnterosButtonType type;

  /// Tipo de botão de [AnterosIconButtonShape] ou seja, padrão, pílulas, quadrado, sombra, ícones
  final AnterosIconButtonShape shape;

  /// Passe [AnterosColors] ou [Color]
  final Color color;

  /// Passe [AnterosColors] ou [Color]. A cor primária do botão quando o botão está no estado para baixo (pressionado).
  final Color? splashColor;

  /// Passe [AnterosColors] ou [Color]. A cor secundária do botão quando o botão está no estado para baixo (pressionado).
  final Color? highlightColor;

  /// Passe [AnterosColors] ou [Color]. A cor a ser usada para o ícone dentro do botão, se o ícone estiver desabilitado.
  final Color? disabledColor;

  /// O retorno de chamada que é chamado quando o botão é tocado ou ativado de outra forma.
  final VoidCallback? onPressed;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Texto que descreve a ação que ocorrerá quando o botão for pressionado.
  final String? tooltip;

  /// A sombra da caixa para o [Material] do botão, se AnterosButtonType for sólido
  final BoxShadow? boxShadow;

  /// A forma e a borda do [Material] do botão.
  final ShapeBorder? borderShape;

  /// tamanho de [double] ou [AnterosSize], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// no estado verdadeiro, a sombra da caixa padrão aparece ao redor do botão, se AnterosButtonType for sólido
  final bool? buttonBoxShadow;

  /// O lado da borda do [Material] do botão.
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
