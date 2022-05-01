import 'package:flutter/material.dart';
import 'package:anterosflutter/components/border/anteros_dashed_border.dart';
import 'package:anterosflutter/types/anteros_border_type.dart';

class AnterosBorder extends StatelessWidget {
  /// Cria diferentes tipos de bordas em torno de determinado widget filho
  AnterosBorder({
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.type = AnterosBorderType.rect,
    this.dashedLine = const <double>[3, 1],
    this.padding = const EdgeInsets.all(10),
    this.radius = const Radius.circular(0),
    // this.customPath,
  }) : assert(_isValidDashedLine(dashedLine), 'Invalid dash pattern');

  /// filho do tipo [Widget] que pode ser qualquer componente ou texto, etc
  final Widget child;

  /// preenchimento para [filho] onde no preenchimento é dado aos tipos de borda
  final EdgeInsets padding;

  /// storkeWidth do tipo [double] que é usado para definir a espessura da borda
  final double strokeWidth;

  /// cor do tipo [Color] ou AnterosColor que é usado para alterar a cor do tipo de borda
  final Color color;

  /// dashedLine do tipo [List<double>] que é usado para a linha tracejada linear e simples da borda
  final List<double> dashedLine;

  /// tipo de [AnterosBorderType] que é usado para definir os diferentes tipos de bordas, ou seja, círculo, Rect, RRect e oval
  final AnterosBorderType type;

  /// raio do tipo [Radius] usado para dar uma borda curva somente quando o tipo de borda é RRect,
  /// em outros casos, o raio não funcionará
  final Radius radius;

  // /// customPath do tipo [PathBuilder] usado para desenhar os caminhos
  // final PathBuilder customPath;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned.fill(
            child: CustomPaint(
              painter: DashedType(
                strokeWidth: strokeWidth,
                radius: radius,
                color: color,
                type: type,
                dashedLine: dashedLine,
                // customPath: customPath,
              ),
            ),
          ),
          Container(padding: padding, child: child),
        ],
      );
}

/// o valor de dashedLine não pode ser 0 ou null, deve ter algum valor definido e próprio
bool _isValidDashedLine(List<double> dash) {
  final Set<double> _dashSet = dash.toSet();

  if (_dashSet.length == 1 && _dashSet.elementAt(0) == 0.0) {
    return false;
  }
  if (_dashSet.isEmpty) {
    return false;
  }
  return true;
}
