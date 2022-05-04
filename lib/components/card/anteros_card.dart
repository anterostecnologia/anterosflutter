import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Um ​​cartão de design de material. Um cartão tem cantos ligeiramente arredondados e uma sombra.
///
/// Um ​​cartão é uma folha de [Material] usada para representar algumas informações relacionadas,
/// por exemplo um álbum, uma localização geográfica, uma refeição, detalhes de contato, etc.
class AnterosCard extends StatelessWidget {
  /// Cria um cartão de design de material.
  ///
  /// A [elevation] deve ser nula ou não negativa. O [borderOnForeground]
  /// não deve ser nulo.
  const AnterosCard(
      {Key? key,
      this.color,
      this.elevation,
      this.shape,
      this.borderOnForeground = true,
      this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      this.margin,
      this.clipBehavior,
      this.semanticContainer,
      this.title,
      this.content,
      this.image,
      this.showImage = false,
      this.showOverlayImage = false,
      this.buttonBar,
      this.imageOverlay,
      this.titlePosition,
      this.borderRadius,
      this.border,
      this.boxFit,
      this.colorFilter,
      this.height,
      this.gradient})
      : assert(elevation == null || elevation >= 0.0),
        assert(
            color == null || gradient == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: new BoxDecoration(color: color)".'),
        super(key: key);

  /// define a altura do cartão
  final double? height;

  /// [AnterosPosition] titlePosition ajuda a definir a barra de título no topo do cartão
  final AnterosPosition? titlePosition;

  /// A cor de fundo do cartão.
  final Color? color;

  /// A coordenada z na qual colocar este cartão. Isso controla o tamanho da sombra abaixo do cartão.
  final double? elevation;

  /// A forma do [Material] do cartão.
  final ShapeBorder? shape;

  /// Se deve pintar a borda [shape] na frente do filho.
  final bool borderOnForeground;

  /// Se esta propriedade for nula, então [ThemeData.cardTheme.clipBehavior] será usado.
  final Clip? clipBehavior;

  /// O espaço vazio que circunda o cartão. Define o [Container.margin] externo do cartão.
  final EdgeInsetsGeometry? margin;

  /// O espaço vazio que circunda o cartão. Define o [Container.padding] externo do cartão.
  final EdgeInsetsGeometry padding;

  /// Se este widget representa um único contêiner semântico ou se é falso
  /// uma coleção de nós semânticos individuais.
  final bool? semanticContainer;

  /// O título a ser exibido dentro do AnterosTitleBar. veja AnterosTitleBar
  final AnterosListTile? title;

  /// widget pode ser usado para definir conteúdo
  final Widget? content;

  final bool showImage;

  final bool showOverlayImage;

  /// widget de imagem pode ser usado
  final Image? image;

  /// imagem de sobreposição [AnterosImageOverlay] widget pode ser usado
  /// para exibir a imagem com sobreposição sombreada
  final ImageProvider? imageOverlay;

  /// widget pode ser usado para definir a barra de botões, veja [AnterosButtonBar]
  final AnterosButtonBar? buttonBar;

  /// Como a imagem deve ser inscrita na caixa.
  /// O padrão é [BoxFit.scaleDown] se centerSlice for nulo e
  /// [BoxFit.fill] se centerSlice não for nulo.
  /// [boxFit] apenas para [AnterosImageOverlay]
  final BoxFit? boxFit;

  /// Um ​​filtro de cor para aplicar à imagem antes de pintá-la.
  final ColorFilter? colorFilter;

  /// Os cantos deste [AnterosCard] são arredondados por este [BorderRadius].
  final BorderRadiusGeometry? borderRadius;

  /// Uma borda para desenhar acima do [AnterosCard].
  final Border? border;

  /// define o fundo gradiente
  final LinearGradient? gradient;

  static const double _defaultElevation = 1;
  static const Clip _defaultClipBehavior = Clip.none;

  @override
  Widget build(BuildContext context) {
    final CardTheme cardTheme = CardTheme.of(context);

    final Widget cardChild = Padding(
      padding: padding,
      child: Column(
        children: <Widget>[
          titlePosition == AnterosPosition.start
              ? title ?? Container()
              : showImage != false
                  ? ClipRRect(
                      // ignore: avoid_as
                      borderRadius: borderRadius as BorderRadius? ??
                          const BorderRadius.vertical(top: Radius.circular(4)),
                      child: image,
                    )
                  : Container(),
          titlePosition == AnterosPosition.start
              ? showImage != false
                  ? Container(child: image)
                  : Container()
              : title ?? Container(),
          Padding(
            padding: padding,
            child: content ?? Container(),
          ),
          buttonBar ?? Container(),
        ],
      ),
    );

    final Widget overlayImage = AnterosImageOverlay(
      width: MediaQuery.of(context).size.width,
      child: cardChild,
      color: color ?? cardTheme.color ?? Theme.of(context).cardColor,
      image: imageOverlay,
      boxFit: boxFit,
      colorFilter: colorFilter,
      border: border,
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(4)),
    );

    return Container(
      height: height,
      margin: margin ?? cardTheme.margin ?? const EdgeInsets.all(16),
      decoration: gradient != null
          ? BoxDecoration(
              gradient: gradient,
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(4)),
            )
          : null,
      child: gradient == null
          ? Material(
              type: MaterialType.card,
              color: color ?? cardTheme.color ?? Theme.of(context).cardColor,
              elevation: elevation ?? cardTheme.elevation ?? _defaultElevation,
              shape: shape ??
                  cardTheme.shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
              borderOnForeground: borderOnForeground,
              clipBehavior: clipBehavior ??
                  cardTheme.clipBehavior ??
                  _defaultClipBehavior,
              child: showOverlayImage == false ? cardChild : overlayImage,
            )
          : showOverlayImage == false
              ? cardChild
              : overlayImage,
    );
  }
}
