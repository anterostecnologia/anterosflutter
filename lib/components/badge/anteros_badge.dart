import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosBadge extends StatefulWidget {
  /// Crie crachás de todos os tipos, confira [AnterosButtonBadge] para crachás de botão e [AnterosIconBadge] para crachás do tipo ícone
  const AnterosBadge({
    Key? key,
    this.textStyle,
    this.borderShape,
    this.shape = AnterosBadgeShape.standard,
    this.color = AnterosColors.DANGER,
    this.textColor = AnterosColors.WHITE,
    this.size = AnterosSize.SMALL,
    this.border,
    this.text,
    this.child,
  }) : super(key: key);

  /// O lado da borda do [Material] do emblema.
  final BorderSide? border;

  /// Normalmente a forma do crachá do contador.
  final ShapeBorder? borderShape;

  /// Tipo de contador de [AnterosBadgeShape] ou seja, padrão, pílulas, quadrado, círculo
  final AnterosBadgeShape shape;

  /// Passe [AnterosColors] ou [Color]
  final Color color;

  /// tamanho de [double] ou [AnterosSize], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// filho do tipo [Widget] é alternativa ao filho. o texto terá prioridade sobre o filho
  final Widget? child;

  /// o texto do tipo [String] é alternativo ao filho. o texto terá prioridade sobre o filho
  final String? text;

  /// estilo de texto do texto do contador.
  final TextStyle? textStyle;

  /// Passe [AnterosColors] ou [Color]
  final Color textColor;

  @override
  _AnterosBadgeState createState() => _AnterosBadgeState();
}

class _AnterosBadgeState extends State<AnterosBadge> {
  late Color color;
  late Color textColor;
  Widget? child;
  AnterosBadgeShape? counterShape;
  late double size;
  double? height;
  double? width;
  double? fontSize;

  @override
  void initState() {
    color = widget.color;
    textColor = widget.textColor;
    child = widget.text != null ? Text(widget.text ?? '') : widget.child;
    counterShape = widget.shape;
    size = widget.size;
    super.initState();
  }

  @override
  void didUpdateWidget(AnterosBadge oldWidget) {
    color = widget.color;
    textColor = widget.textColor;
    child = widget.text != null ? Text(widget.text ?? '') : widget.child;
    counterShape = widget.shape;
    size = widget.size;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide shapeBorder = widget.border != null
        ? widget.border!
        : BorderSide(
            color: color,
            width: 0,
          );

    ShapeBorder shape;

    if (counterShape == AnterosBadgeShape.pills) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: shapeBorder,
      );
    } else if (counterShape == AnterosBadgeShape.square) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: shapeBorder,
      );
    } else if (counterShape == AnterosBadgeShape.standard) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: shapeBorder,
      );
    } else if (counterShape == AnterosAdvancedBadgeShape.circle) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: shapeBorder,
      );
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: shapeBorder,
      );
    }

    if (widget.size == AnterosSize.SMALL) {
      height = size * 0.56;
      width = size * 0.73;
      fontSize = size * 0.31;
    } else if (widget.size == AnterosSize.MEDIUM) {
      height = size * 0.58;
      width = size * 0.76;
      fontSize = size * 0.34;
    } else if (widget.size == AnterosSize.LARGE) {
      height = size * 0.6;
      width = size * 0.79;
      fontSize = size * 0.37;
    } else {
      height = size * 0.58;
      width = size * 0.76;
      fontSize = size * 0.34;
    }

    return Container(
      height: height,
      width: counterShape == AnterosAdvancedBadgeShape.circle ? height : width,
      child: Material(
        textStyle: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
        shape: widget.borderShape ?? shape,
        color: color,
        type: MaterialType.button,
        child: Container(
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: child,
          ),
        ),
      ),
    );
  }
}
