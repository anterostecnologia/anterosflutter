import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosButton extends StatefulWidget {
  /// Cria botões de todos os tipos. confira [AnterosIconButton] para botões de ícone e [AnterosAdvancedBadge] para emblemas
  const AnterosButton({
    Key? key,
    required this.onPressed,
    this.onHighlightChanged,
    this.textStyle,
    this.boxShadow,
    this.buttonBoxShadow,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 0.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 1.0,
    this.disabledElevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.constraints,
    this.borderShape,
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    MaterialTapTargetSize? materialTapTargetSize,
    this.child,
    this.type = AnterosButtonType.solid,
    this.shape = AnterosButtonShape.standard,
    this.color = AnterosColors.PRIMARY,
    this.textColor,
    this.position = AnterosPosition.start,
    this.size = AnterosSize.MEDIUM,
    this.borderSide,
    this.text,
    this.icon,
    this.blockButton,
    this.fullWidthButton,
    this.width,
    this.colorScheme,
    this.enableFeedback,
    this.onLongPress,
    this.disabledColor,
    this.disabledTextColor,
  })  : materialTapTargetSize =
            materialTapTargetSize ?? MaterialTapTargetSize.padded,
        // assert(elevation != null && elevation >= 0.0),
        assert(focusElevation >= 0.0),
        assert(hoverElevation >= 0.0),
        assert(highlightElevation >= 0.0),
        assert(disabledElevation >= 0.0),
        super(key: key);

  /// Chamado quando o botão é tocado ou ativado de outra forma.
  final VoidCallback? onPressed;

  /// Chamado pelo retorno de chamada InkWell.onHighlightChanged do widget [InkWell] subjacente.
  final ValueChanged<bool>? onHighlightChanged;

  /// Define o estilo de texto padrão, com [Material.textStyle], para o [filho] do botão.
  final TextStyle? textStyle;

  /// O lado da borda do [Material] do botão.
  final BorderSide? borderSide;

  /// A sombra da caixa para o [Material] do botão, se AnterosButtonType for sólido
  final BoxShadow? boxShadow;

  /// Passe [AnterosColors] ou [Color]. A cor do [Material] do botão quando ele tem o foco de entrada.
  final Color? focusColor;

  /// Passe [AnterosColors] ou [Color]. A cor do [Material] do botão quando um ponteiro passa sobre ele.
  final Color? hoverColor;

  /// Passe [AnterosColors] ou [Color]. A cor de realce do botão [InkWell].
  final Color? highlightColor;

  /// Passe [AnterosColors] ou [Color]. A cor inicial do botão [InkWell].
  final Color? splashColor;

  /// A elevação do [Material] do botão quando o botão está [habilitado] mas não pressionado.
  final double elevation;

  /// A elevação do [Material] do botão quando o botão está [habilitado] e um ponteiro está pairando sobre ele.
  final double hoverElevation;

  /// A elevação do [Material] do botão quando o botão está [habilitado] e tem o foco de entrada.
  final double focusElevation;

  /// A elevação do [Material] do botão quando o botão está [habilitado] e pressionado.
  final double highlightElevation;

  /// A elevação do [Material] do botão quando o botão não está [habilitado].
  final double disabledElevation;

  /// O preenchimento interno para o [filho] do botão.
  final EdgeInsetsGeometry padding;

  /// Define o tamanho do botão.
  final BoxConstraints? constraints;

  /// A forma do [Material] do botão.
  final ShapeBorder? borderShape;

  /// Define a duração das alterações animadas para [forma] e [elevação].
  final Duration animationDuration;

  /// Normalmente o rótulo do botão.
  final Widget? child;

  /// Se o botão está habilitado ou desabilitado.
  bool get enabled => onPressed != null;

  /// Configura o tamanho mínimo do alvo de toque.
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// Tipo de botão de [AnterosButtonType] ou seja, sólido, contorno, contorno2x, transparente
  final AnterosButtonType type;

  /// Tipo de botão de [AnterosButtonShape] ou seja, padrão, pílulas, quadrado, sombra, ícones
  final AnterosButtonShape shape;

  /// Passe [AnterosColors] ou [Color]
  final Color color;

  /// A cor de preenchimento do botão quando o botão está desabilitado.
  ///
  /// O valor padrão desta cor é a cor desabilitada do tema,
  /// [ThemeData.disabledColor].
  ///
  /// Veja também:
  ///
  /// * [color] - a cor de preenchimento do botão quando o botão está [habilitado].
  final Color? disabledColor;

  /// Passe [AnterosColors] ou [Color]
  final Color? textColor;

  /// A cor a ser usada para o texto deste botão quando o botão está desabilitado.
  ///
  /// O [Material.textStyle] do botão será o botão do tema atual
  /// estilo de texto, [ThemeData.textTheme.button], configurado com esta cor.
  ///
  /// O valor padrão é a cor desabilitada do tema,
  /// [ThemeData.disabledColor].
  ///
  /// Se [textColor] for um [MaterialStateProperty<Color>], [disabledTextColor]
  /// será ignorado.
  ///
  /// Veja também:
  ///
  /// * [textColor] - A cor a ser usada para o texto deste botão quando o botão estiver [habilitado].
  final Color? disabledTextColor;

  /// tamanho de [double] ou [AnterosSize], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// o texto do tipo [String] é alternativo ao filho. o texto terá prioridade sobre o filho
  final String? text;

  /// ícone do tipo [Widget]
  final Widget? icon;

  /// tipo de ícone de [AnterosPosition] ou seja, início, fim
  final AnterosPosition position;

  /// no estado verdadeiro blockButton fornece o botão de tamanho do bloco
  final bool? blockButton;

  /// no estado verdadeiro O botão de largura total fornece o botão de largura total
  final bool? fullWidthButton;

  /// no estado verdadeiro, a sombra da caixa padrão aparece ao redor do botão, se AnterosButtonType for sólido
  final bool? buttonBoxShadow;

  /// Tamanho do botão informado
  final double? width;

  /// Um ​​conjunto de treze cores que podem ser usadas para derivar o tema do botão
  /// cores.
  ///
  /// Esta propriedade foi adicionada muito depois do conjunto de itens altamente
  /// cores específicas, como [ThemeData.highlightColor],
  /// [ThemeData.splashColor] etc.
  ///
  /// As cores para novas classes de botões podem ser definidas exclusivamente em termos
  /// de [colorScheme]. Quando for possível, os botões existentes serão
  /// (continuar) migrar gradualmente para ele.
  final ColorScheme? colorScheme;

  /// Se os gestos detectados devem fornecer feedback acústico e/ou tátil.
  ///
  /// Por exemplo, no Android um toque produzirá um som de clique e um
  /// o pressionamento longo produzirá uma vibração curta, quando o feedback estiver ativado.
  ///
  /// Veja também:
  ///
  /// * [Feedback] para fornecer feedback específico da plataforma para determinadas ações.
  final bool? enableFeedback;

  /// Chamado quando o botão é pressionado longamente.
  ///
  /// Se este retorno de chamada e [onPressed] forem nulos, o botão será desabilitado.
  ///
  /// Veja também:
  ///
  /// * [enabled], o que é verdade se o botão estiver habilitado.
  final VoidCallback? onLongPress;

  @override
  _AnterosButtonState createState() => _AnterosButtonState();
}

