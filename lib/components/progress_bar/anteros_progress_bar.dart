import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosProgressBar extends StatefulWidget {
  /// Mostra o progresso como uma porcentagem concluída e restante na barra de um determinado estado
  AnterosProgressBar({
    Key? key,
    this.margin = const EdgeInsets.only(left: 10, right: 10),
    this.percentage = 0.2,
    this.circleWidth = 5.0,
    this.circleStartAngle = 0.0,
    this.radius,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressBarColor = Colors.red,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 700,
    this.child,
    this.autoLive = true,
    this.animateFromLastPercentage = false,
    this.reverse = false,
    this.mask,
    this.type = AnterosProgressType.linear,
    this.progressHeadType,
    this.lineHeight = 5.0,
    this.width,
    this.fromRightToLeft = false,
    this.leading,
    this.trailing,
    this.padding,
    this.alignment = MainAxisAlignment.start,
    this.clipLinearGradient = false,
  }) : super(key: key) {
    if (linearGradient != null) {
      throw ArgumentError(' linearGradient cannot be given');
    }
    assert(circleStartAngle >= 0.0);
    if (percentage < 0.0 || percentage > 1.0) {
      throw Exception('Percentage value must be be tween 0.0 and 1.0');
    }
  }

  /// largura da barra de progresso
  final double? width;

  /// Altura da Barra de Progresso
  final double lineHeight;

  /// tipo de [Color] ou AnterosColors usado para alterar o backgroundColor da barra de progresso
  final Color backgroundColor;

  /// tipo de Color , usado para alterar a cor da linha de progresso ativa
  final Color progressBarColor;

  /// tipo de bool que permite que a linha de progresso seja animada quando os valores percentuais são alterados
  final bool animation;

  /// duração da animação em milissegundos, só se aplica se o atributo de animação for verdadeiro
  final int animationDuration;

  /// tipo de Widget que vem antes da barra de progresso
  final Widget? leading;

  /// tipo de Widget que vem depois da barra de progresso
  final Widget? trailing;

  /// tipo de Widget que pode ser texto, ícone etc, que geralmente é usado para mostrar a porcentagem de progresso concluído
  final Widget? child;

  /// tipo de MainAxisAlignment usado para alinhar a barra inicial, final e de progresso de uma forma
  final MainAxisAlignment alignment;

  /// tipo de EdgeInsets que dá preenchimento ao AnterosProgressBar
  final EdgeInsets? padding;

  /// tipo de EdgeInsets que dá margem ao AnterosProgressBar
  final EdgeInsets? margin;

  /// defina true se quiser animar a barra de progresso a partir do último valor percentual que você definiu
  final bool animateFromLastPercentage;

  /// Se presente, isso fará com que a barra de progresso seja colorida por este gradiente.
  /// Isso substituirá [progressBarColor]. É um erro fornecer ambos.
  final LinearGradient? linearGradient;

  /// definir false se você não quiser preservar o estado do widget
  final bool autoLive;

  /// definir true se você quiser animar a barra linear da direita para a esquerda
  final bool fromRightToLeft;

  /// Cria um filtro de máscara que pega a forma de progresso que está sendo desenhada e a desfoca.
  final MaskFilter? mask;

  /// Defina true se você deseja exibir apenas parte de [linearGradient] com base no valor progressPercent
  /// Se nenhum [linearGradient] for especificado, esta opção será ignorada.
  final bool clipLinearGradient;

  /// tipo de [AnterosProgressType] que altera a forma da barra de progresso com base no tipo, ou seja, circular e linear
  final AnterosProgressType type;

  /// tipo de [AnterosProgressHeadType] que altera a forma da cabeça de progresso com base no tipo, ou seja, circular e quadrado
  final AnterosProgressHeadType? progressHeadType;

  /// tipo de double que define a espessura do arco do círculo na barra de Progresso Circular
  final double circleWidth;

  /// tipo de double em que o ângulo no círculo começa a progredir (em graus, por exemplo: 0,0, 45,0, 90,0)
  final double circleStartAngle;

  /// tipo de bool usado para exibir o progresso na direção reversa
  final bool reverse;

  /// tipo de double usado para mostrar o raio da Barra de Progresso Circular
  final double? radius;

  /// tipo de double que deve ser de 0 a 1 para indicar o progresso das ProgressBars
  final double percentage;

  @override
  _AnterosProgressBarState createState() => _AnterosProgressBarState();
}

