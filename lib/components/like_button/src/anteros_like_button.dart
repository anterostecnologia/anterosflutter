import 'package:anterosflutter/components/like_button/anteros_like_button.dart';
import 'package:anterosflutter/components/like_button/src/painter/bubbles_painter.dart';
import 'package:anterosflutter/components/like_button/src/painter/circle_painter.dart';
import 'package:anterosflutter/components/like_button/src/utils/anteros_like_button_util.dart';
import 'package:flutter/material.dart';

class AnterosLikeButton extends StatefulWidget {
  const AnterosLikeButton(
      {Key? key,
      this.size = 30.0,
      this.likeBuilder,
      this.countBuilder,
      double? bubblesSize,
      double? circleSize,
      this.likeCount,
      this.isLiked = false,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.animationDuration = const Duration(milliseconds: 1000),
      this.likeCountAnimationType = LikeCountAnimationType.part,
      this.likeCountAnimationDuration = const Duration(milliseconds: 500),
      this.likeCountPadding = const EdgeInsets.only(left: 3.0),
      this.bubblesColor = const AnterosBubblesColor(
        dotPrimaryColor: Color(0xFFFFC107),
        dotSecondaryColor: Color(0xFFFF9800),
        dotThirdColor: Color(0xFFFF5722),
        dotLastColor: Color(0xFFF44336),
      ),
      this.circleColor = const AnterosCircleColor(
          start: Color(0xFFFF5722), end: Color(0xFFFFC107)),
      this.onTap,
      this.countPostion = CountPostion.right,
      this.padding,
      this.countDecoration})
      : bubblesSize = bubblesSize ?? size * 2.0,
        circleSize = circleSize ?? size * 0.8,
        super(key: key);

  ///tamanho do widget semelhante
  final double size;

  ///duração da animação para mudar o estado isLiked
  final Duration animationDuration;

  ///tamanho total das bolhas
  final double bubblesSize;

  ///cores das bolhas
  final AnterosBubblesColor bubblesColor;

  ///tamanho do círculo
  final double circleSize;

  ///cores do círculo
  final AnterosCircleColor circleColor;

  ///toque na chamada de volta do botão curtir
  final LikeButtonTapCallback? onTap;

  ///se gosta
  final bool? isLiked;

  ///conta de likes
  ///se nulo, não será exibido
  final int? likeCount;

  ///mainAxisAlignment para o botão like
  final MainAxisAlignment mainAxisAlignment;

  ///crossAxisAlignment para o botão curtir
  final CrossAxisAlignment crossAxisAlignment;

  ///construtor para criar um widget semelhante
  final LikeWidgetBuilder? likeBuilder;

  ///construtor para criar um widget de contagem semelhante
  final LikeCountWidgetBuilder? countBuilder;

  ///duração da animação para mudar como contagem
  final Duration likeCountAnimationDuration;

  ///tipo de animação para mudar como count(none,part,all)
  final LikeCountAnimationType likeCountAnimationType;

  ///preenchimento para widget de contagem de curtidas
  final EdgeInsetsGeometry? likeCountPadding;

  ///gosto da posição do widget de contagem
  ///esquerda do widget semelhante
  ///direita do widget como
  ///topo do widget como
  ///parte inferior do widget semelhante
  final CountPostion countPostion;

  /// preenchimento do botão curtir
  final EdgeInsetsGeometry? padding;

  ///retorna o widget de contagem com decoração
  final CountDecoration? countDecoration;
  @override
  State<StatefulWidget> createState() => AnterosLikeButtonState();
}

