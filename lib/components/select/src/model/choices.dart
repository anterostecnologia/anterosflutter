import '../model/choice_item.dart';
import '../model/group_data.dart';
import '../model/group_config.dart';

/// modal choice widget
class AnterosChoices<T> {
  /// list of choice data
  final List<AnterosChoice<T>> items;

  /// current filter query
  final String query;

  /// configuration of group widget
  final AnterosGroupConfig groupConfig;

  /// default constructor
  AnterosChoices({
    required this.items,
    required this.query,
    required this.groupConfig,
  });

  /// return a filtered list of options
  List<AnterosChoice<T>> get filteredItems {
    return query != null
        ? nonHiddenItems
            .where((AnterosChoice<T> item) => item.contains(query))
            .toList()
            .cast<AnterosChoice<T>>()
        : nonHiddenItems;
  }

  /// return a non hidden option item
  List<AnterosChoice<T>> get nonHiddenItems {
    return items
        .where((AnterosChoice<T> item) => item.hidden != true)
        .toList()
        .cast<AnterosChoice<T>>();
  }

  /// return a list of group
  List<AnterosGroup<T>> get groups {
    final List<AnterosGroup<T>> groups = groupKeys
        .map((String groupKey) => AnterosGroup<T>(
              name: groupKey,
              choices: groupItems(groupKey),
              headerStyle: groupConfig.headerStyle,
            ))
        .toList()
        .cast<AnterosGroup<T>>();

    // sort the list when the comparator is provided
    if (groupConfig.sortBy != null)
      return groups..sort(groupConfig.sortBy!.compare);

    return groups;
  }

  /// return a unique list of group keys
  List<String> get groupKeys {
    return filteredItems
        .map((AnterosChoice<T> item) => item.group)
        .toSet()
        .toList()
        .cast<String>();
  }

  /// return a list of group items
  List<AnterosChoice<T>> groupItems(String key) {
    return filteredItems
        .where((AnterosChoice<T> item) => item.group == key)
        .toList();
  }

  /// whether the list need to be grouped or not
  bool get isGrouped {
    return groupConfig.enabled && groupKeys.isNotEmpty;
  }
}