class _AnterosProgressBarState extends State<AnterosProgressBar>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _animationController, circularAnimationController;
  Animation? _animation, circularAnimation;
  double _progressPercent = 0;
  double _percentage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.animation) {
      _animationController = AnimationController(
          duration: Duration(milliseconds: widget.animationDuration),
          vsync: this);
      _animation = Tween(begin: _progressPercent, end: widget.percentage)
          .animate(_animationController!)
        ..addListener(() {
          setState(() {
            _progressPercent = _animation?.value;
          });
        });
      _animationController?.forward();
    } else {
      _updateprogressPercent();
    }

    if (widget.animation) {
      circularAnimationController = AnimationController(
          duration: Duration(milliseconds: widget.animationDuration),
          vsync: this);
      circularAnimation = Tween(begin: _percentage, end: widget.percentage)
          .animate(circularAnimationController!)
        ..addListener(() {
          setState(() {
            _percentage = circularAnimation?.value;
          });
        });
      circularAnimationController?.forward();
    } else {
      _updateProgress();
    }
  }

  void _updateProgress() {
    setState(() {
      _percentage = widget.percentage;
    });
  }

  void _updateprogressPercent() {
    setState(() {
      _progressPercent = widget.percentage;
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();

    circularAnimationController?.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(AnterosProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      if (_animationController != null) {
        _animationController?.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
                begin: widget.animateFromLastPercentage
                    ? oldWidget.percentage
                    : 0.0,
                end: widget.percentage)
            .animate(_animationController!);
        _animationController?.forward(from: 0);
      } else {
        _updateprogressPercent();
      }
    }
    if (oldWidget.percentage != widget.percentage ||
        oldWidget.circleStartAngle != widget.circleStartAngle) {
      if (circularAnimationController != null) {
        circularAnimationController?.duration =
            Duration(milliseconds: widget.animationDuration);
        circularAnimation = Tween(
                begin: widget.animateFromLastPercentage
                    ? oldWidget.percentage
                    : 0.0,
                end: widget.percentage)
            .animate(circularAnimationController!);
        circularAnimationController?.forward(from: 0);
      } else {
        _updateProgress();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final item = List<Widget>.empty(growable: true);
    if (widget.leading != null) {
      item.add(widget.leading!);
    }

    final hasSetWidth = widget.width != null;
    final containerWidget = Container(
        margin: widget.margin,
        width: hasSetWidth ? widget.width : MediaQuery.of(context).size.width,
        height: widget.lineHeight,
        padding: widget.padding,
        child: widget.type == AnterosProgressType.linear
            ? CustomPaint(
                painter: LinearPainter(
                  progressHeadType: widget.progressHeadType,
                  fromRightToLeft: widget.fromRightToLeft,
                  progress: _progressPercent,
                  child: widget.child,
                  progressBarColor: widget.progressBarColor,
                  linearGradient: widget.linearGradient,
                  backgroundColor: widget.backgroundColor,
                  circleWidth: widget.lineHeight,
                  mask: widget.mask,
                  clipLinearGradient: widget.clipLinearGradient,
                ),
                child: (widget.child != null) ? widget.child : Container(),
              )
            : CustomPaint(
                painter: CirclePainter(
                    progressHeadType: widget.progressHeadType,
                    progress: _percentage * 360,
                    progressBarColor: widget.progressBarColor,
                    backgroundColor: widget.backgroundColor,
                    circleStartAngle: widget.circleStartAngle,
                    radius: (widget.radius! / 2) - widget.circleWidth / 2,
                    circleWidth: widget.circleWidth,
                    reverse: widget.reverse,
                    linearGradient: widget.linearGradient,
                    mask: widget.mask),
                child: (widget.child != null)
                    ? Center(child: widget.child)
                    : Container(),
              ));

    if (hasSetWidth) {
      item.add(containerWidget);
    } else {
      item.add(Expanded(
        child: containerWidget,
      ));
    }
    if (widget.trailing != null) {
      item.add(widget.trailing!);
    }
    return widget.type == AnterosProgressType.linear
        ? Material(
            color: Colors.transparent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: widget.alignment,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: item,
                )),
          )
        : Material(
            color: Colors.transparent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: item,
                )),
          );
  }

  @override
  bool get wantKeepAlive => widget.autoLive;
}

