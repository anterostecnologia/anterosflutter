import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Um widget de design de material que exibe uma linha horizontal de guias.
///
/// normalmente criado como o [AppBar.bottom] parte de um [AppBar] e em
/// conjunção com a [TabBarView].
class AnterosTabBar extends StatefulWidget {
  /// Cria uma barra de guias de design de material.
  /// O [tabs] o argumento não deve ser nulo e seu comprimento deve corresponder ao [controller]'s
  /// [TabController.length].
  const AnterosTabBar({
    Key? key,
    required this.length,
    required this.tabs,
    required this.controller,
    this.isScrollable = false,
    this.tabBarHeight,
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
    this.shape,
    this.width,
  })  : assert(length != null && length >= 0),
        super(key: key);

  /// O número total de guias.Normalmente maior que um.Deve combinar [TabBar.tabs]'s e
  /// [TabBarView.children]'s comprimento.
  final int? length;

  /// Conjuntas [AnterosTabBar] altura
  final double? tabBarHeight;

  /// Conjuntas [TabBar] cor usando a cor do material [Color]
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
  /// o indicador com o texto da guia para [tab] widgets e todos, exceto o
  /// o mais curto [Tab.text] valores.
  ///
  /// o [EdgeInsets.top] e [EdgeInsets.bottom] valores do
  /// [indicatorPadding] são ignorados.
  ///
  /// O valor padrão de [indicatorPadding] é [EdgeInsets.zero].
  ///
  /// Se [indicator] é especificado, esta propriedade é ignorada.
  final EdgeInsetsGeometry indicatorPadding;

  /// Define a aparência do indicador de guia selecionado.
  ///
  /// Se [indicator] é especificado, o [indicatorColor], [indicatorWeight],
  /// e [indicatorPadding] As propriedades são ignoradas.
  ///
  /// O indicador de guia selecionado em estilo padrão, em estilo sublinhado, pode ser definido com
  /// [UnderlineTabIndicator].
  ///
  /// O tamanho do indicador é baseado nos limites da guia.Se[indicatorSize]
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
  /// Opacity, a menos que [unselectedLabelColor] não é nulo.
  ///
  /// Se este parâmetro for nulo, então a cor do [ThemeData.primaryTextTheme]'s
  /// Body2 Text Color é usado.
  final Color? labelColor;

  /// A cor dos rótulos de guias não selecionados.
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

  /// normalmente uma lista de dois ou mais [Tab] widgets.
  ///
  /// O comprimento desta lista deve corresponder ao [controller]'s [TabController.length]
  /// e o comprimento do [TabBarView.children] Lista.
  final List<Widget> tabs;

  /// Se esta barra de guia pode ser rolada horizontalmente.
  ///
  /// Se [isScrollable] é verdadeiro, então cada guia é tão larga quanto necessária para o seu rótulo
  /// e todo [TabBar] é rolável.Caso contrário, cada guia recebe igual
  /// compartilhamento do espaço disponível.
  final bool isScrollable;

  /// O estado de seleção e animação deste widget.
  ///
  /// If [TabController] não é fornecido, então o valor de[DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// define a forma de tabbar
  final ShapeBorder? shape;

  // Largura do tabbar.
  // Se esta propriedade for nula, a largura do tabbar é de tela cheia
  final double? width;

  @override
  _AnterosTabBarState createState() => _AnterosTabBarState();
}

class _AnterosTabBarState extends State<AnterosTabBar> {
  ScrollController? _scrollController;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        dragStartBehavior: dragStartBehavior,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Container(
          width: widget.width ?? MediaQuery.of(context).size.width,
          height:
              widget.tabBarHeight ?? MediaQuery.of(context).size.height * 0.1,
          child: Material(
            shape: widget.shape,
            type: MaterialType.button,
            color: widget.tabBarColor ?? Theme.of(context).primaryColor,
            child: TabBar(
              isScrollable: widget.isScrollable,
              controller: widget.controller,
              labelColor: widget.labelColor,
              unselectedLabelColor: widget.unselectedLabelColor,
              labelStyle: widget.labelStyle,
              unselectedLabelStyle: widget.unselectedLabelStyle,
              indicatorColor: widget.indicatorColor,
              indicatorSize: widget.indicatorSize,
              indicator: widget.indicator,
              indicatorPadding: widget.indicatorPadding,
              indicatorWeight: widget.indicatorWeight,
              tabs: widget.tabs,
            ),
          ),
        ),
      );
}
