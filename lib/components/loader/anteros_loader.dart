import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosLoader extends StatefulWidget {
  /// [AnterosLoader] mostra diferentes tipos de carregadores com diferentes opções de personalização.
  const AnterosLoader(
      {Key? key,
      this.loaderColorOne = Colors.redAccent,
      this.loaderColorTwo = Colors.green,
      this.loaderColorThree = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.type = AnterosLoaderType.android,
      this.loaderIconOne,
      this.loaderIconTwo,
      this.loaderIconThree,
      this.androidLoaderColor,
      this.loaderstrokeWidth = 4.0,
      this.size = AnterosSize.MEDIUM,
      this.child})
      : super(key: key);

  /// Tipo de [Widget] usado apenas no tipo personalizado e é proeminente sobre o loaderIconOne, loaderIconTwo, loaderIconThree no tipo personalizado
  final Widget? child;

  /// Tipo de AnterosColor ou [Color] que define a cor do primeiro ponto apenas no tipo círculo ou quadrado do carregador
  final Color loaderColorOne;

  /// Tipo de AnterosColor ou [Color] que define a cor do segundo ponto apenas no tipo círculo ou quadrado do carregador
  final Color loaderColorTwo;

  /// Tipo de AnterosColor ou [Color] que define a cor do terceiro ponto apenas no tipo círculo ou quadrado do carregador
  final Color loaderColorThree;

  /// Tipo de duração que define a duração da animação do carregador apenas no tipo círculo e quadrado do carregador
  final Duration duration;

  /// Tipo de [AnterosLoaderType] ou seja, android, ios, circle , square e custom
  final AnterosLoaderType type;

  /// Tipo de [Widget] que leva texto, ícones ou imagens para o primeiro ponto apenas no tipo personalizado de carregador
  final Widget? loaderIconOne;

  /// Tipo de [Widget] que leva texto, ícones ou imagens para o segundo ponto apenas no tipo personalizado de carregador
  final Widget? loaderIconTwo;

  /// Tipo de [Widget] que leva texto, ícones ou imagens para o terceiro ponto apenas no tipo personalizado de carregador
  final Widget? loaderIconThree;

  /// tipo de Animation<Color> usado para alterar apenas a cor do carregador do Android
  final Animation<Color>? androidLoaderColor;

  /// tipo de [double] usado para alterar a largura do traço apenas do carregador do Android
  final double loaderstrokeWidth;

  /// tipo de [double] ou [AnterosSize], ou seja, pequeno, médio ou grande que é usado
  /// para alterar apenas o tamanho dos carregadores android, ios, circle e square
  final double size;

  @override
  _AnterosLoaderState createState() => _AnterosLoaderState();
}

class _AnterosLoaderState extends State<AnterosLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> loaderAnimation1;
  late Animation<double> loaderAnimation2;
  late Animation<double> loaderAnimation3;
  late AnimationController controller;
  Interval interval = const Interval(0.1, 0.81, curve: Curves.linear);

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    loaderAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    loaderAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    loaderAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: widget.child != null
            ? Loader(
                radius: widget.size * 0.3,
                type: widget.type,
                child: widget.child,
              )
            : widget.type == AnterosLoaderType.android
                ? Center(
                    child: Container(
                    height: widget.size * 0.7,
                    width: widget.size * 0.7,
                    child: CircularProgressIndicator(
                      valueColor: widget.androidLoaderColor,
                      strokeWidth: widget.loaderstrokeWidth,
                      // value: 20,
                    ),
                  ))
                : widget.type == AnterosLoaderType.ios
                    ? Center(
                        child: CupertinoActivityIndicator(
                            radius: widget.size * 0.4),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Opacity(
                            opacity: loaderAnimation1.value <= 0.3
                                ? 2.5 * loaderAnimation1.value
                                : (loaderAnimation1.value > 0.30 &&
                                        loaderAnimation1.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * loaderAnimation1.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.3,
                                color: widget.loaderColorOne,
                                type: widget.type,
                                icon: widget.loaderIconOne,
                                child: widget.child,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: loaderAnimation2.value <= 0.3
                                ? 2.5 * loaderAnimation2.value
                                : (loaderAnimation2.value > 0.30 &&
                                        loaderAnimation2.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * loaderAnimation2.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.44,
                                color: widget.loaderColorTwo,
                                type: widget.type,
                                icon: widget.loaderIconTwo,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: loaderAnimation3.value <= 0.3
                                ? 2.5 * loaderAnimation3.value
                                : (loaderAnimation3.value > 0.30 &&
                                        loaderAnimation3.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * loaderAnimation3.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.3,
                                color: widget.loaderColorThree,
                                type: widget.type,
                                icon: widget.loaderIconThree,
                              ),
                            ),
                          ),
                        ],
                      ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Loader extends StatelessWidget {
  const Loader(
      {Key? key,
      this.radius,
      this.color,
      this.type,
      this.icon,
      this.size,
      this.child})
      : super(key: key);
  final double? radius;
  final Color? color;
  final AnterosLoaderType? type;
  final Widget? icon;
  final double? size;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Center(
        child: type == AnterosLoaderType.custom
            ? Container(child: child != null ? child : icon ?? Container())
            : Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == AnterosLoaderType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
      );
}
