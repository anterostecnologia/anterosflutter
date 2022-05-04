import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Cria pílulas como a barra de guia estruturada.Ver [AnterosTabBar]
/// [AnterosSegmentTabs] são melhor utilizados como alternativa para [AnterosTabBar].
class AnterosSegmentTabs extends StatefulWidget {
  /// Cria pílulas como a barra de guia estruturada.Ver [AnterosTabBar]
  /// [AnterosSegmentTabs] são melhor utilizados como alternativa para [AnterosTabBar].
  const AnterosSegmentTabs({
    Key? key,
    required this.length,
    required this.tabs,
    required this.tabController,
    this.height,
    this.width,
    this.border,
    this.borderRadius,
    this.tabBarColor,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
  })  : assert(length != null && length >= 0),
        super(key: key);

  /// O número total de guias.Normalmente maior que um.Deve combinar [TabBar.tabs]'areia
  /// [TabBarView.children]'s comprimento.
  final int? length;

  ///Conjuntas [AnterosSegmentTabs] Altura
  final double? height;

  ///Conjuntas [TabBar] cor usando a cor do material [Color]
  final Color? tabBarColor;

  /// a cor da linha que aparece abaixo da guia selecionada.
  ///
  /// Se este parâmetro for nulo, então o valor do indicador do tema
  /// A propriedade é usada.
  ///
  /// Se [indicator] é especificado, esta propriedade é ignorada.
  final Color? indicatorColor;

  /// A espessura da linha que aparece abaixo da guia selecionada.
  ///
  /// o valor deste parâmetro deve ser maior que zero e seu padrão
  /// O valor é 2.0.
  ///
  /// Se [indicator] é especificado, esta propriedade é ignorada.
  final double indicatorWeight;

  /// O preenchimento horizontal para a linha que aparece abaixo da guia selecionada.
  ///
  /// para barras de guias ISSCrollable, especificando [kTabLabelPadding] vai se alinhar
  /// o indicador com o texto da guia para [Tab] widgets e todos, exceto o
  /// mais curto [Tab.text] valores.
  ///
  /// o [EdgeInsets.top] e [EdgeInsets.bottom] valores do
  /// [indicatorPadding] estão ignorada.
  ///
  /// O valor padrão de [indicatorPadding] é [EdgeInsets.zero].
  ///
  /// Se [indicator] é especificado, esta propriedade é ignorada.
  final EdgeInsetsGeometry indicatorPadding;

  /// define a aparência do indicador de guia selecionado.
  ///
  /// Se [indicator] é especificado, o [indicatorColor], [indicatorWeight],
  /// e [indicatorPadding] As propriedades são ignoradas.
  ///
  /// O indicador de guia selecionado em estilo padrão, em estilo sublinhado, pode ser definido com
  /// [UnderlineTabIndicator].
  ///
  ///O tamanho do indicador é baseado nos limites da guia.Se [indicatorSize]
  /// é [TabBarIndicatorSize.tab] Os limites da guia são tão largos quanto o espaço
  /// Ocupado pela guia na barra da guia.Se [indicatorSize] é
  /// [TabBarIndicatorSize.label], Então os limites da guia são tão largos quanto
  /// o próprio widget da guia.
  final Decoration? indicator;

  /// define como o tamanho do indicador de guia selecionado é calculado.
  ///
  /// O tamanho do indicador de guia selecionado é definido em relação ao
 /// os limites gerais da guia se [indicatorSize] é [TabBarIndicatorSize.tab]
  /// (o padrão) ou em relação aos limites do widget da guia se
  /// [indicatorSize] é [TabBarIndicatorSize.label].
  ///
  /// A aparência de localização da guia selecionada pode ser refinada ainda mais com
  /// a [indicatorColor], [indicatorWeight], [indicatorPadding], e
  /// [indicator] propriedades.
  final TabBarIndicatorSize? indicatorSize;

