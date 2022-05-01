import 'package:anterosflutter/components/extensions/utils/transform_util.dart';
import 'package:anterosflutter/components/extensions/utils/validator_util.dart';

extension ListValidation on List {
  /// Checks if data is null.
  bool isNull() => ValidatorUtil.isNull(this);

  /// Checks if data is null or Blank (Empty or only contains whitespace).
  bool isNullOrBlank() => ValidatorUtil.isNullOrBlank(this);

  /// Checks if int value is Palindrom.
  bool isPalindrom() =>
      ValidatorUtil.isPalindrom(TransformUtil.numericOnly(this.toString()));

  /// Checks if all value inside list are same.
  /// Example: [1,1,1,1] -> true
  bool isOneAKind() => ValidatorUtil.isOneAKind(this);

  /// Checks if length of list is LOWER than maxLength.
  bool isLengthLowerThan(int maxLength) =>
      ValidatorUtil.isLengthLowerThan(this, maxLength);

  /// Checks if length of list is LOWER OR EQUAL to maxLength.
  bool isLengthLowerOrEqual(int maxLength) =>
      ValidatorUtil.isLengthLowerOrEqual(this, maxLength);

  /// Checks if length of list is GREATER than maxLength.
  bool isLengthGreaterThan(int maxLength) =>
      ValidatorUtil.isLengthGreaterThan(this, maxLength);

  /// Checks if length of list is GREATER OR EQUAL to maxLength.
  bool isLengthGreaterOrEqual(int maxLength) =>
      ValidatorUtil.isLengthGreaterOrEqual(this, maxLength);

  /// Checks if length of list is EQUAL than maxLength.
  bool isLengthEqualTo(int maxLength) =>
      ValidatorUtil.isLengthEqualTo(this, maxLength);

  /// Checks if length of list is BETWEEN minLength to maxLength.
  bool isLengthBetween(int minLength, int maxLength) =>
      ValidatorUtil.isLengthBetween(this, minLength, maxLength);
}
