import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosButtonBar extends StatelessWidget {
  /// Cria barra de botões para todos os tipos de botões.
  /// verifica [AnterosButton] e [AnterosIconButton]
  const AnterosButtonBar({
    Key? key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.center,
    this.spacing = 8.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    required this.children,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  /// O espaço vazio que circunda o buttonBar. O padrão é padding.zero
  final EdgeInsetsGeometry padding;

  /// A direção a ser usada como eixo principal.
  ///
  /// Por exemplo, se [direction] for [Axis.horizontal], o padrão, o
  /// os filhos são colocados adjacentes um ao outro em uma execução horizontal até que o
  /// o espaço horizontal disponível é consumido, momento em que um subsequente
  /// as crianças são colocadas em uma nova execução verticalmente adjacente à execução anterior.
  final Axis direction;

  /// Como os filhos dentro de uma execução devem ser colocados no eixo principal.
  ///
  /// Por exemplo, se [alignment] for [WrapAlignment.center], os filhos em
  /// cada corrida é agrupada no centro de sua corrida no eixo principal.
  ///
  /// O padrão é [WrapAlignment.start].
  ///
  /// Veja também:
  ///
  /// * [runAlignment], que controla como as execuções são colocadas em relação a cada
  /// outro no eixo cruzado.
  /// * [crossAxisAlignment], que controla como os filhos em cada execução
  /// são colocados um em relação ao outro no eixo cruzado.
  final WrapAlignment alignment;

  /// Quanto espaço para colocar os filhos besttuckValue em uma execução no eixo principal.
  ///
  /// Por exemplo, se [espaçamento] for 10.0, os filhos serão espaçados pelo menos
  /// 10,0 pixels lógicos separados no eixo principal.
  ///
  /// Se houver espaço livre adicional em uma execução (por exemplo, porque o wrap tem um
  /// tamanho mínimo que não é preenchido ou porque algumas execuções são maiores que
  /// outros), o espaço livre adicional será alocado de acordo com o
  /// [alinhamento].
  ///
  /// O padrão é 0.0.
  final double spacing;

  /// Como as corridas devem ser colocadas no eixo cruzado.
  ///
  /// Por exemplo, se [runAlignment] for [WrapAlignment.center], as execuções serão
  /// agrupados no centro do [Wrap] geral no eixo cruzado.
  ///
  /// O padrão é [WrapAlignment.start].
  ///
  /// Veja também:
  ///
  /// * [alignment], que controla como os filhos em cada execução são colocados
  /// em relação ao outro no eixo principal.
  /// * [crossAxisAlignment], que controla como os filhos em cada execução
  /// são colocados um em relação ao outro no eixo cruzado.
  final WrapAlignment runAlignment;

  /// Quanto espaço para colocar besttuckValue as próprias corridas no eixo cruzado.
  ///
  /// Por exemplo, se [runSpacing] for 10.0, as execuções serão espaçadas pelo menos
  /// 10,0 pixels lógicos separados no eixo cruzado.
  ///
  /// Se houver espaço livre adicional no [Wrap] geral (por exemplo, porque
  /// o wrap tem um tamanho mínimo que não é preenchido), o espaço livre adicional
  /// será alocado de acordo com o [runAlignment].
  ///
  /// O padrão é 0.0.
  final double runSpacing;

  /// Os botões para organizar horizontalmente.
  /// Normalmente widgets [AnterosButton] ou [AnterosIconButton].
  final List<Widget> children;

  /// Como os filhos em uma execução devem ser alinhados em relação uns aos outros em
  /// o eixo cruzado.
  ///
  /// Por exemplo, se for definido como [WrapCrossAlignment.end], e o
  /// [direction] é [Axis.horizontal], então os filhos dentro de cada
  /// run terá suas bordas inferiores alinhadas com a borda inferior do run.
  ///
  /// O padrão é [WrapCrossAlignment.start].
  ///
  /// Veja também:
  ///
  /// * [alignment], que controla como os filhos em cada execução são colocados
  /// em relação ao outro no eixo principal.
  /// * [runAlignment], que controla como as execuções são colocadas em relação a cada
  /// outro no eixo cruzado.
  final WrapCrossAlignment crossAxisAlignment;

  /// Determina a ordem para colocar as crianças horizontalmente e como interpretar
  /// `start` e `end` na direção horizontal.
  ///
  /// Padrões para o ambiente [Directionality].
  ///
  /// Se a [direção] for [Axis.horizontal], isso controla a ordem na qual o
  /// os filhos são posicionados (da esquerda para a direita ou da direita para a esquerda), e o significado
  /// do [WrapAlignment.start] da propriedade [alignment] e
  /// valores [WrapAlignment.end].
  ///
  /// Se a [direção] for [Axis.horizontal], e o
  /// [alignment] é [WrapAlignment.start] ou [WrapAlignment.end], ou
  /// há mais de um filho, então o [textDirection] (ou o ambiente
  /// [Directionality]) não deve ser nulo.
  ///
  /// Se a [direção] for [Axis.vertical], isso controla a ordem em que
  /// as corridas são posicionadas, o significado da propriedade [runAlignment]
  /// valores [WrapAlignment.start] e [WrapAlignment.end], bem como o
  /// [crossAxisAlignment] da propriedade [WrapCrossAlignment.start] e
  /// valores [WrapCrossAlignment.end].
  ///
  /// Se a [direção] for [Axis.vertical], e o
  /// [runAlignment] é [WrapAlignment.start] ou [WrapAlignment.end], o
  /// [crossAxisAlignment] é [WrapCrossAlignment.start] ou
  /// [WrapCrossAlignment.end], ou há mais de um filho, então o
  /// [textDirection] (ou o ambiente [Directionality]) não deve ser nulo.
  final TextDirection? textDirection;

  /// Determina a ordem para colocar as crianças verticalmente e como interpretar
  /// `start` e `end` na direção vertical.
  ///
  /// Se a [direção] for [Axis.vertical], isso controla qual ordem os filhos
  /// são pintados (para baixo ou para cima), o significado da propriedade [alignment]
  /// valores [WrapAlignment.start] e [WrapAlignment.end].
  ///
  /// Se a [direção] for [Axis.vertical], e o [alinhamento]
  /// é [WrapAlignment.start] ou [WrapAlignment.end], ou há
  /// mais de um filho, então o [verticalDirection] não deve ser nulo.
  ///
  /// Se a [direção] for [Axis.horizontal], isso controla a ordem em que
  /// as corridas são posicionadas, o significado da propriedade [runAlignment]
  /// valores [WrapAlignment.start] e [WrapAlignment.end], bem como o
  /// [crossAxisAlignment] da propriedade [WrapCrossAlignment.start] e
  /// valores [WrapCrossAlignment.end].
  ///
  /// Se a [direção] for [Axis.horizontal], e o
  /// [runAlignment] é [WrapAlignment.start] ou [WrapAlignment.end], o
  /// [crossAxisAlignment] é [WrapCrossAlignment.start] ou
  /// [WrapCrossAlignment.end], ou há mais de um filho, então o
  /// [verticalDirection] não deve ser nulo.
  final VerticalDirection verticalDirection;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Wrap(
          direction: direction,
          alignment: alignment,
          spacing: spacing,
          runAlignment: runAlignment,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          children: children.map<Widget>((Widget child) => child).toList(),
        ),
      );
}
