import 'package:anterosflutter/components/extensions/utils/transform_util.dart';
import 'package:regexpattern/regexpattern.dart';

class ValidatorUtil {
  /// Checks if data is null.
  static bool isNull(dynamic s) => s == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool isNullOrBlank(dynamic s) {
    if (isNull(s)) return true;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.isEmpty;
        break;
      default:
        return s.toString() == 'null' || s.toString().trim().isEmpty;
    }
  }

  /// Checks if string is int or double.
  static bool isNum(String s) {
    if (isNull(s)) return false;
    return num.tryParse(s) is num ?? false;
  }

  /// Checks if string consist only numeric.
  /// Numeric only doesnt accepting "." which double data type have
  static bool isNumericOnly(String s) => s.isNumeric();

  /// Checks if string consist only Alphabet. (No Whitespace)
  static bool isAlphabetOnly(String s) => s.isAlphabet();

  /// Checks if string is boolean.
  static bool isBool(String s) {
    if (isNull(s)) return false;
    return (s == 'true' || s == 'false');
  }

  /// Checks if string is an vector file.
  static bool isVector(String s) => s.isVector();

  /// Checks if string is an image file.
  static bool isImage(String s) => s.isImage();

  /// Checks if string is an audio file.
  static bool isAudio(String s) => s.isAudio();

  /// Checks if string is an video file.
  static bool isVideo(String s) => s.isVideo();

  /// Checks if string is an txt file.
  static bool isTxt(String s) => s.isTxt();

  /// Checks if string is an Doc file.
  static bool isDocument(String s) => s.isDoc();

  /// Checks if string is an Excel file.
  static bool isExcel(String s) => s.isExcel();

  /// Checks if string is an PPT file.
  static bool isPPT(String s) => s.isPPT();

  /// Checks if string is an APK file.
  static bool isAPK(String s) => s.isApk();

  /// Checks if string is an video file.
  static bool isPDF(String s) => s.isPdf();

  /// Checks if string is an HTML file.
  static bool isHTML(String s) => s.isHtml();

  /// Checks if string is URL.
  static bool isURL(String s) => s.isUrl();

  /// Checks if string is email.
  static bool isEmail(String s) => s.isEmail();

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) => s.isPhone();

  /// Checks if string is DateTime (UTC or Iso8601).
  static bool isDateTime(String s) => s.isDateTimeUTC();

  /// Checks if string is MD5 hash.
  static bool isMD5(String s) => s.isMD5();

  /// Checks if string is SHA1 hash.
  static bool isSHA1(String s) => s.isSHA1();

  /// Checks if string is SHA256 hash.
  static bool isSHA256(String s) => s.isSHA256();

  /// Checks if string is ISBN 10 or 13.
  static bool isISBN(String s) => s.isISBN();

  /// Checks if string is Github Repository.
  static bool isGithubRepo(String s) => s.isGithub();

  /// Checks if string is SSN (Social Security Number).
  static bool isSSN(String s) => s.isSSN();

  /// Checks if string is binary.
  static bool isBinary(String s) => s.isBinary();

  /// Checks if string is IPv4.
  static bool isIPv4(String s) => s.isIPV4();

  /// Checks if string is IPv6.
  static bool isIPv6(String s) => s.isIPV6();

  /// Checks if string is hexadecimal.
  /// Example: HexColor => #12F
  static bool isHexadecimal(String s) => s.isHex();

  /// Checks if string is Palindrom.
  static bool isPalindrom(String s) {
    bool isPalindrom = true;
    for (var i = 0; i < s.length; i++) {
      if (s[i] != s[s.length - i - 1]) isPalindrom = false;
    }
    return isPalindrom;
  }

  /// Checks if all data have same value.
  /// Example: 111111 -> true, wwwww -> true, [1,1,1,1] -> true
  static bool isOneAKind(dynamic s) {
    if ((s is String || s is List) && !isNullOrBlank(s)) {
      var first = s[0];
      var isOneAKind = true;
      for (var i = 0; i < s.length; i++) {
        if (s[i] != first) isOneAKind = false;
      }
      return isOneAKind;
    }
    if (s is int) {
      String value = s.toString();
      var first = value[0];
      var isOneAKind = true;
      for (var i = 0; i < value.length; i++) {
        if (value[i] != first) isOneAKind = false;
      }
      return isOneAKind;
    }
    return false;
  }

  /// Checks if string is Passport No.
  static bool isPassport(String s) => s.isPassport();

  /// Checks if string is Currency.
  static bool isCurrency(String s) => s.isCurrency();

  /// Checks if length of data is LOWER than maxLength.
  static bool isLengthLowerThan(dynamic s, int maxLength) {
    if (isNull(s)) return (maxLength <= 0) ? true : false;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.length < maxLength;
        break;
      case int:
        return s.toString().length < maxLength;
        break;
      case double:
        return s.toString().replaceAll('.', '').length < maxLength;
        break;
      default:
        return false;
    }
  }

  /// Checks if length of data is GREATER than maxLength.
  static bool isLengthGreaterThan(dynamic s, int maxLength) {
    if (isNull(s)) return false;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.length > maxLength;
        break;
      case int:
        return s.toString().length > maxLength;
        break;
      case double:
        return s.toString().replaceAll('.', '').length > maxLength;
        break;
      default:
        return false;
    }
  }

  /// Checks if length of data is GREATER OR EQUAL to maxLength.
  static bool isLengthGreaterOrEqual(dynamic s, int maxLength) {
    if (isNull(s)) return false;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.length >= maxLength;
        break;
      case int:
        return s.toString().length >= maxLength;
        break;
      case double:
        return s.toString().replaceAll('.', '').length >= maxLength;
        break;
      default:
        return false;
    }
  }

  /// Checks if length of data is LOWER OR EQUAL to maxLength.
  static bool isLengthLowerOrEqual(dynamic s, int maxLength) {
    if (isNull(s)) return false;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.length <= maxLength;
        break;
      case int:
        return s.toString().length <= maxLength;
        break;
      case double:
        return s.toString().replaceAll('.', '').length <= maxLength;
      default:
        return false;
    }
  }

  /// Checks if length of data is EQUAL to maxLength.
  static bool isLengthEqualTo(dynamic s, int maxLength) {
    if (isNull(s)) return false;
    switch (s.runtimeType) {
      case String:
      case List:
      case Map:
      case Set:
      case Iterable:
        return s.length == maxLength;
        break;
      case int:
        return s.toString().length == maxLength;
        break;
      case double:
        return s.toString().replaceAll('.', '').length == maxLength;
        break;
      default:
        return false;
    }
  }

  /// Checks if length of data is BETWEEN minLength to maxLength.
  static bool isLengthBetween(dynamic s, int minLength, int maxLength) {
    if (isNull(s)) return false;
    return isLengthGreaterOrEqual(s, minLength) &&
        isLengthLowerOrEqual(s, maxLength);
  }

  /// Checks if a contains b (Treating or interpreting upper- and lowercase letters as being the same).
  static bool isCaseInsensitiveContains(String a, String b) =>
      a.toLowerCase().contains(b.toLowerCase());

  /// Checks if a contains b or b contains a (Treating or interpreting upper- and lowercase letters as being the same).
  static bool isCaseInsensitiveContainsAny(String a, String b) {
    String lowA = a.toLowerCase();
    String lowB = b.toLowerCase();
    return lowA.contains(lowB) || lowB.contains(lowA);
  }

  /// Checks if num a LOWER than num b.
  static bool isLowerThan(num a, num b) => a < b;

  /// Checks if num a GREATER than num b.
  static bool isGreaterThan(num a, num b) => a > b;

  /// Checks if num a EQUAL than num b.
  static bool isEqual(num a, num b) => a == b;

  /// Checks if string value is camelcase.
  static bool isCamelCase(String s) => s == TransformUtil.camelCase(s);

  /// Checks if string value is capitalize.
  static bool isCapitalize(String s, {bool firstOnly = false}) =>
      s == TransformUtil.capitalize(s, firstOnly: firstOnly);
}
