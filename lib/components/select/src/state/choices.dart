import 'package:flutter/foundation.dart';
import '../model/choice_item.dart';
import '../model/choice_loader.dart';
import '../model/group_data.dart';
import '../model/group_config.dart';

/// Type of what the choice state can do
enum AnterosChoicesTask {
  /// indicates the choices try to loading items at the first time
  init,

  /// indicates the choices try to refreshing items
  reload,

  /// indicates the choices try to appending items
  append,
}

/// State of the choices data
class AnterosChoices<T> extends ChangeNotifier {
  /// A function used to load choice items
  final AnterosChoiceLoader<T>? loader;

  /// The initial choice items
  final List<AnterosChoice<T>>? preload;

  /// Delay
  final Duration? delay;

  /// The choice items limit per page
  final int? limit;

  /// Current page number
  int page = 1;

  /// Current choice items
  List<AnterosChoice<T>>? items;

  /// Current status of this
  AnterosChoicesTask? task;

  /// Error message occurs while loading the choice items
  Error? error;

  bool _disposed = false;

  /// Default constructor
  AnterosChoices({
    List<AnterosChoice<T>>? items,
    this.loader,
    this.delay,
    this.limit,
  }) : this.preload = items;

  /// Returns values of the choice items
  List<T>? get values {
    return items?.map((AnterosChoice<T> choice) => choice.value).toList();
  }

  /// Returns length of the choice items
  int get length => items?.length ?? 0;

  /// Returns `true` if the choice state is idle
  bool get isIdle => task == null;

  /// Returns `true` if the choice state is busy
  bool get isBusy => task != null;

  /// Returns `true` if the choice state is initializing
  bool get isInitializing => task == AnterosChoicesTask.init;

  /// Returns `true` if the choice state is refreshing choice items
  bool get isReloading => task == AnterosChoicesTask.reload;

  /// Returns `true` if the choice state is adding more choice items
  bool get isAppending => task == AnterosChoicesTask.append;

  /// Returns `true` if there are no item in the choice items
  bool get isEmpty => items == null || items?.isEmpty == true;

  /// Returns `true` if there is at least one item in the choices items
  bool get isNotEmpty => items != null && items?.isNotEmpty == true;

  /// Returns `true` if [choice] and [value] is not `null`
  bool get isPreloaded => preload != null;

  /// Returns `true` if [loader] is `null`
  bool get isSync => loader == null;

  /// Returns `true` if [loader] is not `null`
  bool get isAsync => loader != null;

  /// Function to initialize choice state
  void initialize() {
    load(AnterosChoicesTask.init);
  }

  /// Function to refresh the choice items
  void reload({String? query}) {
    load(AnterosChoicesTask.reload, query: query);
  }

  /// Function to add more items to choice items
  void append({String? query}) {
    load(AnterosChoicesTask.append, query: query);
  }

  /// Function to load choice items
  void load(AnterosChoicesTask _task, {String? query}) async {
    // skip the loader if the status busy
    if (isBusy) return null;

    final bool isInitializing = _task == AnterosChoicesTask.init;
    final bool isAppending = _task == AnterosChoicesTask.append;

    // skip the loader if the items already filled
    if (isInitializing && isNotEmpty) return null;

    task = _task;
    page = isAppending ? page + 1 : 1;
    notifyListeners();

    try {
      final List<AnterosChoice<T>> choices =
          await find(AnterosChoiceLoaderInfo<T>(
        page: page,
        limit: limit,
        query: query,
      ));
      if (isAppending) {
        items!.addAll(choices);
      } else {
        items = List.from(choices);
      }
    } on Error catch (e) {
      if (isAppending) page--;
      error = e;
    } finally {
      await Future.delayed(delay ?? const Duration(milliseconds: 300), () {
        task = null;
        notifyListeners();
      });
    }
  }

  /// Returns a list of options
  Future<List<AnterosChoice<T>>> find(AnterosChoiceLoaderInfo<T> info) async {
    return isAsync
        ? hide(await loader!(info))
        : filter(hide(preload!), info.query);
  }

  /// Filter choice items by search text
  List<AnterosChoice<T>> filter(List<AnterosChoice<T>> choices, String? query) {
    return query != null
        ? choices
            .where((AnterosChoice<T> choice) => choice.contains(query))
            .toList()
            .cast<AnterosChoice<T>>()
        : choices;
  }

  /// Removes hidden choice items
  List<AnterosChoice<T>> hide(List<AnterosChoice<T>> choices) {
    return choices
      ..removeWhere((AnterosChoice<T> choice) => choice.hidden == true);
  }

  /// Returns a list of group
  List<AnterosGroup<T>>? groupItems(AnterosGroupConfig config) {
    if (groupKeys.isEmpty == true) return null;

    final groups = groupKeys
        .map((String groupKey) => AnterosGroup<T>(
              name: groupKey,
              choices: groupChoices(groupKey),
              headerStyle: config.headerStyle,
            ))
        .toList();
    // .cast<AnterosGroup<T>>();

    // sort the list when the comparator is provided
    if (config.sortBy != null) return groups..sort(config.sortBy!.compare);

    return groups;
  }

  /// Returns a unique list of group keys
  List<String> get groupKeys {
    return items!
        .map((AnterosChoice<T> choice) => choice.group)
        .toSet()
        .toList()
        .cast<String>();
  }

  /// Returns a list of group choice items
  List<AnterosChoice<T>> groupChoices(String key) {
    return items!
        .where((AnterosChoice<T> choice) => choice.group == key)
        .toList();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
