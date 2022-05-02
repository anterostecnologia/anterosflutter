import 'package:anterosflutter/components/extensions/utils/transform_util.dart';
import 'package:anterosflutter/components/extensions/utils/validator_util.dart';

/// Num extension also works on int
extension IntParse on int {
  /// Transform int value to binary string
  String toBinary() => TransformUtil.toBinary(this);

  /// Transform int value to binary int
  int toBinaryInt() => int.parse(TransformUtil.toBinary(this));

  /// Transform int value to binary string
  /// Example: 1111 => 15
  int fromBinary() => TransformUtil.fromBinary(this.toString());

  /// Transform int millisecondsSinceEpoch or microsecondsSinceEpoch (DateTime) to DateTime
  DateTime toDateTime({bool isMicroSeconds = false}) => (isMicroSeconds)
      ? DateTime.fromMicrosecondsSinceEpoch(this)
      : DateTime.fromMillisecondsSinceEpoch(this);

  /// Transform int to SSN (Social Security Number)
  /// Example: 123456789
  String toSSN() {
    String ssn = TransformUtil.toSSN(this.toString());
    if (!ValidatorUtil.isNullOrBlank(ssn)) return ssn;
    throw Exception("Only accepting SSN value");
  }

  /// Transform int value to ISBN (10/13)
  String toISBN() {
    if (ValidatorUtil.isISBN(this.toString())) {
      if (ValidatorUtil.isLengthEqualTo(this, 13)) {
        String s = this.toString();
        return "ISBN-13: ${s.substring(0, 3)}-${s[3]}-${s.substring(4, 7)}-${s.substring(7, 12)}-${s[12]}";
      }
      if (ValidatorUtil.isLengthEqualTo(this, 10)) {
        String s = this.toString();
        return "ISBN-10: ${s[0]}-${s.substring(1, 4)}-${s.substring(4, 9)}-${s[9]}";
      }
    }
    throw Exception("Length must be 10 or 13");
  }
}