class _AnterosButtonState extends State<AnterosButton> {
  late Color color;
  Color? textColor;
  Color? disabledColor;
  Color? disabledTextColor;
  Widget? child;
  Widget? icon;
  Function? onPressed;
  late AnterosButtonType type;
  late AnterosButtonShape shape;
  late double size;
  late AnterosPosition position;
  late BoxShadow boxShadow;

  final Set<MaterialState> _states = <MaterialState>{};

  @override
  void initState() {
    color = widget.color;
    textColor = widget.textColor;
    child = widget.text != null ? Text(widget.text!) : widget.child;
    icon = widget.icon;
    onPressed = widget.onPressed;
    type = widget.type;
    shape = widget.shape;
    size = widget.size;
    position = widget.position;
    disabledColor = widget.disabledColor;
    disabledTextColor = widget.disabledTextColor;
    _updateState(
      MaterialState.disabled,
      !widget.enabled,
    );
    super.initState();
  }

  bool get _hovered => _states.contains(MaterialState.hovered);
  bool get _focused => _states.contains(MaterialState.focused);
  bool get _pressed => _states.contains(MaterialState.pressed);
  bool get _disabled => _states.contains(MaterialState.disabled);

  double? buttonWidth() {
    double? buttonWidth = 0;
    if (widget.blockButton == true) {
      buttonWidth = MediaQuery.of(context).size.width * 0.88;
    } else if (widget.fullWidthButton == true) {
      buttonWidth = MediaQuery.of(context).size.width;
    } else {
      buttonWidth = widget.width;
    }
    return buttonWidth;
  }

