import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

typedef RatingChangeCallback = void Function(double rating);

class AnterosRating extends StatefulWidget {
  /// [AnterosRating] para mostrar classificações com muitas opções de personalização.
  const AnterosRating({
    Key? key,
    required this.onChanged,
    required this.value,
    this.itemCount = 5,
    this.spacing = 0.0,
    this.defaultIcon,
    this.color,
    this.borderColor,
    this.size = AnterosSize.MEDIUM,
    this.filledIcon,
    this.halfFilledIcon,
    this.allowHalfRating = true,
    this.showTextForm = false,
    this.suffixIcon,
    this.controller,
    this.inputDecorations,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  }) : super(key: key);

  /// define o número total de itens de classificação
  final int itemCount;

  /// define a cor dos itens
  final Color? color;

  /// define a cor da fronteira de [halfFilledIcon]
  final Color? borderColor;

  /// define o tamanho dos itens.Anterossize pode ser usado para variações de tamanho como pequenas.médio.ampla
  final double size;

  /// Se for verdade, permita a metade da classificação dos itens na arrastação.Padrão será em verdadeiro estado
  final bool allowHalfRating;

  /// define os itens quando preenchido
  final Widget? filledIcon;

  /// define os itens quando meio cheio
  final Widget? halfFilledIcon;

  /// Define os itens padrão, ao ter preenchido e Halffilledicon
  final Widget? defaultIcon;

  /// define os itens do Space BestuckValue
  final double spacing;

  /// define o valor de classificação
  final double value;

  /// Retorne a classificação atual sempre que a classificação for atualizada
  final RatingChangeCallback onChanged;

  /// Se verdadeiro, mostra a classificação [TextFormField] Com a barra de classificação, isso permite que a entrada do usuário mostre a classificação
  final bool showTextForm;

  /// define o design e a função da classificação [TextFormField]'Ícone do sufixo s
  final Widget? suffixIcon;

  /// controla o [TextField] Controlador de classificação [TextFormField]
  final TextEditingController? controller;

  /// define o [InputDecoration] de classificação [TextFormField]
  final InputDecoration? inputDecorations;

  /// define a margem de classificação [TextFormField]
  final EdgeInsets margin;

  /// define o preenchimento da classificação [TextFormField]
  final EdgeInsets padding;

  @override
  _AnterosRatingState createState() => _AnterosRatingState();
}

class _AnterosRatingState extends State<AnterosRating> {
  Widget buildRatingBar(BuildContext context, int index) {
    Widget icon;
    if (index >= widget.value) {
      icon = widget.defaultIcon ??
          Icon(
            Icons.star_border,
            color: widget.borderColor ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else if (!widget.showTextForm
        ? index > widget.value - (widget.allowHalfRating ? 0.5 : 1.0) &&
            index < widget.value
        : index + 1 == widget.value + 0.5) {
      icon = widget.halfFilledIcon ??
          Icon(
            Icons.star_half,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else {
      icon = widget.filledIcon ??
          Icon(
            Icons.star,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    }

    return GestureDetector(
      onTap: () {
        widget.onChanged(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        // ignore: avoid_as
        final RenderBox box = context.findRenderObject() as RenderBox;
        final _pos = box.globalToLocal(dragDetails.globalPosition);
        final i = _pos.dx / widget.size;
        var newRating = widget.allowHalfRating ? i : i.round().toDouble();
        if (newRating > widget.itemCount) {
          newRating = widget.itemCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        widget.onChanged(newRating);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) => widget.showTextForm
      ? Column(children: <Widget>[
          Container(
            margin: widget.margin,
            padding: widget.padding,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: widget.inputDecorations ??
                  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating',
                    suffixIcon: widget.suffixIcon,
                  ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: widget.spacing,
              children: List.generate(
                widget.itemCount,
                (index) => buildRatingBar(context, index),
              ),
            ),
          )
        ])
      : Material(
          color: Colors.transparent,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: widget.spacing,
            children: List.generate(
              widget.itemCount,
              (index) => buildRatingBar(context, index),
            ),
          ),
        );
}
