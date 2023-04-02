import 'package:anterosflutter/components/notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

extension TextExtension on Text {
  Text cloneTitle() {
    return Text(
      data ?? '',
      style: style ??
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text cloneDescription() {
    return Text(
      data ?? '',
      style: style ??
          const TextStyle(
            fontSize: 12,
          ),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}

extension NotificationPositionExtension on AnterosNotificationPosition {
  Alignment get alignment {
    switch (this) {
      case AnterosNotificationPosition.center:
        return Alignment.center;
      case AnterosNotificationPosition.centerRight:
        return Alignment.centerRight;
      case AnterosNotificationPosition.centerLeft:
        return Alignment.centerLeft;
      case AnterosNotificationPosition.topCenter:
        return Alignment.topCenter;
      case AnterosNotificationPosition.topRight:
        return Alignment.topRight;
      case AnterosNotificationPosition.topLeft:
        return Alignment.topLeft;
      case AnterosNotificationPosition.bottomCenter:
        return Alignment.bottomCenter;
      case AnterosNotificationPosition.bottomRight:
        return Alignment.bottomRight;
      case AnterosNotificationPosition.bottomLeft:
        return Alignment.bottomLeft;
      default:
        return Alignment.topCenter;
    }
  }
}