  void _updateState(MaterialState state, bool value) {
    value ? _states.add(state) : _states.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (_pressed != value) {
      setState(() {
        _updateState(MaterialState.pressed, value);
        if (widget.onHighlightChanged != null) {
          widget.onHighlightChanged!(value);
        }
      });
    }
  }

  void _handleHoveredChanged(bool value) {
    if (_hovered != value) {
      setState(() {
        _updateState(MaterialState.hovered, value);
      });
    }
  }

  void _handleFocusedChanged(bool value) {
    if (_focused != value) {
      setState(() {
        _updateState(MaterialState.focused, value);
      });
    }
  }

  @override
  void didUpdateWidget(AnterosButton oldWidget) {
    _updateState(MaterialState.disabled, !widget.enabled);
    // Se o botão estiver desabilitado enquanto um gesto de pressionar estiver em andamento,
    // InkWell faz uma chamada para handleHighlightChanged. Isso causa uma exceção
    // porque chama setState no meio de uma compilação. Para antecipar isso, nós
    // atualiza manualmente pressionado para false quando esta situação ocorre.
    if (_disabled && _pressed) {
      _handleHighlightChanged(false);
    }
    color = widget.color;
    textColor = widget.textColor;
    child = widget.text != null ? Text(widget.text!) : widget.child;
    icon = widget.icon;
    onPressed = widget.onPressed;
    type = widget.type;
    shape = widget.shape;
    size = widget.size;
    position = widget.position;
    disabledColor = widget.disabledColor;
    disabledTextColor = widget.disabledTextColor;
    _updateState(
      MaterialState.disabled,
      !widget.enabled,
    );
    super.didUpdateWidget(oldWidget);
  }

  double get _effectiveElevation {
    // Essas condicionais estão em ordem de precedência, então tenha cuidado com
    // reorganizando-os.
    if (_disabled) {
      return widget.disabledElevation;
    }
    if (_pressed) {
      return widget.highlightElevation;
    }
    if (_hovered) {
      return widget.hoverElevation;
    }
    if (_focused) {
      return widget.focusElevation;
    }
    return widget.elevation;
  }

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorderType;

    Color getBorderColor() {
      if (widget.enabled) {
        final Color fillColor = color;
        return fillColor;
      } else {
        if (disabledColor != null) {
          return disabledColor!;
        } else {
          return color.withOpacity(0.48);
        }
      }
    }

    Color getDisabledFillColor() {
      if (widget.type == AnterosButtonType.transparent ||
          widget.type == AnterosButtonType.outline ||
          widget.type == AnterosButtonType.outline2x) {
        return Colors.transparent;
      }
      if (disabledColor != null) {
        return disabledColor!;
      } else {
        return color.withOpacity(0.48);
      }
    }

