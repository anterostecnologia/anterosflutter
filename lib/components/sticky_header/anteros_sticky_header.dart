import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosStickyHeader extends MultiChildRenderObjectWidget {
  /// Anteros Sticky Header será o cabeçalho do bastão na parte superior quando o conteúdo estiver sendo rolado.
  /// Coloque este widget dentro de um [ListView], [GridView], [CustomScrollView], [SingleChildScrollView] ou similar.
  AnterosStickyHeader(
      {Key? key,
      required this.stickyContent,
      required this.content,
      this.direction = Axis.vertical,
      this.enableHeaderOverlap = false,
      this.callback,
      this.stickyContentPosition = AnterosPosition.start})
      : super(
            key: key,
            children: stickyContentPosition == AnterosPosition.start &&
                    direction == Axis.horizontal
                ? [stickyContent, content]
                : stickyContentPosition == AnterosPosition.start &&
                        direction == Axis.vertical
                    ? [content, stickyContent]
                    : [content, stickyContent]);

  /// O widget pode ser usado para definir [stickyContent].
  final Widget stickyContent;

  ///O widget pode ser usado para definir [content].
  final Widget content;

  /// No estado verdadeiro, o [stickyContent]Será sobrepor o [content].
  /// Só funciona quando a direção é [Axis.vertical]. Padrão definido como false.
  final bool enableHeaderOverlap;

  /// [AnterosPosition] permite [stickyContentPosition] Para ficar no topo [Axis.vertical] e fique no início [Axis.horizontal]
  /// Padrão para [AnterosPosition.start]
  final AnterosPosition stickyContentPosition;

  /// Permite adicionar valor de deslocamento de deslocamento personalizado
  final RenderGFStickyHeaderCallback? callback;

  ///  [direction] permite que as crianças se alinhem de maneira vertical / horizontal
  ///  Padrão para [Axis.vertical]
  final Axis direction;

  @override
  RenderGFStickyHeader createRenderObject(BuildContext context) {
    final scrollable = Scrollable.of(context)!;
    return RenderGFStickyHeader(
      direction: direction,
      scrollable: scrollable,
      enableHeaderOverlap: enableHeaderOverlap,
      callback: callback,
      stickyContentPosition: stickyContentPosition,
    );
  }
}