  /// A cor dos rótulos de guias selecionados.
  ///
  /// rótulos de guias não selecionados são renderizados com a mesma cor renderizada a 70%
  /// opacidade a menos que [unselectedLabelColor] não é nulo.
  ///
  /// Se este parâmetro for nulo, então a cor do [ThemeData.primaryTextTheme]'s
  /// cor body2 A cor do texto é usada.
  final Color? labelColor;

  /// a cor dos rótulos de guias não selecionados.
  ///
  /// Se esta propriedade for nula, os rótulos de guias não selecionados são renderizados com o
  /// [labelColor] com 70% de opacidade.
  final Color? unselectedLabelColor;

  /// O estilo de texto dos rótulos de guias selecionados.
  ///
  /// Se [unselectedLabelStyle] é nulo, então este estilo de texto será usado para
  /// estilos de etiquetas selecionados e não selecionados.
  ///
  /// Se esta propriedade for nula, o estilo de texto do
  /// [ThemeData.primaryTextTheme]'s Body2 Definição é usada.
  final TextStyle? labelStyle;

  /// O preenchimento adicionado a cada um dos rótulos da guia.
  ///
  /// Se essa propriedade for nula, o Ktablabelpadding será usado.
  final EdgeInsetsGeometry? labelPadding;
/// o estilo de texto das etiquetas de guias não selecionadas
  ///
  /// Se esta propriedade for nula, então o [labelStyle] o valor é usado.Se [labelStyle]
  /// é nulo, então o estilo de texto do [ThemeData.primaryTextTheme]'s
  /// Body2 Definição é usada.
  final TextStyle? unselectedLabelStyle;

  /// Normalmente uma lista de dois ou mais [Tab] widgets
  ///
  /// A duração desta lista deve corresponder ao controlador [TabController.length]
  /// e o comprimento do [TabBarView.children] Lista.
  final List<Widget> tabs;

  /// define a borda externa das guias
  final Border? border;

  /// define borda externa, raio de borda
  final BorderRadius? borderRadius;

  /// O estado de seleção e animação deste widget.
  ///
  /// If [TabController] não é fornecido, então o valor de [DefaultTabController.of]
  /// será usado.
  final TabController? tabController;

  /// define a largura da linha da guia
  final double? width;

  @override
  _AnterosSegmentTabsState createState() => _AnterosSegmentTabsState();
}

class _AnterosSegmentTabsState extends State<AnterosSegmentTabs> {
  @override
  Widget build(BuildContext context) => Container(
        height: widget.height ?? 28,
        width: widget.width ?? 240,
        decoration: BoxDecoration(
          border: widget.border ??
              Border.all(color: AnterosColors.PRIMARY, width: 1),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
        ),
        child: DefaultTabController(
          // initialIndex: widget.initialIndex,
          length: widget.length!,
          child: Material(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
            type: MaterialType.button,
            color: widget.tabBarColor ?? Colors.transparent,
            child: TabBar(
              controller: widget.tabController,
              labelColor: widget.labelColor ?? AnterosColors.WHITE,
              unselectedLabelColor:
                  widget.unselectedLabelColor ?? AnterosColors.PRIMARY,
              labelStyle: widget.labelStyle ?? const TextStyle(fontSize: 12),
              unselectedLabelStyle:
                  widget.unselectedLabelStyle ?? const TextStyle(fontSize: 12),
              indicatorColor: widget.indicatorColor ?? AnterosColors.PRIMARY,
              indicatorSize: widget.indicatorSize,
              indicator: widget.indicator ??
                  BoxDecoration(
                    color: widget.indicatorColor ?? AnterosColors.PRIMARY,
                    border: Border.all(
                        color: widget.indicatorColor ?? Colors.transparent,
                        width: 2),
                    borderRadius: widget.borderRadius == null
                        ? BorderRadius.circular(0)
                        : widget.borderRadius,
                  ),
              indicatorPadding: widget.indicatorPadding,
              indicatorWeight: widget.indicatorWeight,
              tabs: widget.tabs,
            ),
          ),
        ),
      );
}
