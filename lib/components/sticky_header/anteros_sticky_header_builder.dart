import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

typedef StickyHeaderWidgetBuilder = Widget Function(
  BuildContext context,
  double stuckValue,
);

class AnterosStickyHeaderBuilder extends StatefulWidget {
  /// Coloque este widget dentro de um [ListView], [GridView], [CustomScrollView], [SingleChildScrollView] ou similar.
  /// Constrói um novo [AnterosStickyHeaderBuilder] ferramenta.
  const AnterosStickyHeaderBuilder({
    Key? key,
    required this.stickyContentBuilder,
    required this.content,
    this.direction = Axis.vertical,
    this.enableHeaderOverlap = false,
    this.callback,
    this.stickyContentPosition = AnterosPosition.start,
  }) : super(key: key);

  /// O widget do construtor pode ser usado para definir [stickyContentBuilder].
  final StickyHeaderWidgetBuilder stickyContentBuilder;

  /// O widget pode ser usado para definir [content].
  final Widget content;

  /// No estado verdadeiro, o [stickyContentBuilder] Será sobrepor o [content].
  /// Só funciona quando a direção é [Axis.vertical]. Padrão definido como false.
  final bool enableHeaderOverlap;

  /// [AnterosPosition] permite [stickyContentPosition] Para ficar no topo [Axis.vertical] e fique no início [Axis.horizontal]
  /// Defaults to [AnterosPosition.start]
  final AnterosPosition stickyContentPosition;

  /// Permite adicionar valor de deslocamento de deslocamento personalizado
  final RenderGFStickyHeaderCallback? callback;

  ///  [direction] permite que as crianças se alinhem de maneira vertical / horizontal
  ///  Padrão para [Axis.vertical]
  final Axis direction;

  @override
  _AnterosStickyHeaderBuilderState createState() =>
      _AnterosStickyHeaderBuilderState();
}

class _AnterosStickyHeaderBuilderState
    extends State<AnterosStickyHeaderBuilder> {
  double? _stuckValue;

  @override
  Widget build(BuildContext context) => AnterosStickyHeader(
        enableHeaderOverlap: widget.enableHeaderOverlap,
        direction: widget.direction,
        stickyContentPosition: widget.stickyContentPosition,
        stickyContent: LayoutBuilder(
          builder: (context, _) =>
              widget.stickyContentBuilder(context, _stuckValue ?? 0.0),
        ),
        content: widget.content,
        callback: (double stuckValue) {
          if (_stuckValue != stuckValue) {
            _stuckValue = stuckValue;
            WidgetsBinding.instance?.endOfFrame.then((_) {
              if (mounted) {
                setState(() {});
              }
            });
          }
        },
      );
}
