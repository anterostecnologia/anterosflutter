import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class AnterosAvatar extends StatelessWidget {
  /// Cria Avatar de todos os tipos i,e, quadrado, círculo, padrão com tamanhos diferentes.
  const AnterosAvatar(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.backgroundImage,
      this.foregroundColor,
      this.radius,
      this.minRadius,
      this.maxRadius,
      this.borderRadius,
      this.shape = AnterosAvatarShape.circle,
      this.size = AnterosSize.MEDIUM})
      : assert(radius == null || (minRadius == null && maxRadius == null)),
        super(key: key);

  /// Normalmente um widget [Texto]. Se o [CircleAvatar] tiver uma imagem, use [backgroundImage].
  final Widget? child;

  /// use [Color] ou [AnterosColors]. A cor com a qual preencher o círculo.
  final Color? backgroundColor;

  /// use [Color] ou [AnterosColors]. A cor de texto padrão para o texto no círculo.
  final Color? foregroundColor;

  /// A imagem de fundo do círculo.
  final ImageProvider? backgroundImage;

  /// O tamanho do avatar, expresso como o raio (metade do diâmetro).
  final double? radius;

  /// O tamanho mínimo do avatar, expresso como o raio (metade do diâmetro).
  final double? minRadius;

  /// O tamanho máximo do avatar, expresso como o raio (metade do diâmetro).
  final double? maxRadius;

  /// tamanho do avatar. use [AnterosSize] ou [double], ou seja, 1.2, pequeno, médio, grande etc.
  final double size;

  /// forma do avatar [AnterosAvatarShape] ou seja, padrão, círculo, quadrado
  final AnterosAvatarShape shape;

  /// raio da borda para dar raio extra para avatar quadrado ou forma padrão
  /// Não aplicável a circleshape
  final BorderRadius? borderRadius;

  // /// O máximo padrão se apenas o mínimo for especificado.
  // static const double _defaultMaxRadius = double.infinity;

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return 1.5 * size;
    } else {
      return 2.0 * (radius ?? minRadius ?? 0);
    }
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return 1.5 * size;
    } else {
      return 2.0 * (radius ?? maxRadius ?? 0);
    }
  }

  BoxShape get _avatarShape {
    if (shape == AnterosAvatarShape.circle) {
      return BoxShape.circle;
    } else if (shape == AnterosAvatarShape.square) {
      return BoxShape.rectangle;
    } else if (shape == AnterosAvatarShape.standard) {
      return BoxShape.rectangle;
    } else {
      return BoxShape.rectangle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor = this.backgroundColor;
    final Color? foregroundColor = this.foregroundColor;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    TextStyle? textStyle = theme.primaryTextTheme.subtitle1?.copyWith(
      color: foregroundColor,
    );
    Color? effectiveBackgroundColor = backgroundColor;

    if (effectiveBackgroundColor == null && textStyle?.color != null) {
      switch (ThemeData.estimateBrightnessForColor(textStyle!.color!)) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    } else if (foregroundColor == null && textStyle != null) {
      switch (ThemeData.estimateBrightnessForColor(backgroundColor!)) {
        case Brightness.dark:
          textStyle = textStyle.copyWith(color: theme.primaryColorLight);
          break;
        case Brightness.light:
          textStyle = textStyle.copyWith(color: theme.primaryColorDark);
          break;
      }
    }
    final double minDiameter = _minDiameter;
    final double maxDiameter = _maxDiameter;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: BoxFit.cover,
              )
            : null,
        shape: _avatarShape,
        borderRadius:
            shape == AnterosAvatarShape.standard && borderRadius == null
                ? BorderRadius.circular(10)
                : borderRadius,
      ),
      child: child == null && textStyle != null
          ? null
          : Center(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle?.color),
                  child: DefaultTextStyle(
                    style: textStyle!,
                    child: child!,
                  ),
                ),
              ),
            ),
    );
  }
}
