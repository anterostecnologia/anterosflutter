import 'dart:collection';
import 'package:flutter/widgets.dart';

import 'src/anteros_groupedlist_order.dart';

export 'src/anteros_groupedlist_order.dart';

class AnterosSliverGroupedListView<T, E> extends StatefulWidget {
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

  /// Chamado para construir separadores entre cada item na lista.
  final Widget separator;

  /// Cria um [AnterosSliverGroupedListView]
  AnterosSliverGroupedListView({
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
    this.separator = const SizedBox.shrink(),
  })  : assert(itemBuilder != null || indexedItemBuilder != null),
        assert(groupSeparatorBuilder != null || groupHeaderBuilder != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AnterosSliverGroupedListViewState<T, E>();
}

class _AnterosSliverGroupedListViewState<T, E>
    extends State<AnterosSliverGroupedListView<T, E>> {
  final LinkedHashMap<String, GlobalKey> _keys = LinkedHashMap();
  List<T> _sortedElements = [];

  @override
  Widget build(BuildContext context) {
    _sortedElements = _sortElements();
    var hiddenIndex = 0;
    var _isSeparator = (int i) => i.isEven;

    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      var actualIndex = index ~/ 2;
      if (index == hiddenIndex) {
        return Opacity(
          opacity: 1,
          child: _buildGroupSeparator(_sortedElements[actualIndex]),
        );
      }
      if (_isSeparator(index)) {
        var curr = widget.groupBy(_sortedElements[actualIndex]);
        var prev = widget.groupBy(_sortedElements[actualIndex - 1]);
        if (prev != curr) {
          return _buildGroupSeparator(_sortedElements[actualIndex]);
        }
        return widget.separator;
      }
      return _buildItem(context, actualIndex);
    }, childCount: _sortedElements.length * 2));
  }

  Container _buildItem(context, int actualIndex) {
    var key = GlobalKey();
    _keys['$actualIndex'] = key;
    return Container(
        key: key,
        child: widget.indexedItemBuilder == null
            ? widget.itemBuilder!(context, _sortedElements[actualIndex])
            : widget.indexedItemBuilder!(
                context, _sortedElements[actualIndex], actualIndex));
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

  Widget _buildGroupSeparator(T element) {
    if (widget.groupHeaderBuilder == null) {
      return widget.groupSeparatorBuilder!(widget.groupBy(element));
    }
    return widget.groupHeaderBuilder!(element);
  }
}