class LinearPainter extends CustomPainter {
  LinearPainter({
    this.circleWidth,
    this.progress,
    this.child,
    this.fromRightToLeft,
    this.progressBarColor,
    this.backgroundColor,
    this.progressHeadType,
    this.linearGradient,
    this.mask,
    this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor!;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth!;

    _paintLine.color = progress.toString() == '0.0' && progressBarColor != null
        ? progressBarColor!.withOpacity(0)
        : progressBarColor!;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth!;

    if (progressHeadType == AnterosProgressHeadType.square) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double? circleWidth;
  final double? progress;
  final Widget? child;
  final bool? fromRightToLeft;
  final Color? progressBarColor;
  final Color? backgroundColor;
  final LinearGradient? linearGradient;
  final MaskFilter? mask;
  final bool? clipLinearGradient;
  AnterosProgressHeadType? progressHeadType;

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);
    if (mask != null) {
      _paintLine.maskFilter = mask;
    }
    if (fromRightToLeft!) {
      final xProgress = size.width - size.width * progress!;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderRightToLeft(size, xProgress);
      }
      canvas.drawLine(end, Offset(xProgress, size.height / 2), _paintLine);
    } else {
      final xProgress = size.width * progress!;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderLeftToRight(size, xProgress);
      }
      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
    }
  }

  Shader? _createGradientShaderRightToLeft(Size size, double xProgress) {
    final Offset shaderEndPoint =
        clipLinearGradient! ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient?.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader? _createGradientShaderLeftToRight(Size size, double xProgress) {
    final Offset shaderEndPoint = clipLinearGradient!
        ? Offset(size.width, size.height)
        : Offset(xProgress, size.height);
    return linearGradient?.createShader(
      Rect.fromPoints(
        Offset.zero,
        shaderEndPoint,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  CirclePainter(
      {this.circleWidth,
      this.progress,
      required this.radius,
      this.progressHeadType,
      this.progressBarColor,
      this.backgroundColor,
      this.circleStartAngle = 0.0,
      this.linearGradient,
      this.reverse,
      this.arcBackgroundColor,
      this.mask}) {
    _paintBackground.color = backgroundColor!;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth!;
    _paintLine.color = progressBarColor!;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth!;
    if (progressHeadType == AnterosProgressHeadType.circular) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (progressHeadType == AnterosProgressHeadType.square) {
      _paintLine.strokeCap = StrokeCap.square;
    }
  }
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double? circleWidth;
  final double? progress;
  final double radius;
  final Color? progressBarColor;
  final Color? backgroundColor;
  final double circleStartAngle;
  final LinearGradient? linearGradient;
  final Color? arcBackgroundColor;
  final bool? reverse;
  final MaskFilter? mask;
  final AnterosProgressHeadType? progressHeadType;

  @override
  void paint(Canvas canvas, Size size) {
    final child = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(child, radius, _paintBackground);
    if (mask != null) {
      _paintLine.maskFilter = mask;
    }
    if (linearGradient != null) {
      _paintLine.shader = linearGradient?.createShader(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
      );
    }
    final double fixedStartAngle = circleStartAngle;
    const double circleStartAngleFixedMargin = 1;
    if (reverse!) {
      final start =
          radians(360 * circleStartAngleFixedMargin - 90.0 + fixedStartAngle);
      final end = radians(-progress! * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = radians(-90.0 + fixedStartAngle);
      final end = radians(progress! * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    }
  }

  double radians(double degrees) => degrees * (3.141592 / 180.0);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
