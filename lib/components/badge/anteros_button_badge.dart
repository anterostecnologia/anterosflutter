import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosButtonBadge extends StatefulWidget {
  /// Cria crachás crachás de todos os tipos. confira [AnterosIconButton] para emblemas de ícone e [AnterosAdvancedBadge] para emblemas
  const AnterosButtonBadge({
    Key? key,
    required this.onPressed,
    this.onHighlightChanged,
    this.textStyle,
    this.boxShadow,
    this.badgeBoxShadow,
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
    this.type = AnterosButtonType.solid,
    this.shape = AnterosButtonShape.standard,
    this.color = AnterosColors.PRIMARY,
    this.textColor,
    this.position = AnterosPosition.end,
    this.size = AnterosSize.MEDIUM,
    this.borderSide,
    this.text,
    this.blockButton,
    this.fullWidthButton,
    this.colorScheme,
    this.enableFeedback,
    this.onLongPress,
    this.disabledColor,
    this.disabledTextColor,
    this.icon,
  })  : materialTapTargetSize =
            materialTapTargetSize ?? MaterialTapTargetSize.padded,
        //  assert(elevation != null && elevation >= 0.0),
        assert(focusElevation >= 0.0),
        assert(hoverElevation >= 0.0),
        assert(highlightElevation >= 0.0),
        assert(disabledElevation >= 0.0),
        super(
          key: key,
        );

  /// Chamado quando o botão é tocado ou ativado de outra forma.
  final VoidCallback? onPressed;

  /// Chamado pelo retorno de chamada InkWell.onHighlightChanged do widget [InkWell] subjacente.
  final ValueChanged<bool>? onHighlightChanged;

  /// Define o estilo de texto padrão, com [Material.textStyle], para o filho do botão.
  final TextStyle? textStyle;

  /// O lado da borda do [Material] do emblema.
  final BorderSide? borderSide;

  /// A sombra da caixa para o [Material] do emblema.
  final BoxShadow? boxShadow;

  /// Passe [AnterosColors] ou [Color]. A cor do [Material] do crachá quando ele tem o foco de entrada.
  final Color? focusColor;

  /// Passe [AnterosColors] ou [Color]. A cor do [Material] do emblema quando um ponteiro passa sobre ele.
  final Color? hoverColor;

  /// Passe [AnterosColors] ou [Color]. A cor de destaque para o [InkWell] do emblema.
  final Color? highlightColor;

  /// Passe [AnterosColors] ou [Color]. A cor inicial do [InkWell] do emblema.
  final Color? splashColor;

  /// A elevação do [Material] do emblema quando o emblema está [ativado], mas não pressionado.
  final double elevation;

  /// A elevação do [Material] do emblema quando o emblema está [habilitado] e um ponteiro está sobre ele.
  final double hoverElevation;

  /// A elevação do [Material] do emblema quando o emblema está [habilitado] e tem o foco de entrada.
  final double focusElevation;

  /// A elevação do [Material] do crachá quando o crachá está [habilitado] e pressionado.
  final double highlightElevation;

  /// A elevação do [Material] do emblema quando o emblema não está [ativado].
  final double disabledElevation;

  /// O preenchimento interno para o filho do emblema.
  final EdgeInsetsGeometry padding;

  /// Define o tamanho do emblema.
  final BoxConstraints? constraints;

  /// A forma do [Material] do emblema.
  final ShapeBorder? borderShape;

  /// Define a duração das alterações animadas para [forma] e [elevação].
  final Duration animationDuration;

  /// Se o emblema está ativado ou desativado.
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

  /// Tipo de botão de AnterosButtonBadgeShape, ou seja, padrão, pílulas, quadrado, sombra, ícones
  final AnterosButtonShape shape;

  /// Passe [AnterosColors] ou [Color]
  final Color color;

  /// A cor de preenchimento do emblema quando o emblema está desabilitado.
  ///
  /// O valor padrão desta cor é a cor desabilitada do tema,
  /// [ThemeData.disabledColor].
  ///
  /// Veja também:
  ///
  /// * [color] - a cor de preenchimento do emblema quando o emblema está [ativado].
  final Color? disabledColor;

  /// Passe [AnterosColors] ou [Color]
  final Color? textColor;

  /// A cor a ser usada para o texto deste selo quando o selo estiver desabilitado.
  ///
  /// O [Material.textStyle] do emblema será o emblema do tema atual
  /// estilo de texto, [ThemeData.textTheme.badge], configurado com esta cor.
  ///
  /// O valor padrão é a cor desabilitada do tema,
  /// [ThemeData.disabledColor].
  ///
  /// Se [textColor] for um [MaterialStateProperty<Color>], [disabledTextColor]
  /// será ignorado.
  ///
  /// Veja também:
  ///
  /// * [textColor] - A cor a ser usada para o texto deste emblema quando o emblema estiver [ativado].
  final Color? disabledTextColor;

  /// tamanho de [double] ou [AnterosSize], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// o texto do tipo [String] é alternativo ao filho. o texto terá prioridade sobre o filho
  final String? text;

  /// tipo de ícone de [AnterosPosition] ou seja, início, fim
  final AnterosPosition position;

  /// no estado verdadeiro, blockButton fornece o emblema do tamanho do bloco
  final bool? blockButton;

  /// no estado verdadeiro O botão de largura total fornece um emblema de largura total
  final bool? fullWidthButton;

  /// no estado verdadeiro, a sombra da caixa padrão aparece ao redor do emblema, se AnterosButtonType for sólido
  final bool? badgeBoxShadow;

  /// Um ​​conjunto de treze cores que podem ser usadas para derivar o tema do emblema
  /// cores.
  ///
  /// Esta propriedade foi adicionada muito depois do conjunto de itens altamente
  /// cores específicas, como ThemeData.badgeColor, [ThemeData.highlightColor],
  /// [ThemeData.splashColor] etc.
  ///
  /// As cores para novas classes de emblemas podem ser definidas exclusivamente em termos
  /// de [colorScheme]. Quando for possível, os emblemas existentes serão
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

  /// Chamado quando o emblema é pressionado por muito tempo.
  ///
  /// Se este retorno de chamada e [onPressed] forem nulos, o emblema será desabilitado.
  ///
  /// Veja também:
  ///
  /// * [enabled], o que é verdade se o badge estiver habilitado.
  final VoidCallback? onLongPress;

  /// Pode ser usado para exibir AnterosBadge, [Icons] dentro do design do crachá
  final Widget? icon;

  @override
  _AnterosButtonBadgeState createState() => _AnterosButtonBadgeState();
}

class _AnterosButtonBadgeState extends State<AnterosButtonBadge> {
  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 26,
          minWidth: 98,
        ),
        child: Container(
          height: widget.size,
          child: AnterosButton(
            onPressed: widget.onPressed,
            onHighlightChanged: widget.onHighlightChanged,
            textStyle: widget.textStyle,
            boxShadow: widget.boxShadow,
            buttonBoxShadow: widget.badgeBoxShadow,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            elevation: widget.elevation,
            focusElevation: widget.focusElevation,
            hoverElevation: widget.hoverElevation,
            highlightElevation: widget.highlightElevation,
            disabledElevation: widget.disabledElevation,
            constraints: widget.constraints,
            borderShape: widget.borderShape,
            animationDuration: widget.animationDuration,
            clipBehavior: widget.clipBehavior,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            type: widget.type,
            shape: widget.shape,
            color: widget.color,
            textColor: widget.textColor,
            position: widget.position,
            size: widget.size,
            borderSide: widget.borderSide,
            text: widget.text,
            icon: widget.icon,
            blockButton: widget.blockButton,
            fullWidthButton: widget.fullWidthButton,
            disabledColor: widget.disabledTextColor,
            disabledTextColor: widget.disabledColor,
          ),
        ),
      );
}
