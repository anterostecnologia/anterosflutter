import 'dart:async';
import 'package:flutter/material.dart';

class AnterosCarousel extends StatefulWidget {
  /// Cria apresentação de slides de Imagens e [Widget] com animação para deslizar.
  const AnterosCarousel({
    Key? key,
    required this.items,
    this.pagerSize,
    this.passiveIndicator,
    this.activeIndicator,
    this.activeDotBorder,
    this.passiveDotBorder,
    this.hasPagination,
    this.height,
    this.aspectRatio = 16 / 9,
    this.viewportFraction = 0.8,
    this.initialPage = 0,
    this.enableInfiniteScroll = true,
    this.reverse = false,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.pauseAutoPlayOnTouch,
    this.enlargeMainPage = false,
    this.onPageChanged,
    this.scrollPhysics,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  /// O tamanho dos pontos de paginação pode ser definido usando [double].
  final double? pagerSize;

  /// A cor ativa da paginação do slider.
  final Color? activeIndicator;

  /// A cor passiva da paginação do slider.
  final Color? passiveIndicator;

  /// A borda ativa da paginação do slider.
  final Border? activeDotBorder;

  /// A borda passiva da paginação do slider.
  final Border? passiveDotBorder;

  /// O [AnterosCarousel] mostra a paginação no estado true.
  final bool? hasPagination;

  /// Os widgets a serem mostrados como controles deslizantes.
  final List<Widget> items;

  /// Define a altura do widget do slide e substitui qualquer [aspectRatio] existente.
  final double? height;

  /// A proporção é usada se nenhuma altura foi declarada. O padrão é a proporção de 16:9.
  final double aspectRatio;

  /// A fração da janela de visualização que cada página deve ocupar. O padrão é 0,8, o que significa que cada página preenche 80% do slide.
  final num viewportFraction;

  /// A página inicial a ser exibida ao criar o [AnterosCarousel]. O padrão é 0.
  final int initialPage;

  /// Determina se os slides devem fazer um loop infinito ou ser limitados ao tamanho do item. O padrão é true, ou seja, loop infinito.
  final bool enableInfiniteScroll;

  /// Inverte a ordem dos itens se definido como verdadeiro. O padrão é falso.
  final bool reverse;

  /// Ativa a reprodução automática, deslizando uma página por vez. Use [autoPlayInterval] para determinar a frequência dos slides. O padrão é falso.
  final bool autoPlay;

  /// Define Duration para determinar a frequência dos slides quando [autoPlay] é definido como true. O padrão é 4 segundos.
  final Duration autoPlayInterval;

  /// A duração da animação besttuckValue duas páginas de transição durante a reprodução automática. O padrão é 800 ms.
  final Duration autoPlayAnimationDuration;

  /// Determina a física da curva de animação. O padrão é [Curves.fastOutSlowIn].
  final Curve autoPlayCurve;

  /// Define um temporizador no toque detectado que pausa a reprodução automática com a [Duração] fornecida. A detecção de toque só está ativa se [autoPlay] for verdadeiro.
  final Duration? pauseAutoPlayOnTouch;

  /// Determina se a página atual deve ser maior que as imagens laterais,
  /// criando uma sensação de profundidade no carrossel. O padrão é falso.
  /// funciona apenas se viewportFraction estiver definido como 1.0.
  final bool enlargeMainPage;

  /// O eixo ao longo do qual a visualização da página rola. O padrão é [Eixo.horizontal].
  final Axis scrollDirection;

  /// Chamado sempre que a página no centro da janela de visualização é alterada.
  final Function(int index)? onPageChanged;

  /// Como o carrossel deve responder à entrada do usuário.
  ///
  /// Por exemplo, determina como os itens continuam a animar após o
  /// o usuário para de arrastar a visualização da página.
  ///
  /// A física é modificada para encaixar nos limites da página usando
  /// [PageScrollPhysics] antes de ser usado.
  ///
  /// Padrões para as convenções de plataforma correspondentes.
  final ScrollPhysics? scrollPhysics;

  List<T> map<T>(List list, Function handler) {
    List<T> result;
    result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  _AnterosCarouselState createState() => _AnterosCarouselState();
}

class _AnterosCarouselState extends State<AnterosCarousel>
    with TickerProviderStateMixin {
  Timer? timer;

  /// tamanho da célula
  double size = 0;

  /// Largura do container de células
  double width = 0;

  /// [pageController] é criado usando as propriedades passadas para o construtor
  /// e pode ser usado para controlar o [PageView] para o qual é passado.
  late PageController pageController;

  /// O índice real do [PageView].
  int realPage = 10000;
  int? currentSlide;

  @override
  void initState() {
    super.initState();
    currentSlide = widget.initialPage;
    realPage = widget.enableInfiniteScroll
        // ignore: avoid_as
        ? realPage + widget.initialPage
        // ignore: avoid_as
        : widget.initialPage;
    pageController = PageController(
        // ignore: avoid_as
        viewportFraction: widget.viewportFraction as double,
        // initialPage: widget.enableInfiniteScroll
        //     // ignore: avoid_as
        //     ? realPage + widget.initialPage
        //     // ignore: avoid_as
        //     : widget.initialPage,
        initialPage: realPage);
    timer = getPlayTimer();
  }

  Timer getPlayTimer() => Timer.periodic(widget.autoPlayInterval, (_) {
        if (widget.autoPlay && widget.items.length > 1) {
          pageController.nextPage(
              duration: widget.autoPlayAnimationDuration,
              curve: widget.autoPlayCurve);
        }
      });

  void pauseOnTouch() {
    timer?.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch!, () {
      timer = getPlayTimer();
    });
  }

  Widget getPageWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = Container(height: widget.height, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void onPageSlide(int index) {
    setState(() => currentSlide = index);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          getPageWrapper(PageView.builder(
            physics: widget.scrollPhysics,
            scrollDirection: widget.scrollDirection,
            controller: pageController,
            reverse: widget.reverse,
            // itemCount: widget.items.length == 1
            //     ? widget.items.length
            //     : widget.enableInfiniteScroll
            //         ? null
            //         : widget.items.length,
            itemCount: widget.enableInfiniteScroll ? null : widget.items.length,
            onPageChanged: (int index) {
              int currentPage;

              currentPage = _getRealIndex(
                  index + widget.initialPage, realPage, widget.items.length);
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(currentPage);
              }
              if (widget.hasPagination == true) {
                onPageSlide(currentPage);
              }
            },
            itemBuilder: (BuildContext context, int i) {
              int index;
              index = _getRealIndex(
                i + widget.initialPage,
                realPage,
                widget.items.length,
              );
              currentSlide = widget.initialPage;
              return AnimatedBuilder(
                animation: pageController,
                child: widget.items[index],
                builder: (BuildContext context, child) {
                  double value;
                  try {
                    value = pageController.page! - i;
                    // ignore: avoid_catches_without_on_clauses
                  } catch (e) {
                    final BuildContext storageContext =
                        pageController.position.context.storageContext;
                    final double? previousSavedPosition =
                        PageStorage.of(storageContext)
                            ?.readState(storageContext);
                    if (previousSavedPosition != null) {
                      value = previousSavedPosition - i.toDouble();
                    } else {
                      value = realPage.toDouble() - i.toDouble();
                    }
                  }
                  value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

                  final double height = widget.height ??
                      MediaQuery.of(context).size.width *
                          (1 / widget.aspectRatio);

                  final double distortionValue = widget.enlargeMainPage
                      ? Curves.easeOut.transform(value)
                      : 1.0;

                  if (widget.scrollDirection == Axis.horizontal) {
                    return Center(
                      child: SizedBox(
                        height: distortionValue * height,
                        child: child,
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                          width: distortionValue *
                              MediaQuery.of(context).size.width,
                          child: child),
                    );
                  }
                },
              );
            },
          )),
          widget.hasPagination == true
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.map<Widget>(
                          widget.items,
                          (pagerIndex, url) => Container(
                                width: widget.pagerSize == null
                                    ? 8.0
                                    : widget.pagerSize,
                                height: widget.pagerSize == null
                                    ? 8.0
                                    : widget.pagerSize,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 2),
                                decoration: BoxDecoration(
                                  border: currentSlide == pagerIndex
                                      ? widget.activeDotBorder
                                      : widget.passiveDotBorder,
                                  shape: BoxShape.circle,
                                  color: currentSlide == pagerIndex
                                      ? widget.activeIndicator == null
                                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                                          : widget.activeIndicator!
                                      : widget.passiveIndicator == null
                                          ? const Color.fromRGBO(0, 0, 0, 0.4)
                                          : widget.passiveIndicator!,
                                ),
                              )
                          // ignore: avoid_as
                          ),
                    ),
                  ),
                )
              : Container(),
        ],
      );
}

/// Converte um índice de um tamanho definido para o índice correspondente de uma coleção de outro tamanho
/// como se fossem circulares.
///
/// Pega uma [posição] da coleção Foo, uma [base] de onde o índice de Foo se originou
/// e o [comprimento] de uma segunda coleção Baa, para a qual o índice de correlação é procurado.
///
/// Por exemplo; Temos um carrossel de 10.000 (simulando o infinito), mas apenas 6 imagens.
/// Precisamos repetir as imagens para dar a ilusão de um fluxo sem fim.
/// Chamando _getRealIndex com position e base obtemos um offset.
/// Este módulo de deslocamento nosso comprimento, 6, retornará um número bestuckValue 0 e 5, que representam a imagem
/// para ser colocado na posição dada.
int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

/// Retorna o restante da operação do módulo [input] % [source], e ajusta para
/// valores negativos.
int _remainder(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}
