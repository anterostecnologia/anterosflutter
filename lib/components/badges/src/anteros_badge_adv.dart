import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

/// Este widget permite que você adicione emblemas a qualquer um de seus [Widget].
class AnterosAdvancedBadge extends StatefulWidget {
  /// Cria um [AnterosAdvancedBadge].
  ///
  /// Se [filho] for nulo, não faz sentido definir [ignorePointer],
  /// [posição] e [alinhamento]
  ///
  /// Veja também:
  ///
  /// * [Forma do Emblema]
  /// * [BorderRadius]
  /// * [AnterosAdvancedBadgeAnimationType]
  /// * [BorderSide]
  AnterosAdvancedBadge({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeColor = Colors.red,
    this.elevation = 2,
    this.toAnimate = true,
    this.position,
    this.shape = AnterosAdvancedBadgeShape.circle,
    this.padding = const EdgeInsets.all(5.0),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.animationType = AnterosAdvancedBadgeAnimationType.slide,
    this.showBadge = true,
    this.ignorePointer = false,
    this.borderSide = BorderSide.none,
    this.stackFit = StackFit.loose,
    this.gradient,
  }) : super(key: key);

  /// Define o widget que será envolvido por este [badgeContent].
  final Widget? child;

  /// Isso define o alinhamento para seu [filho].
  ///
  /// O valor padrão é [Alignment.center].
  final AlignmentGeometry alignment;

  /// Permite definir a posição personalizada de [badgeContent].
  /// de acordo com [filho].
  ///
  /// Se [child] for null, não faz sentido usá-lo.
  final AnterosAdvancedBadgePosition? position;

  /// Conteúdo deste widget de crachá
  final Widget? badgeContent;

  /// Pode tornar seu [badgeContent] interativo.
  ///
  /// O valor padrão é falso.
  final bool ignorePointer;

  /// Permite definir a cor para este [badgeContent].
  final Color badgeColor;

  /// Permite definir a cor do gradiente para este [badgeContent]
  final Gradient? gradient;

  /// Isso controla o tamanho da sombra abaixo do material e a opacidade.
  /// da cor da sobreposição de elevação se for aplicada.
  final double elevation;

  /// Isso controla o status da animação.
  ///
  /// O valor padrão é verdadeiro.
  /// Se verdadeiro, a animação é permitida, se falso, a animação é proibida.
  ///
  /// Veja também:
  ///
  /// * [animationDuration]
  /// * [animationType]
  final bool toAnimate;

  /// Isso controla a duração da animação.
  ///
  /// O valor padrão é Duration(milissegundos: 500).
  ///
  /// Veja também:
  ///
  /// * [toAnimate]
  /// * [animationType]
  final Duration animationDuration;

  /// Isso controla o tipo de animação.
  ///
  /// O valor padrão é [AnterosAdvancedBadgeAnimationType.slide].
  ///
  /// Veja também:
  ///
  /// * [toAnimate]
  /// * [animationDuration]
  final AnterosAdvancedBadgeAnimationType animationType;

  /// Permite definir a forma para este [badgeContent].
  ///
  /// O valor padrão é [AnterosAdvancedBadgeShape.circle].
  final AnterosAdvancedBadgeShape shape;

  /// Permite definir o lado da borda para este [badgeContent].
  ///
  /// O valor padrão é [BorderSide.none].
  final BorderSide borderSide;

  /// Permite editar o parâmetro fit para o widget [Stack].
  ///
  /// O valor padrão é [StackFit.loose].
  final StackFit stackFit;

  /// Permite definir o raio da borda para este [badgeContent].
  ///
  /// O valor padrão é [BorderRadius.zero].
  ///
  /// Veja também:
  ///
  /// * [borderSide]
  final BorderRadiusGeometry borderRadius;

  /// Especifique o preenchimento para [badgeContent].
  ///
  /// O valor padrão é EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Permite ocultar ou mostrar [badgeContent].
  ///
  /// O valor padrão é verdadeiro.
  /// Se verdadeiro, o badge será exibido, se falso, não.
  final bool showBadge;

  @override
  AnterosAdvancedBadgeState createState() {
    return AnterosAdvancedBadgeState();
  }
}

class AnterosAdvancedBadgeState extends State<AnterosAdvancedBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final Tween<Offset> _positionTween = Tween(
    begin: const Offset(-0.5, 0.9),
    end: const Offset(0.0, 0.0),
  );
  final Tween<double> _scaleTween = Tween<double>(begin: 0.1, end: 1);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (widget.animationType == AnterosAdvancedBadgeAnimationType.slide) {
      _animation = CurvedAnimation(
          parent: _animationController, curve: Curves.elasticOut);
    } else if (widget.animationType ==
        AnterosAdvancedBadgeAnimationType.scale) {
      _animation = _scaleTween.animate(_animationController);
    } else if (widget.animationType == AnterosAdvancedBadgeAnimationType.fade) {
      _animation =
          CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    }

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return _getBadge();
    } else {
      return Stack(
        fit: widget.stackFit,
        alignment: widget.alignment,
        clipBehavior: Clip.none,
        children: [
          widget.child!,
          AnterosAdvancedBadgePositioned(
            position: widget.position,
            child: widget.ignorePointer
                ? IgnorePointer(child: _getBadge())
                : _getBadge(),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    final border = widget.shape == AnterosAdvancedBadgeShape.circle
        ? CircleBorder(side: widget.borderSide)
        : RoundedRectangleBorder(
            side: widget.borderSide,
            borderRadius: widget.borderRadius,
          );

    Widget _badgeView() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Material(
          shape: border,
          elevation: widget.elevation,
          color: widget.badgeColor,
          child: Padding(
            padding: widget.padding,
            child: widget.badgeContent,
          ),
        ),
      );
    }

    Widget _badgeViewGradient() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Material(
          shape: border,
          elevation: widget.elevation,
          child: Container(
            decoration: BoxDecoration(
              gradient: widget.gradient,
              shape: widget.shape == AnterosAdvancedBadgeShape.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
            ),
            child: Padding(
              padding: widget.padding,
              child: widget.badgeContent,
            ),
          ),
        ),
      );
    }

    if (widget.toAnimate) {
      if (widget.animationType == AnterosAdvancedBadgeAnimationType.slide) {
        return SlideTransition(
          position: _positionTween.animate(_animation),
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType ==
          AnterosAdvancedBadgeAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType ==
          AnterosAdvancedBadgeAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      }
    }

    return widget.gradient == null ? _badgeView() : _badgeViewGradient();
  }

  @override
  void didUpdateWidget(AnterosAdvancedBadge oldWidget) {
    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      if (newText.data != oldText.data) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    if (widget.badgeContent is Icon && oldWidget.badgeContent is Icon) {
      final newIcon = widget.badgeContent as Icon;
      final oldIcon = oldWidget.badgeContent as Icon;
      if (newIcon.icon != oldIcon.icon) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
