import 'package:flutter/material.dart';

/// Cria um widget de imagem com sobreposição sombreada.
class AnterosImageOverlay extends StatelessWidget {
  /// Cria um widget de imagem com sobreposição sombreada.
  const AnterosImageOverlay({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
    this.image,
    this.child = const Text(''),
    this.alignment,
    this.borderRadius,
    this.colorFilter =
        const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
    this.boxFit = BoxFit.fill,
    this.border,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  /// define a altura [double] da imagem
  final double? height;

  /// define a largura [double] da imagem
  final double? width;

  /// A cor de fundo da imagem.
  final Color? color;

  /// O espaço vazio que circunda o cartão. Define o [Container.margin] externo da imagem.
  final EdgeInsetsGeometry? margin;

  /// O espaço vazio que circunda o cartão. Define o [Container.padding] externo da imagem.
  final EdgeInsetsGeometry? padding;

  /// O widget [Image] usado para exibir a imagem
  final ImageProvider? image;

  /// O [filho] contido pelo contêiner, usado para exibir texto sobre imagem
  final Widget child;

  /// Alinha o [filho] dentro do container.
  final AlignmentGeometry? alignment;

  /// Como a imagem deve ser inscrita na caixa.
  /// O padrão é [BoxFit.scaleDown] se centerSlice for nulo e
  /// [BoxFit.fill] se centerSlice não for nulo.
  final BoxFit? boxFit;

  /// Um ​​filtro de cor para aplicar à imagem antes de pintá-la.
  final ColorFilter? colorFilter;

  /// Os cantos deste [AnterosImageOverlay] são arredondados por este [BorderRadius].
  final BorderRadiusGeometry? borderRadius;

  /// Uma borda para desenhar acima de [AnterosImageOverlay].
  final Border? border;

  /// A forma para preencher o plano de fundo [cor], gradiente e [imagem] em e
  /// para converter como boxShadow.
  ///
  /// Se for [BoxShape.circle] então [borderRadius] é ignorado.
  ///
  /// A [forma] não pode ser interpolada; animando bestuckValue dois [BoxDecoration]s
  /// com [shape]s diferentes resultará em uma descontinuidade na renderização.
  /// Para interpolar besttuckValue duas formas, considere usar [ShapeDecoration] e
  /// diferentes [ShapeBorder]s; em particular, [CircleBorder] em vez de
  /// [BoxShape.circle] e [RoundedRectangleBorder] em vez de
  /// [BoxShape.rectangle].
  ///
  /// {@macro flutter.painting.boxDecoration.clip}
  final BoxShape shape;

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignment,
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        margin: margin,
        padding: padding,
        child: child,
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: borderRadius,
          border: border,
          color: color,
          image: DecorationImage(
            fit: boxFit,
            colorFilter: colorFilter,
            image: image!,
          ),
        ),
      );
}