    Color getColor() {
      if (widget.type == AnterosButtonType.transparent ||
          widget.type == AnterosButtonType.outline ||
          widget.type == AnterosButtonType.outline2x) {
        return Colors.transparent;
      }
      final Color fillColor = color;
      return fillColor;
    }

    Color getDisabledTextColor() {
      if (disabledTextColor != null) {
        return disabledTextColor!;
      } else if (widget.type == AnterosButtonType.outline ||
          widget.type == AnterosButtonType.outline2x ||
          widget.type == AnterosButtonType.transparent) {
        return color;
      } else {
        return AnterosColors.DARK;
      }
    }

    Color getTextColor() {
      if (widget.type == AnterosButtonType.outline ||
          widget.type == AnterosButtonType.outline2x ||
          widget.type == AnterosButtonType.transparent) {
        return widget.enabled
            ? textColor == null
                ? color == AnterosColors.TRANSPARENT
                    ? AnterosColors.DARK
                    : color
                : textColor!
            : getDisabledTextColor();
      }
      if (textColor == null) {
        if (color == AnterosColors.TRANSPARENT) {
          return AnterosColors.DARK;
        } else {
          return AnterosColors.WHITE;
        }
      } else {
        return textColor!;
      }
    }

    final Color? effectiveTextColor = MaterialStateProperty.resolveAs<Color?>(
        widget.textStyle?.color, _states);
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

    Size minSize;
    switch (widget.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        minSize = const Size(48, 48);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
      default:
        minSize = Size.zero;
        break;
    }

    final BorderSide shapeBorder = widget.type == AnterosButtonType.outline ||
            widget.type == AnterosButtonType.outline2x
        ? outlineBorder
        : widget.borderSide ??
            BorderSide(
              color: getBorderColor(),
              width: 0,
            );

    if (shape == AnterosButtonShape.pills) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
        side: shapeBorder,
      );
    } else if (shape == AnterosButtonShape.square) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: shapeBorder,
      );
    } else if (shape == AnterosButtonShape.standard) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: shapeBorder,
      );
    } else if (shape == AnterosButtonShape.rounded_square) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: shapeBorder,
      );
    } else {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: shapeBorder,
      );
    }

    BoxDecoration? getBoxShadow() {
      if (widget.type != AnterosButtonType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
            color: widget.type == AnterosButtonType.transparent ||
                    widget.type == AnterosButtonType.outline ||
                    widget.type == AnterosButtonType.outline2x
                ? Colors.transparent
                : color,
            borderRadius: widget.shape == AnterosButtonShape.pills
                ? BorderRadius.circular(50)
                : widget.shape == AnterosButtonShape.standard
                    ? BorderRadius.circular(5)
                    : BorderRadius.zero,
            boxShadow: [
              widget.boxShadow == null && widget.buttonBoxShadow == true
                  ? BoxShadow(
                      color: themeColor,
                      blurRadius: 1.5,
                      spreadRadius: 2,
                      offset: Offset.zero,
                    )
                  : widget.boxShadow != null
                      ? widget.boxShadow!
                      : BoxShadow(
                          color: Theme.of(context).canvasColor,
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset.zero,
                        ),
            ],
          );
        }
      }
      return null;
    }

    TextStyle getTextStyle() {
      if (widget.size == AnterosSize.SMALL) {
        return TextStyle(
          color: widget.enabled ? getTextColor() : getDisabledTextColor(),
          fontSize: 12,
        );
      } else if (widget.size == AnterosSize.MEDIUM) {
        return TextStyle(
          color: widget.enabled ? getTextColor() : getDisabledTextColor(),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        );
      } else if (widget.size == AnterosSize.LARGE) {
        return TextStyle(
          color: widget.enabled ? getTextColor() : getDisabledTextColor(),
          fontSize: Theme.of(context).textTheme.button?.fontSize,
          fontWeight: FontWeight.w500,
        );
      }
      return TextStyle(
        color: widget.enabled ? getTextColor() : getDisabledTextColor(),
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );
    }

    final Widget result = Container(
      constraints: icon == null
          ? const BoxConstraints(minWidth: 80)
          : const BoxConstraints(minWidth: 90),
      decoration:
          widget.type == AnterosButtonType.solid ? getBoxShadow() : null,
      child: Material(
        elevation: _effectiveElevation,
        textStyle: widget.textStyle == null ? getTextStyle() : widget.textStyle,
        shape: widget.type == AnterosButtonType.transparent
            ? null
            : widget.borderShape ?? shapeBorderType,
        color: widget.enabled ? getColor() : getDisabledFillColor(),
        type: MaterialType.button,
        animationDuration: widget.animationDuration,
        clipBehavior: widget.clipBehavior,
        child: InkWell(
          focusNode: widget.focusNode,
          canRequestFocus: widget.enabled,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          onHighlightChanged: _handleHighlightChanged,
          onHover: _handleHoveredChanged,
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          enableFeedback: widget.enableFeedback,
          splashColor: widget.splashColor,
          highlightColor: widget.highlightColor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          customBorder: widget.type == AnterosButtonType.transparent
              ? null
              : widget.borderShape ?? shapeBorderType,
          child: IconTheme.merge(
            data: IconThemeData(color: effectiveTextColor),
            child: Container(
              height: size,
              width: buttonWidth(),
              padding: widget.padding,
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: icon != null &&
                        child != null &&
                        (position == AnterosPosition.start)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          icon!,
                          const SizedBox(width: 8),
                          child!
                        ],
                      )
                    : icon != null &&
                            child != null &&
                            (position == AnterosPosition.end)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              child!,
                              const SizedBox(width: 8),
                              icon!
                            ],
                          )
                        : child,
              ),
            ),
          ),
        ),
      ),
    );

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          child: result,
        ),
      ),
    );
  }
}

