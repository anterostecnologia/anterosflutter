import 'package:anterosflutter/components/extensions/utils/validator_util.dart';

extension MapValidation on Map {
  /// Checks if data is null.
  bool isNull() => ValidatorUtil.isNull(this);

  /// Checks if data is null or Blank (Empty or only contains whitespace).
  bool isNullOrBlank() => ValidatorUtil.isNullOrBlank(this);

  /// Checks if length of map is LOWER than maxLength.
  bool isLengthLowerThan(int maxLength) =>
      ValidatorUtil.isLengthLowerThan(this, maxLength);

  /// Checks if length of map is LOWER OR EQUAL to maxLength.
  bool isLengthLowerOrEqual(int maxLength) =>
      ValidatorUtil.isLengthLowerOrEqual(this, maxLength);

  /// Checks if length of map is GREATER than maxLength.
  bool isLengthGreaterThan(int maxLength) =>
      ValidatorUtil.isLengthGreaterThan(this, maxLength);

  /// Checks if length of map is GREATER OR EQUAL to maxLength.
  bool isLengthGreaterOrEqual(int maxLength) =>
      ValidatorUtil.isLengthGreaterOrEqual(this, maxLength);

  /// Checks if length of map is EQUAL than maxLength.
  bool isLengthEqualTo(int maxLength) =>
      ValidatorUtil.isLengthEqualTo(this, maxLength);

  /// Checks if length of map is BETWEEN minLength to maxLength.
  bool isLengthBetween(int minLength, int maxLength) =>
      ValidatorUtil.isLengthBetween(this, minLength, maxLength);
}
