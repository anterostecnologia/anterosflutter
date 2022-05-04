import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosShimmer extends StatefulWidget {
  /// [AnterosShimmer] mostra o efeito de brilho.
  const AnterosShimmer({
    Key? key,
    required this.child,
    this.gradient,
    this.direction = AnterosShimmerDirection.leftToRight,
    this.duration = const Duration(milliseconds: 1500),
    this.shimmerEffectCount = 0,
    this.showShimmerEffect = true,
    this.showGradient = false,
    this.mainColor = Colors.grey,
    this.secondaryColor = AnterosColors.LIGHT,
  }) : super(key: key);

  /// O filho do tipo [Widget] para exibir efeito de brilho.
  final Widget child;

  /// controla a velocidade do efeito Shimmer.
  /// O valor padrão é de 1500 milissegundos.
  final Duration duration;

  /// controla a direção do efeito Shimmer.
  /// A direção padrão é anterossHimmerDirection.lefttoright.
  final AnterosShimmerDirection direction;

  /// controla o [child]'S tons de cor usando gradiente linear.
  /// Child [Widget] Só leva a cor do gradiente, se [showGradient] é verdade.
  final Gradient? gradient;

  /// controla a animação ShimmereffectCount.
  /// O valor padrão é '0', que exibe criança [Widget]'s brilhar e efeito para sempre.
  final int shimmerEffectCount;

  /// Controla o efeito da animação, o padrão é o verdadeiro estado que torna a animação ativa.
  final bool showShimmerEffect;

  /// se for verdade, leva a cor do gradiente [gradient] para o [child]'s efeito de brilho.
  /// Padrão definido como falso.
  final bool showGradient;

  /// Defina um diretor do COR [child]'s efeito de brilho.
  /// Child [Widget] leva a cor principal, apenas se [showGradient] é falso.
  /// Predefinição [showGradient] será falso.
  final Color mainColor;

  /// define a cor secundária do [child]'s efeito de brilho.
  /// Child [Widget] toma cor secundária, apenas se [showGradient] é falso.
  /// Predefinição [showGradient] será falso.
  final Color secondaryColor;

  @override
  _AnterosShimmerState createState() => _AnterosShimmerState();
}

class _AnterosShimmerState extends State<AnterosShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.shimmerEffectCount <= 0) {
          _controller.repeat();
        } else if (_count < widget.shimmerEffectCount) {
          _controller.forward(from: 0);
        }
      });
    if (widget.showShimmerEffect) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnterosShimmer oldWidget) {
    if (widget.showShimmerEffect) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (BuildContext context, Widget? child) => _AnterosShimmer(
          child: child,
          direction: widget.direction,
          gradient: widget.showGradient
              ? widget.gradient
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                      widget.mainColor,
                      widget.mainColor,
                      widget.secondaryColor,
                      widget.mainColor,
                      widget.mainColor
                    ],
                  stops: const <double>[
                      0,
                      0.3,
                      0.5,
                      0.7,
                      1
                    ]),
          controllerValue: _controller.value,
          showShimmerEffect: widget.showShimmerEffect,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _AnterosShimmer extends SingleChildRenderObjectWidget {
  const _AnterosShimmer({
    Widget? child,
    this.controllerValue,
    this.direction,
    this.gradient,
    this.showShimmerEffect,
  }) : super(child: child);

  /// valor que controla o controlador de animação
  final double? controllerValue;

  /// Controla a direção do efeito Shimmer.
  /// A direção padrão é anterossHimmerDirection.lefttoright.
  final AnterosShimmerDirection? direction;

  /// Controla o [child]'s tons de cor.
  final Gradient? gradient;

  /// Controla o efeito da animação, o padrão é o verdadeiro estado que torna a animação ativa.
  final bool? showShimmerEffect;

  @override
  AnterosShimmerFilter createRenderObject(BuildContext context) =>
      AnterosShimmerFilter(
          value: controllerValue,
          direction: direction,
          gradient: gradient,
          showShimmerEffect: showShimmerEffect);

  @override
  void updateRenderObject(BuildContext context, AnterosShimmerFilter shimmer) {
    shimmer.controllerValue = controllerValue;
    shimmer.showShimmerEffect = showShimmerEffect;
  }
}

class AnterosShimmerFilter extends RenderProxyBox {
  AnterosShimmerFilter(
      {this.value, this.direction, this.gradient, this.showShimmerEffect})
      : gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  /// Constrói um vazio [Paint] Objeto com todos os campos inicializados com seus padrões.
  final Paint initialPaint = Paint();

  /// Shader que pinta um gradiente de cores.
  final Paint gradientPaint;

  /// Controla o [child]'s tons de cor.
  final Gradient? gradient;

  /// Controla a direção do efeito Shimmer.
  /// A direção padrão é anterossHimmerDirection.lefttoright.
  final AnterosShimmerDirection? direction;

  /// Controla o efeito da animação, o padrão é o verdadeiro estado que torna a animação ativa.
  bool? showShimmerEffect;

  /// valor que controla o controlador de animação.
  double? value;

  /// Construa um retângulo a partir das bordas esquerda, superior, direita e inferior.
  Rect? _rect;

  @override
  bool get alwaysNeedsCompositing => child != null;

  double? get controllerValue => value;

  set controllerValue(double? newValue) {
    if (newValue == value) {
      return;
    }
    value = newValue;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    assert(needsCompositing);

    context.canvas.saveLayer(offset & child!.size, initialPaint);
    context.paintChild(child!, offset);
    Rect rect;
    double dx, dy;
    final double width = child!.size.width;
    final double height = child!.size.height;

    if (direction == AnterosShimmerDirection.leftToRight) {
      dx = _offset(-width, width, value!);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    } else if (direction == AnterosShimmerDirection.bottomToTop) {
      dx = 0.0;
      dy = _offset(height, -height, value!);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else if (direction == AnterosShimmerDirection.topToBottom) {
      dx = 0.0;
      dy = _offset(-height, height, value!);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else {
      dx = _offset(width, -width, value!);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    }
    if (_rect != rect) {
      gradientPaint.shader = gradient?.createShader(rect);
      _rect = rect;
    }
    context.canvas.translate(dx, dy);
    context.canvas.drawRect(rect, gradientPaint);
    context.canvas.restore();
  }

  double _offset(double start, double end, double controllerValue) =>
      start + (end - start) * controllerValue;
}
