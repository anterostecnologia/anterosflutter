import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import 'src/anteros_groupedlist_order.dart';

export 'src/anteros_groupedlist_order.dart';

/// Uma lista agrupável de widgets semelhantes a [ListView], exceto que o
/// itens podem ser seccionados em grupos.
///
/// Veja [ListView.builder]
class AnterosGroupedListView<T, E> extends StatefulWidget {
  /// Itens dos quais [itemBuilder] ou [indexedItemBuilder] produzem a lista.
  final List<T> elements;

  /// Define quais elementos são agrupados.
  ///
  /// A função é chamada para cada elemento da lista, quando igual para dois
  /// elementos, esses dois pertencem ao mesmo grupo.
  final E Function(T element) groupBy;

  /// Pode ser usado para definir uma classificação personalizada para os grupos.
  ///
  /// Se não for definido, os grupos serão classificados com sua ordem de classificação natural ou sua
  /// implementação específica [Comparable].
  final int Function(E value1, E value2)? groupComparator;

  /// Pode ser usado para definir uma classificação personalizada para os elementos dentro de cada grupo.
  ///
  /// Se não for definido, os elementos serão classificados com sua ordem de classificação natural ou
  /// sua implementação específica [Comparable].
  final int Function(T element1, T element2)? itemComparator;

  /// Chamado para construir separadores de grupo para cada grupo.
  /// O valor é sempre o resultado groupBy do primeiro elemento do grupo.
  ///
  /// Será ignorado se [groupHeaderBuilder] for usado.
  final Widget Function(E value)? groupSeparatorBuilder;

  /// Igual a [groupSeparatorBuilder], será chamado para construir separadores de grupo
  /// para cada grupo.
  /// O elemento passado é sempre o primeiro elemento do grupo.
  ///
  /// Se definido [groupSeparatorBuilder] não será usado.
  final Widget Function(T element)? groupHeaderBuilder;

  /// Chamado para construir filhos para a lista com
  /// 0 <= elemento < element.length.
  final Widget Function(BuildContext context, T element)? itemBuilder;

  /// Chamado para construir filhos para a lista com
  /// 0 <= element, index < elements.length
  final Widget Function(BuildContext context, T element, int index)?
      indexedItemBuilder;

  /// Se a ordem da lista é crescente ou decrescente.
  ///
  /// Padrões para ASC.
  final AnterosGroupedListOrder order;

  /// Se os elementos serão ordenados ou não. Se não, deve ser feito
  /// manualmente.
  ///
  /// Padrão para verdadeiro.
  final bool sort;

  /// Quando definido como verdadeiro, o cabeçalho do grupo visível atual ficará
  ///  em cima.
  final bool useStickyGroupSeparators;

  /// Chamado para construir separadores entre cada item na lista.
  final Widget separator;

  /// Se os cabeçalhos do grupo flutuam sobre a lista ou ocupam seu próprio espaço.
  final bool floatingHeader;

  /// Cor de fundo do cabeçalho fixo.
  /// Usado apenas se [floatingHeader] for false.
  final Color stickyHeaderBackgroundColor;

  /// Um ​​objeto que pode ser usado para controlar a posição para a qual esta rolagem
  /// a visualização é rolada.
  ///
  /// Veja [ScrollView.controller]
  final ScrollController? controller;

  /// O eixo ao longo do qual a visualização de rolagem rola.
  ///
  /// O padrão é [Axis.vertical].
  final Axis scrollDirection;

  /// Se esta é a visualização de rolagem primária associada ao pai
  /// [PrimaryScrollController].
  ///
  /// Veja [ScrollView.primary]
  final bool? primary;

  /// Como a visualização de rolagem deve responder à entrada do usuário.
  ///
  /// Veja [ScrollView.physics].
  final ScrollPhysics? physics;

  /// Se a extensão da visualização de rolagem em [scrollDirection] deve ser
  /// determinado pelo conteúdo que está sendo visualizado.
  ///
  /// Veja [ScrollView.shrinkWrap]
  final bool shrinkWrap;

  /// A quantidade de espaço para inserir os filhos.
  final EdgeInsetsGeometry? padding;

  /// Se a visualização rola na direção de leitura.
  ///
  /// O padrão é falso.
  ///
  /// Veja [ScrollView.reverse].
  final bool reverse;

  /// Se cada filho deve ser encapsulado em um [AutomaticKeepAlive].
  ///
  /// Consulte [SliverChildBuilderDelegate.addAutomaticKeepAlives].
  final bool addAutomaticKeepAlives;

  /// Se cada filho deve ser agrupado em um [RepaintBoundary].
  ///
  /// Veja [SliverChildBuilderDelegate.addRepaintBoundaries].
  final bool addRepaintBoundaries;

