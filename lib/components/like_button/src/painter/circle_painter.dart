import 'package:anterosflutter/components/like_button/anteros_like_button.dart';
import 'package:anterosflutter/components/like_button/src/utils/anteros_like_button_util.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter(
      {required this.outerCircleRadiusProgress,
      required this.innerCircleRadiusProgress,
      this.circleColor = const AnterosCircleColor(
          start: Color(0xFFFF5722), end: Color(0xFFFFC107))}) {
    _circlePaint.style = PaintingStyle.stroke;
  }
  final Paint _circlePaint = Paint();

  final double outerCircleRadiusProgress;
  final double innerCircleRadiusProgress;
  final AnterosCircleColor circleColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double center = size.width * 0.5;
    _updateCircleColor();
    final double strokeWidth = outerCircleRadiusProgress * center -
        (innerCircleRadiusProgress * center);
    if (strokeWidth > 0.0) {
      _circlePaint.strokeWidth = strokeWidth;
      canvas.drawCircle(Offset(center, center),
          outerCircleRadiusProgress * center, _circlePaint);
    }
  }

  void _updateCircleColor() {
    double colorProgress = clamp(outerCircleRadiusProgress, 0.5, 1.0);
    colorProgress = mapValueFromRangeToRange(colorProgress, 0.5, 1.0, 0.0, 1.0);
    _circlePaint.color =
        Color.lerp(circleColor.start, circleColor.end, colorProgress)!;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate.runtimeType != runtimeType) {
      return true;
    }

    return oldDelegate is CirclePainter &&
        (oldDelegate.outerCircleRadiusProgress != outerCircleRadiusProgress ||
            oldDelegate.innerCircleRadiusProgress !=
                innerCircleRadiusProgress ||
            oldDelegate.circleColor != circleColor);
  }
}
