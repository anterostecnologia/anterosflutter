import 'package:anterosflutter/components/extensions/utils/transform_util.dart';
import 'package:anterosflutter/components/extensions/utils/validator_util.dart';

/// Num extension also works on int
extension IntValidation on int {
  /// Checks if int value is Palindrom.
  bool isPalindrom() =>
      ValidatorUtil.isPalindrom(TransformUtil.numericOnly(this.toString()));

  /// Checks if string is binary (example: 01010101).
  bool isBinary() => ValidatorUtil.isBinary(this.toString());

  /// Checks if all int value are same.
  /// Example: 111111 -> true
  bool isOneAKind() => ValidatorUtil.isOneAKind(this);
}