  /// Se cada filho deve ser encapsulado em um [IndexedSemantics].
  ///
  /// Consulte [SliverChildBuilderDelegate.addSemanticIndexes].
  final bool addSemanticIndexes;

  /// Cria um array rolável e linear de widgets que são criados sob demanda.
  ///
  /// Veja [ScrollView.cacheExtent]
  final double? cacheExtent;

  /// {@macro flutter.widgets.Clip}
  ///
  /// O padrão é [Clip.hardEdge].
  final Clip clipBehavior;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// [ScrollViewKeyboardDismissBehavior] define como este [ScrollView] será
  /// dispensa o teclado automaticamente.
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// O número de filhos que contribuirão com informações semânticas.
  ///
  /// Alguns subtipos de [ScrollView] podem inferir este valor automaticamente. Por
  /// exemplo [ListView] usará o número de widgets na lista filho,
  /// enquanto o construtor [ListView.separated] usará metade desse valor.
  ///
  /// Para [CustomScrollView] e outros tipos que não recebem um construtor
  /// ou lista de widgets, a contagem de filhos deve ser fornecida explicitamente. Se o
  /// o número é desconhecido ou ilimitado isso deve ser deixado sem definição ou definido como nulo.
  ///
  /// Veja também:
  ///
  /// * [SemanticsConfiguration.scrollChildCount], a propriedade semântica correspondente.
  final int? semanticChildCount;

  /// Se não for nulo, força os filhos a terem a extensão dada no scroll
  /// direção.
  ///
  /// Especificar um [itemExtent] é mais eficiente do que deixar os filhos
  /// determinam sua própria extensão porque a máquina de rolagem pode fazer uso de
  /// o conhecimento prévio da extensão das crianças para economizar trabalho, por exemplo, quando
  /// a posição de rolagem muda drasticamente.
  final double? itemExtent;

