import 'dart:async';
import 'package:flutter/material.dart';

/// Quando um ponteiro entra em contato com a tela e começa a se mover.
///
/// A função fornece a posição do toque quando ele
/// tocou a superfície.
typedef AnterosItemsCarouselSlideStartCallback = void Function(
    DragStartDetails details);

/// Quando um ponteiro que está em contato com a tela e se movendo
/// mudou novamente.
///
/// A função fornece a posição do toque e a distância que ele
/// viajou desde a última atualização.
typedef AnterosItemsCarouselSlideCallback = void Function(
    DragUpdateDetails details);

/// Quando um ponteiro que estava anteriormente em contato com a tela
/// e o movimento não está mais em contato com a tela.
///
/// A velocidade na qual o ponteiro estava se movendo quando parou de entrar em contato
/// a tela.
typedef AnterosItemsCarouselSlideEndCallback = void Function(
    DragEndDetails details);

class AnterosItemsCarousel extends StatefulWidget {
  /// Cria apresentação de slides de Imagens e [Widget] com animação para deslizar.
  /// Mostra vários itens em um slide, o número de itens depende de rowCount.
  const AnterosItemsCarousel({
    Key? key,
    required this.rowCount,
    required this.children,
    this.onSlideStart,
    this.onSlide,
    this.onSlideEnd,
    this.itemHeight = 200,
  }) : super(key: key);

  /// Contagem de células visíveis
  final int rowCount;

  /// Os widgets a serem mostrados como controles deslizantes.
  final List<Widget> children;

  /// Quando um ponteiro entrou em contato com a tela e começou a se mover.
  final AnterosItemsCarouselSlideStartCallback? onSlideStart;

  /// Quando um ponteiro que está em contato com a tela e se movendo
  /// mudou novamente.
  final AnterosItemsCarouselSlideCallback? onSlide;

  /// Quando um ponteiro que estava anteriormente em contato com a tela
  /// e o movimento não está mais em contato com a tela.
  final AnterosItemsCarouselSlideEndCallback? onSlideEnd;

  /// define a altura dos itens
  final double itemHeight;

  @override
  _AnterosItemsCarouselState createState() => _AnterosItemsCarouselState();
}

class _AnterosItemsCarouselState extends State<AnterosItemsCarousel>
    with TickerProviderStateMixin {
  /// Em milissegundos
  static const int dragAnimationDuration = 1000;

  /// Em milissegundos
  static const int shiftAnimationDuration = 300;

  /// tamanho da célula
  double size = 0;

  /// Largura do container de células
  double width = 0;

  late AnimationController animationController;

  /// Deslocamento do contêiner de células
  late double offset;

  @override
  void initState() {
    offset = 0;
    animationController = AnimationController(
        duration: const Duration(milliseconds: dragAnimationDuration),
        vsync: this);
    Future.delayed(Duration.zero, () {
      setState(() {
        final double localWidth = MediaQuery.of(context).size.width;
        width = localWidth;
        size = width / widget.rowCount;
      });
    });
    super.initState();
  }

  double calculateOffset(double shift) {
    double localOffset = offset + shift;
    final double rightLimit = size * (widget.children.length - widget.rowCount);

    /// Verifica os limites do container de células
    if (localOffset > 0) {
      localOffset = 0;
    } else if (localOffset < -rightLimit) {
      localOffset = -rightLimit;
    }
    return localOffset;
  }

  void onSlideStart(DragStartDetails details) {
    animationController.stop();
    if (widget.onSlideStart != null) {
      widget.onSlideStart!(details);
    }
  }

  void onSlide(DragUpdateDetails details) {
    setState(() {
      offset = calculateOffset(3 * details.delta.dx);
    });
    if (widget.onSlide != null) {
      widget.onSlide!(details);
    }
  }

  void onSlideEnd(DragEndDetails details) {
    final double dx = details.velocity.pixelsPerSecond.dx;

    if (dx == 0) {
      return slideAnimation();
    }

    animationController = AnimationController(
        duration: const Duration(milliseconds: dragAnimationDuration),
        vsync: this);

    final Tween tween =
        Tween<double>(begin: offset, end: calculateOffset(0.5 * dx));
    Animation animation;
    animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        slideAnimation();
      }
    });
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });

    animationController.forward();
    if (widget.onSlideEnd != null) {
      widget.onSlideEnd!(details);
    }
  }

  void slideAnimation() {
    final double beginAnimation = offset;
    final double endAnimation = size * (offset / size).round().toDouble();
    animationController = AnimationController(
        duration: const Duration(milliseconds: shiftAnimationDuration),
        vsync: this);
    final Tween tween = Tween<double>(begin: beginAnimation, end: endAnimation);
    final Animation animation = tween.animate(animationController);
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: onSlideStart,
        onHorizontalDragUpdate: onSlide,
        onHorizontalDragEnd: onSlideEnd,
        child: Container(
          width: double.infinity,
          height: widget.itemHeight,
          child: Stack(
            children: [
              Positioned(
                left: offset,
                child: Row(
                  children: widget.children
                      .map((child) => Container(
                            width: size,
                            height: widget.itemHeight,
                            child: child,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
}