/// Um ​​widget para preencher a área ao redor do [Material] interno de um [MaterialButton].
///
/// Redireciona os toques que ocorrem na área acolchoada ao redor da criança para o centro
/// da criança. Isso aumenta o tamanho do botão e o tamanho do botão
/// "tap target", mas não seu material ou seus respingos de tinta.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    Key? key,
    Widget? child,
    this.minSize,
  }) : super(
          key: key,
          child: child,
        );

  final Size? minSize;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderInputPadding(minSize);

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox? child]) : super(child);

  Size? get minSize => _minSize;
  Size? _minSize;

  set minSize(Size? value) {
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null && minSize != null) {
      return math.max(child!.getMinIntrinsicWidth(height), minSize!.width);
    }
    return 0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null && minSize != null) {
      return math.max(child!.getMinIntrinsicHeight(width), minSize!.height);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null && minSize != null) {
      return math.max(child!.getMaxIntrinsicWidth(height), minSize!.width);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null && minSize != null) {
      return math.max(child!.getMaxIntrinsicHeight(width), minSize!.height);
    }
    return 0;
  }

  @override
  void performLayout() {
    if (child != null && minSize != null) {
      child!.layout(constraints, parentUsesSize: true);
      // ignore: avoid_as
      final BoxParentData childParentData = child!.parentData as BoxParentData;
      final double height = math.max(child!.size.width, minSize!.width);
      final double width = math.max(child!.size.height, minSize!.height);
      size = constraints.constrain(Size(height, width));
      childParentData.offset =
          // ignore: avoid_as
          Alignment.center.alongOffset(size - child!.size as Offset);
    } else {
      size = Size.zero;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }

    if (child != null) {
      final Offset center = child!.size.center(Offset.zero);
      return result.addWithRawTransform(
        transform: MatrixUtils.forceToPoint(center),
        position: center,
        hitTest: (BoxHitTestResult result, Offset position) {
          assert(position == center);
          return child!.hitTest(
            result,
            position: center,
          );
        },
      );
    }

    throw Exception('child property cannot be null');
  }
}
