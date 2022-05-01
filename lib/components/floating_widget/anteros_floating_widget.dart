import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosFloatingWidget extends StatefulWidget {
  /// Cria um corpo flutuante pode ser usado para exibir as mensagens rápidas, avisos e erros.
  /// Dentro do widget flutuante [AnterosToast] pode ser usado como corpo. Veja [AnterosToast]
  const AnterosFloatingWidget(
      {Key? key,
      this.child,
      this.horizontalPosition,
      this.verticalPosition,
      this.blurnessColor,
      this.showBlurness = false,
      this.body})
      : super(key: key);

  ///filho do tipo [Widget] que flutua pelo corpo com base na posição horizontal e vertical
  final Widget? child;

  ///corpo do tipo [Widget] que é igual ao corpo do Scaffold
  final Widget? body;

  /// horizontalPosition do tipo [double] que alinha o filho horizontalmente ao longo do corpo
  final double? horizontalPosition;

  /// verticalPosition do tipo [double] que alinha o filho verticalmente ao longo do corpo
  final double? verticalPosition;

  ///blurnessColor de tye [Color] ou [AnterosColors] que é usado para desfocar o backgroundColor sempre que o [child] é usado em [AnterosFloatingWidget]
  final Color? blurnessColor;

  ///tipo de bool que permite mostrar ou ocultar a desfocagem do backgroundColor sempre que o [filho] for usado em [AnterosFloatingWidget]
  final bool showBlurness;

  @override
  _AnterosFloatingWidgetState createState() => _AnterosFloatingWidgetState();
}

class _AnterosFloatingWidgetState extends State<AnterosFloatingWidget> {
  Widget? child;

  @override
  void initState() {
    child = widget.child;
    super.initState();
  }

  @override
  void didUpdateWidget(AnterosFloatingWidget oldWidget) {
    child = widget.child;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: widget.body ?? Container(),
          ),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: widget.showBlurness
                  ? widget.blurnessColor ?? Colors.black54
                  : null,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: widget.verticalPosition ?? 0.0,
                    left: widget.horizontalPosition ?? 0.0,
                    child: widget.child ?? Container(),
                  )
                ],
              ),
            ),
          )
        ],
      );
}
