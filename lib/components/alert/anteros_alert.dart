import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosAlert extends StatefulWidget {
  /// Alerta deve ser encapsulado dentro do corpo como [AnterosFloatingWidget]. Veja [AnterosFloatingWidget]
  const AnterosAlert(
      {Key? key,
      this.content,
      this.title,
      this.child,
      this.backgroundColor,
      this.width,
      this.type = AnterosAlertType.basic,
      this.alignment,
      this.contentChild,
      this.bottombar,
      this.contentTextStyle = const TextStyle(color: Colors.black87),
      this.titleTextStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      )})
      : super(key: key);

  /// filho do tipo [Widget]é uma alternativa à chave de título. o título terá prioridade sobre o filho
  final Widget? child;

  /// título do tipo [String] usado para descrever o título do [AnterosAlert]
  final String? title;

  /// filho do tipo [Widget]é uma alternativa à chave de título. title terá prioridade sobre contentchild
  final Widget? contentChild;

  /// título do tipo [String] usado para descrever o conteúdo do [AnterosAlert]
  final String? content;

  ///tipo de [TextStyle] para alterar o estilo do título não para o filho
  final TextStyle titleTextStyle;

  ///passa cor do tipo [Color] ou [AnterosColors] para background de [AnterosAlert]
  final Color? backgroundColor;

  ///tipo de [TextStyle] para alterar o estilo do conteúdo não para o contentchild
  final TextStyle contentTextStyle;

  /// largura do tipo [double] usado para controlar a largura do [AnterosAlert]
  final double? width;

  ///tipo de [AnterosAlertType] que leva o tipo, ou seja, básico, arredondado e fullWidth para o [AnterosAlert]
  final AnterosAlertType type;

  /// tipo de [Alignment] usado para alinhar o texto dentro do [AnterosAlert]
  final Alignment? alignment;

  ///tipo de [Widget] usado para os botões, ou seja, OK, Cancelar para a ação em [AnterosAlert]
  final Widget? bottombar;

  @override
  _AnterosAlertState createState() => _AnterosAlertState();
}

class _AnterosAlertState extends State<AnterosAlert>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: animation,
        child: Column(
          children: <Widget>[
            Container(
              width: widget.type == AnterosAlertType.fullWidth
                  ? MediaQuery.of(context).size.width
                  : widget.width ?? MediaQuery.of(context).size.width * 0.885,
              constraints: const BoxConstraints(minHeight: 50),
              margin: widget.type == AnterosAlertType.fullWidth
                  ? const EdgeInsets.only(left: 0, right: 0)
                  : const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: widget.type == AnterosAlertType.basic
                      ? BorderRadius.circular(3)
                      : widget.type == AnterosAlertType.rounded
                          ? BorderRadius.circular(10)
                          : BorderRadius.zero,
                  color: widget.backgroundColor != null
                      ? widget.backgroundColor
                      : AnterosColors.WHITE,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.10), blurRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.title != null
                        ? Text(widget.title!, style: widget.titleTextStyle)
                        : (widget.child ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.content != null
                        ? Text(widget.content!, style: widget.contentTextStyle)
                        : (widget.contentChild ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.bottombar ?? Container(),
                ],
              ),
            ),
          ],
        ),
      );
}
