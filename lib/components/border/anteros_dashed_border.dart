import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:anterosflutter/types/anteros_border_type.dart';

typedef PathBuilder = Path Function(Size);

class DashedType extends CustomPainter {
  DashedType({
    this.strokeWidth = 2,
    this.dashedLine = const <double>[3, 1],
    this.color = Colors.black,
    this.type = AnterosBorderType.rect,
    this.radius = const Radius.circular(0),
    this.customPath,
  }) : assert(dashedLine.isNotEmpty, 'dash line cannot be empty');

  /// storkeWidth do tipo [double] que é usado para definir a espessura da borda
  final double strokeWidth;

  /// dashedLine do tipo [List<double>] que é usado para a linha tracejada linear e simples da borda
  final List<double> dashedLine;

  /// cor do tipo [Color] ou AnterosColor que é usado para alterar a cor do tipo de borda
  final Color color;

  /// tipo de [AnterosBorderType] que é usado para definir os diferentes tipos de bordas, ou seja, círculo, Rect, RRect e oval
  final AnterosBorderType type;

  /// raio do tipo [Radius] usado para dar uma borda curva somente quando o tipo de borda é RRect, em outros casos o raio não funcionará
  final Radius radius;

  /// customPath do tipo [PathBuilder] usado para desenhar os caminhos
  final PathBuilder? customPath;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    Path? _path;
    if (customPath != null) {
      _path = dashPath(
        customPath!(size),
        dashedarray: CircularIntervalList(dashedLine),
      );
    } else {
      _path = _getPath(size);
    }
    if (_path != null) {
      canvas.drawPath(_path, paint);
    }
  }

  /// Retorna um [Path] baseado no parâmetro borderType
  Path? _getPath(Size size) {
    Path path;
    switch (type) {
      case AnterosBorderType.circle:
        path = _getCirclePath(size);
        break;
      case AnterosBorderType.rRect:
        path = _getRRectPath(size, radius);
        break;
      case AnterosBorderType.rect:
        path = _getRectPath(size);
        break;
      case AnterosBorderType.oval:
        path = _getOvalPath(size);
        break;
    }
    return dashPath(path, dashedarray: CircularIntervalList(dashedLine));
  }

  /// fornece um caminho circular de borderType
  Path _getCirclePath(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double sizes = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            width > sizes ? (width - sizes) / 2 : 0,
            height > sizes ? (height - sizes / 2) : 0,
            sizes,
            sizes,
          ),
          Radius.circular(sizes / 2),
        ),
      );
  }

  /// fornece um caminho retangular arredondado com [raio] de [tamanho] para borderType
  Path _getRRectPath(Size size, Radius radius) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
        radius,
      ),
    );

  /// fornece um caminho retangular com [size] para borderType
  Path _getRectPath(Size size) => Path()
    ..addRect(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  /// fornece um caminho oval de [size] para borderType
  Path _getOvalPath(Size size) => Path()
    ..addOval(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  @override
  bool shouldRepaint(DashedType oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color ||
      oldDelegate.dashedLine != dashedLine ||
      oldDelegate.type != type;
}

class CircularIntervalList<T> {
  CircularIntervalList(this.values);
  final List<T> values;
  int index = 0;
  T get next {
    if (index >= values.length) {
      index = 0;
    }
    return values[index++];
  }
}

Path? dashPath(Path? source,
    {required CircularIntervalList<double> dashedarray,
    DashOffset dashOffset = const DashOffset.absolute(0)}) {
  if (source == null) {
    return null;
  }
  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = dashOffset._calculate(metric.length);
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashedarray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }
  return dest;
}

/// Especifica a posição inicial de uma matriz ou linha tracejada em um caminho, como porcentagem ou absoluta
enum _DashOffsetType { absolute, percentage }

class DashOffset {
  ///dá o deslocamento do caminho tracejado que será medido como uma porcentagem que varia de 0,0 a 1,0
  DashOffset.percentage(double percentage)
      : _value = percentage.clamp(0.0, 1.0),
        _dashOffsetType = _DashOffsetType.percentage;

  ///fornece o deslocamento do caminho pontilhado que será medido como um valor absoluto
  const DashOffset.absolute(double start)
      : _value = start,
        _dashOffsetType = _DashOffsetType.absolute;

  final double _value;
  final _DashOffsetType _dashOffsetType;

  double _calculate(double length) =>
      _dashOffsetType == _DashOffsetType.absolute ? _value : length * _value;
}
