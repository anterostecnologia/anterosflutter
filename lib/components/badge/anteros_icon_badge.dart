import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIconBadge extends StatefulWidget {
  /// Crie crachás de todos os tipos, confira [AnterosAdvancedBadge] para crachás de botão e [AnterosIconBadge] para crachás de ícone.
  const AnterosIconBadge(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 8),
      required this.child,
      required this.counterChild,
      this.position})
      : super(key: key);

  /// filho do tipo [Widget] é usado para mostrar o ícone.
  /// Use o widget [AnterosIconButton] para compatibilidade.
  final Widget child;

  /// widget do tipo [Widget] é usado para mostrar o contador no canto superior direito do filho.
  /// Você pode usar [AnterosAdvancedBadge] para compatibilidade.
  final Widget counterChild;

  /// O preenchimento interno para o [filho] do emblema.
  final EdgeInsetsGeometry padding;

  /// define a posição de [AnterosAdvancedBadge].
  final AnterosBadgePosition? position;

  @override
  _AnterosIconBadgeState createState() => _AnterosIconBadgeState();
}

class _AnterosIconBadgeState extends State<AnterosIconBadge> {
  @override
  Widget build(BuildContext context) => Container(
      padding: widget.padding,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          widget.child,
          widget.position == null
              ? PositionedDirectional(
                  top: AnterosBadgePosition.topEnd().top,
                  end: AnterosBadgePosition.topEnd().end,
                  child: widget.counterChild,
                )
              : PositionedDirectional(
                  top: widget.position!.top,
                  end: widget.position!.end,
                  bottom: widget.position!.bottom,
                  start: widget.position!.start,
                  child: widget.counterChild,
                )
        ],
      ));
}