  /// Cria um [AnterosGroupedListView]
  AnterosGroupedListView({
    Key? key,
    required this.elements,
    required this.groupBy,
    this.groupComparator,
    this.groupSeparatorBuilder,
    this.groupHeaderBuilder,
    this.itemBuilder,
    this.indexedItemBuilder,
    this.itemComparator,
    this.order = AnterosGroupedListOrder.ASC,
    this.sort = true,
    this.useStickyGroupSeparators = false,
    this.separator = const SizedBox.shrink(),
    this.floatingHeader = false,
    this.stickyHeaderBackgroundColor = const Color(0xffF7F7F7),
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.reverse = false,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.dragStartBehavior = DragStartBehavior.start,
    this.restorationId,
    this.semanticChildCount,
    this.itemExtent,
  })  : assert(itemBuilder != null || indexedItemBuilder != null),
        assert(groupSeparatorBuilder != null || groupHeaderBuilder != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AnterosGroupedListViewState<T, E>();
}

class _AnterosGroupedListViewState<T, E>
    extends State<AnterosGroupedListView<T, E>> {
  final StreamController<int> _streamController = StreamController<int>();
  final LinkedHashMap<String, GlobalKey> _keys = LinkedHashMap();
  final GlobalKey _key = GlobalKey();
  late final ScrollController _controller;
  GlobalKey? _groupHeaderKey;
  List<T> _sortedElements = [];
  int _topElementIndex = 0;
  RenderBox? _headerBox;
  RenderBox? _listBox;

  @override
  void initState() {
    _controller = widget.controller ?? ScrollController();
    if (widget.useStickyGroupSeparators) {
      _controller.addListener(_scrollListener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.useStickyGroupSeparators) {
      _controller.removeListener(_scrollListener);
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _sortedElements = _sortElements();
    var hiddenIndex = widget.reverse ? _sortedElements.length * 2 - 1 : 0;
    var _isSeparator =
        widget.reverse ? (int i) => i.isOdd : (int i) => i.isEven;

    if (widget.reverse) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollListener();
      });
    }

    return Stack(
      key: _key,
      alignment: Alignment.topCenter,
      children: <Widget>[
        ListView.builder(
          key: widget.key,
          scrollDirection: widget.scrollDirection,
          controller: _controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          reverse: widget.reverse,
          clipBehavior: widget.clipBehavior,
          dragStartBehavior: widget.dragStartBehavior,
          itemExtent: widget.itemExtent,
          restorationId: widget.restorationId,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          semanticChildCount: widget.semanticChildCount,
          itemCount: _sortedElements.length * 2,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          cacheExtent: widget.cacheExtent,
          itemBuilder: (context, index) {
            var actualIndex = index ~/ 2;
            if (index == hiddenIndex) {
              return Opacity(
                opacity: widget.useStickyGroupSeparators ? 0 : 1,
                child: _buildGroupSeparator(_sortedElements[actualIndex]),
              );
            }
            if (_isSeparator(index)) {
              var curr = widget.groupBy(_sortedElements[actualIndex]);
              var prev = widget.groupBy(
                  _sortedElements[actualIndex + (widget.reverse ? 1 : -1)]);
              if (prev != curr) {
                return _buildGroupSeparator(_sortedElements[actualIndex]);
              }
              return widget.separator;
            }
            return _buildItem(context, actualIndex);
          },
        ),
        StreamBuilder<int>(
            stream: _streamController.stream,
            initialData: _topElementIndex,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _showFixedGroupHeader(snapshot.data!);
              }
              return Container();
            }),
      ],
    );
  }

  Widget _buildItem(context, int index) {
    final key = _keys.putIfAbsent('$index', () => GlobalKey());
    final value = _sortedElements[index];
    return KeyedSubtree(
      key: key,
      child: widget.indexedItemBuilder != null
          ? widget.indexedItemBuilder!(context, value, index)
          : widget.itemBuilder!(context, value),
    );
  }

  void _scrollListener() {
    _listBox ??= _key.currentContext?.findRenderObject() as RenderBox?;
    var listPos = _listBox?.localToGlobal(Offset.zero).dy ?? 0;
    _headerBox ??=
        _groupHeaderKey?.currentContext?.findRenderObject() as RenderBox?;
    var headerHeight = _headerBox?.size.height ?? 0;
    var max = double.negativeInfinity;
    var topItemKey = widget.reverse ? '${_sortedElements.length - 1}' : '0';
    for (var entry in _keys.entries) {
      var key = entry.value;
      if (_isListItemRendered(key)) {
        var itemBox = key.currentContext!.findRenderObject() as RenderBox;
        // posição da borda superior do item dentro da lista
        var y = itemBox.localToGlobal(Offset(0, -listPos - headerHeight)).dy;
        if (y <= headerHeight && y > max) {
          topItemKey = entry.key;
          max = y;
        }
      }
    }
    var index = math.max(int.parse(topItemKey), 0);
    if (index != _topElementIndex) {
      var curr = widget.groupBy(_sortedElements[index]);
      var prev = widget.groupBy(_sortedElements[_topElementIndex]);

      if (prev != curr) {
        _topElementIndex = index;
        _streamController.add(_topElementIndex);
      }
    }
  }

  List<T> _sortElements() {
    var elements = widget.elements;
    if (widget.sort && elements.isNotEmpty) {
      elements.sort((e1, e2) {
        var compareResult;
        //compara os grupos
        if (widget.groupComparator != null) {
          compareResult =
              widget.groupComparator!(widget.groupBy(e1), widget.groupBy(e2));
        } else if (widget.groupBy(e1) is Comparable) {
          compareResult = (widget.groupBy(e1) as Comparable)
              .compareTo(widget.groupBy(e2) as Comparable);
        }
        // compara elementos dentro do grupo
        if ((compareResult == null || compareResult == 0)) {
          if (widget.itemComparator != null) {
            compareResult = widget.itemComparator!(e1, e2);
          } else if (e1 is Comparable) {
            compareResult = e1.compareTo(e2);
          }
        }
        return compareResult;
      });
      if (widget.order == AnterosGroupedListOrder.DESC) {
        elements = elements.reversed.toList();
      }
    }
    return elements;
  }

  Widget _showFixedGroupHeader(int topElementIndex) {
    _groupHeaderKey = GlobalKey();
    if (widget.useStickyGroupSeparators && widget.elements.isNotEmpty) {
      T topElement;

      try {
        topElement = _sortedElements[topElementIndex];
      } on RangeError catch (_) {
        topElement = _sortedElements[0];
      }

      return Container(
        key: _groupHeaderKey,
        color:
            widget.floatingHeader ? null : widget.stickyHeaderBackgroundColor,
        width: widget.floatingHeader ? null : MediaQuery.of(context).size.width,
        child: _buildGroupSeparator(topElement),
      );
    }
    return Container();
  }

  bool _isListItemRendered(GlobalKey<State<StatefulWidget>> key) {
    return key.currentContext != null &&
        key.currentContext!.findRenderObject() != null;
  }

  Widget _buildGroupSeparator(T element) {
    if (widget.groupHeaderBuilder == null) {
      return widget.groupSeparatorBuilder!(widget.groupBy(element));
    }
    return widget.groupHeaderBuilder!(element);
  }
}
