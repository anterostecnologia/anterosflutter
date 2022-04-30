import 'package:flutter/material.dart';

class AnterosBubblesColor {
  const AnterosBubblesColor({
    required this.dotPrimaryColor,
    required this.dotSecondaryColor,
    this.dotThirdColor,
    this.dotLastColor,
  });
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final Color? dotThirdColor;
  final Color? dotLastColor;
  Color get dotThirdColorReal => dotThirdColor ?? dotPrimaryColor;

  Color get dotLastColorReal => dotLastColor ?? dotSecondaryColor;
}

class AnterosCircleColor {
  const AnterosCircleColor({
    required this.start,
    required this.end,
  });
  final Color start;
  final Color end;
  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AnterosCircleColor &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode => hashValues(start, end);
}

class AnterosOvershootCurve extends Curve {
  const AnterosOvershootCurve([this.period = 2.5]);

  final double period;

  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    t -= 1.0;
    return t * t * ((period + 1) * t + period) + 1.0;
  }

  @override
  String toString() {
    return '$runtimeType($period)';
  }
}

class AnterosLikeCountClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Offset.zero & size;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
