import 'package:flutter/foundation.dart';
import 'group_data.dart';

/// Comparator function to use in [List.sort]
typedef int AnterosSortComparator<E>(E a, E b);

/// Comparator function to sort the choice group enhanced with predefined function
@immutable
class AnterosGroupSort with Diagnosticable {
  /// Comparator function to sort the group
  final AnterosSortComparator<AnterosGroup> compare;

  /// Default constructor
  AnterosGroupSort(this.compare);

  /// Function to sort the group keys alphabetically by name in ascending order
  factory AnterosGroupSort.byNameInAsc() =>
      AnterosGroupSort((AnterosGroup a, AnterosGroup b) {
        return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
      });

  /// Function to sort the group keys alphabetically by name in descending order
  factory AnterosGroupSort.byNameInDesc() =>
      AnterosGroupSort((AnterosGroup a, AnterosGroup b) {
        return b.name!.toLowerCase().compareTo(a.name!.toLowerCase());
      });

  /// Function to sort the group keys by items count in ascending order
  factory AnterosGroupSort.byCountInAsc() =>
      AnterosGroupSort((AnterosGroup a, AnterosGroup b) {
        return a.count.compareTo(b.count);
      });

  /// Function to sort the group keys by items count in descending order
  factory AnterosGroupSort.byCountInDesc() =>
      AnterosGroupSort((AnterosGroup a, AnterosGroup b) {
        return b.count.compareTo(a.count);
      });
}
