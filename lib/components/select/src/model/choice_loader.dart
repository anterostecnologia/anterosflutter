import 'package:flutter/foundation.dart';
import 'choice_item.dart';

typedef Future<List<AnterosChoice<T>>> AnterosChoiceLoader<T>(
    AnterosChoiceLoaderInfo<T> info);

@immutable
class AnterosChoiceLoaderInfo<T> with Diagnosticable {
  final List<T>? values;
  final String? query;
  final int? page;
  final int? skip;
  final int? limit;

  AnterosChoiceLoaderInfo({
    this.values,
    this.query,
    this.page,
    this.skip,
    this.limit,
  });

  /// Creates a copy of this [AnterosChoiceLoaderInfo] but with
  /// the given fields replaced with the new values.
  AnterosChoiceLoaderInfo<T> copyWith({
    List<T>? values,
    String? query,
    int? page,
    int? skip,
    int? limit,
  }) {
    return AnterosChoiceLoaderInfo<T>(
      values: values ?? this.values,
      query: query ?? this.query,
      page: page ?? this.page,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  /// Creates a copy of this [AnterosChoiceLoaderInfo] but with
  /// the given fields replaced with the new values.
  AnterosChoiceLoaderInfo<T> merge(AnterosChoiceLoaderInfo<T>? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      values: other.values,
      query: other.query,
      page: other.page,
      skip: other.skip,
      limit: other.limit,
    );
  }
}