class AnterosLikeButtonState extends State<AnterosLikeButton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> _outerCircleAnimation;
  late Animation<double> _innerCircleAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _bubblesAnimation;
  late Animation<Offset> _slidePreValueAnimation;
  late Animation<Offset> _slideCurrentValueAnimation;
  AnimationController? _likeCountController;
  late Animation<double> _opacityAnimation;

  bool? _isLiked = false;
  int? _likeCount;
  int? _preLikeCount;
  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    _preLikeCount = _likeCount;

    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _likeCountController = AnimationController(
        duration: widget.likeCountAnimationDuration, vsync: this);

    _initAnimations();
  }

  @override
  void didUpdateWidget(AnterosLikeButton oldWidget) {
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    _preLikeCount = _likeCount;

    if (_controller?.duration != widget.animationDuration) {
      _controller?.dispose();
      _controller =
          AnimationController(duration: widget.animationDuration, vsync: this);
      _initControlAnimation();
    }

    if (_likeCountController?.duration != widget.likeCountAnimationDuration) {
      _likeCountController?.dispose();
      _likeCountController = AnimationController(
          duration: widget.likeCountAnimationDuration, vsync: this);
      _initLikeCountControllerAnimation();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller!.dispose();
    _likeCountController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget likeCountWidget = _getLikeCountWidget();
    if (widget.countDecoration != null) {
      likeCountWidget = widget.countDecoration!(likeCountWidget, _likeCount) ??
          likeCountWidget;
    }
    if (widget.likeCountPadding != null) {
      likeCountWidget = Padding(
        padding: widget.likeCountPadding!,
        child: likeCountWidget,
      );
    }

    List<Widget> children = <Widget>[
      AnimatedBuilder(
        animation: _controller!,
        builder: (BuildContext c, Widget? w) {
          final Widget likeWidget =
              widget.likeBuilder?.call(_isLiked ?? true) ??
                  defaultWidgetBuilder(_isLiked ?? true, widget.size);
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: (widget.size - widget.bubblesSize) / 2.0,
                left: (widget.size - widget.bubblesSize) / 2.0,
                child: CustomPaint(
                  size: Size(widget.bubblesSize, widget.bubblesSize),
                  painter: BubblesPainter(
                    currentProgress: _bubblesAnimation.value,
                    color1: widget.bubblesColor.dotPrimaryColor,
                    color2: widget.bubblesColor.dotSecondaryColor,
                    color3: widget.bubblesColor.dotThirdColorReal,
                    color4: widget.bubblesColor.dotLastColorReal,
                  ),
                ),
              ),
              Positioned(
                top: (widget.size - widget.circleSize) / 2.0,
                left: (widget.size - widget.circleSize) / 2.0,
                child: CustomPaint(
                  size: Size(widget.circleSize, widget.circleSize),
                  painter: CirclePainter(
                    innerCircleRadiusProgress: _innerCircleAnimation.value,
                    outerCircleRadiusProgress: _outerCircleAnimation.value,
                    circleColor: widget.circleColor,
                  ),
                ),
              ),
              Container(
                width: widget.size,
                height: widget.size,
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: ((_isLiked ?? true) && _controller!.isAnimating)
                      ? _scaleAnimation.value
                      : 1.0,
                  child: SizedBox(
                    child: likeWidget,
                    height: widget.size,
                    width: widget.size,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      likeCountWidget
    ];

    if (widget.countPostion == CountPostion.left ||
        widget.countPostion == CountPostion.top) {
      children = children.reversed.toList();
    }
    Widget result = (widget.countPostion == CountPostion.left ||
            widget.countPostion == CountPostion.right)
        ? Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            children: children,
          )
        : Column(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            children: children,
          );

    if (widget.padding != null) {
      result = Padding(
        padding: widget.padding!,
        child: result,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: result,
    );
  }

  Widget _getLikeCountWidget() {
    if (_likeCount == null) {
      return Container();
    }
    final String likeCount = _likeCount.toString();
    final String preLikeCount = _preLikeCount.toString();

    int didIndex = 0;
    if (preLikeCount.length == likeCount.length) {
      for (; didIndex < likeCount.length; didIndex++) {
        if (likeCount[didIndex] != preLikeCount[didIndex]) {
          break;
        }
      }
    }
    final bool allChange =
        preLikeCount.length != likeCount.length || didIndex == 0;

    Widget result;

    if (widget.likeCountAnimationType == LikeCountAnimationType.none ||
        _likeCount == _preLikeCount) {
      result = _createLikeCountWidget(
          _likeCount, _isLiked ?? true, _likeCount.toString());
    } else if (widget.likeCountAnimationType == LikeCountAnimationType.part &&
        !allChange) {
      final String samePart = likeCount.substring(0, didIndex);
      final String preText =
          preLikeCount.substring(didIndex, preLikeCount.length);
      final String text = likeCount.substring(didIndex, likeCount.length);
      final Widget preSameWidget =
          _createLikeCountWidget(_preLikeCount, !(_isLiked ?? true), samePart);
      final Widget currentSameWidget =
          _createLikeCountWidget(_likeCount, _isLiked ?? true, samePart);
      final Widget preWidget =
          _createLikeCountWidget(_preLikeCount, !(_isLiked ?? true), preText);
      final Widget currentWidget =
          _createLikeCountWidget(_likeCount, _isLiked ?? true, text);

      result = AnimatedBuilder(
          animation: _likeCountController!,
          builder: (BuildContext b, Widget? w) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.hardEdge,
                    children: <Widget>[
                      Opacity(
                        child: currentSameWidget,
                        opacity: _opacityAnimation.value,
                      ),
                      Opacity(
                        child: preSameWidget,
                        opacity: 1.0 - _opacityAnimation.value,
                      ),
                    ],
                  ),
                  Stack(
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.hardEdge,
                    children: <Widget>[
                      FractionalTranslation(
                          translation: _preLikeCount! > _likeCount!
                              ? _slideCurrentValueAnimation.value
                              : -_slideCurrentValueAnimation.value,
                          child: currentWidget),
                      FractionalTranslation(
                          translation: _preLikeCount! > _likeCount!
                              ? _slidePreValueAnimation.value
                              : -_slidePreValueAnimation.value,
                          child: preWidget),
                    ],
                  )
                ],
              ),
            );
          });
    } else {
      result = AnimatedBuilder(
        animation: _likeCountController!,
        builder: (BuildContext b, Widget? w) {
          return Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              FractionalTranslation(
                  translation: _preLikeCount! > _likeCount!
                      ? _slideCurrentValueAnimation.value
                      : -_slideCurrentValueAnimation.value,
                  child: _createLikeCountWidget(
                      _likeCount, _isLiked ?? true, _likeCount.toString())),
              FractionalTranslation(
                  translation: _preLikeCount! > _likeCount!
                      ? _slidePreValueAnimation.value
                      : -_slidePreValueAnimation.value,
                  child: _createLikeCountWidget(_preLikeCount,
                      !(_isLiked ?? true), _preLikeCount.toString())),
            ],
          );
        },
      );
    }

    result = ClipRect(
      child: result,
      clipper: AnterosLikeCountClip(),
    );

    return result;
  }

  Widget _createLikeCountWidget(int? likeCount, bool isLiked, String text) {
    return widget.countBuilder?.call(likeCount, isLiked, text) ??
        Text(text, style: const TextStyle(color: Colors.grey));
  }

  void onTap() {
    if (_controller!.isAnimating || _likeCountController!.isAnimating) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(_isLiked ?? true).then((bool? isLiked) {
        _handleIsLikeChanged(isLiked);
      });
    } else {
      _handleIsLikeChanged(!(_isLiked ?? true));
    }
  }

  void _handleIsLikeChanged(bool? isLiked) {
    if (_isLiked == null) {
      if (_likeCount != null) {
        _preLikeCount = _likeCount;
        _likeCount = _likeCount! + 1;
      }
      if (mounted) {
        setState(() {
          _controller!.reset();
          _controller!.forward();

          if (widget.likeCountAnimationType != LikeCountAnimationType.none) {
            _likeCountController!.reset();
            _likeCountController!.forward();
          }
        });
      }
      return;
    }

    if (isLiked != null && isLiked != _isLiked) {
      if (_likeCount != null) {
        _preLikeCount = _likeCount;
        if (isLiked) {
          _likeCount = _likeCount! + 1;
        } else {
          _likeCount = _likeCount! - 1;
        }
      }
      _isLiked = isLiked;

      if (mounted) {
        setState(() {
          if (_isLiked!) {
            _controller!.reset();
            _controller!.forward();
          }
          if (widget.likeCountAnimationType != LikeCountAnimationType.none) {
            _likeCountController!.reset();
            _likeCountController!.forward();
          }
        });
      }
    }
  }

  void _initAnimations() {
    _initControlAnimation();
    _initLikeCountControllerAnimation();
  }

  void _initLikeCountControllerAnimation() {
    _slidePreValueAnimation = _likeCountController!.drive(Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ));
    _slideCurrentValueAnimation = _likeCountController!.drive(Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ));

    _opacityAnimation = _likeCountController!.drive(Tween<double>(
      begin: 0.0,
      end: 1.0,
    ));
  }

  void _initControlAnimation() {
    _outerCircleAnimation = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );
    _innerCircleAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.2,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );
    final Animation<double> animate = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.35,
          0.7,
          curve: AnterosOvershootCurve(),
        ),
      ),
    );
    _scaleAnimation = animate;
    _bubblesAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.1,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
