import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosTypography extends StatelessWidget {
  /// Cria título simples com sublinhado.Estilo de título pode ser alterado usando [AnterosTypographyType]
  /// O ShowDivider é padrão, pode ser definido false.
  const AnterosTypography({
    Key? key,
    this.type = AnterosTypographyType.typo4,
    this.child,
    this.text,
    this.icon,
    this.dividerBorderRadius,
    this.textColor,
    this.dividerAlignment,
    this.dividerColor,
    this.showDivider = true,
    this.dividerWidth,
    this.dividerHeight,
    this.backgroundImage,
    this.backgroundImagecolorFilter,
    this.fontWeight = FontWeight.w500,
  })  : assert(text != null || child != null),
        super(key: key);

  /// filho do tipo [Widget] é alternativo à chave de texto.O texto terá prioridade sobre a criança
  final Widget? child;

  /// texto do tipo [String] é alternativo para a criança.O texto terá prioridade sobre a criança
  final String? text;

  /// Ícone do tipo [Widget] usado para passar no ícone ou imagem
  final Widget? icon;

  /// Passar [AnterosColors] ou [Color] para divisercolor
  final Color? dividerColor;

  /// Passar [AnterosColors] ou [Color] para textcolor
  final Color? textColor;

  /// dividerBorderRadius do tipo [BorderRadius] para alterar o raio do divisor
  final BorderRadius? dividerBorderRadius;

  /// dividerAlignment do tipo [Alignment] usado para alinhar o divisor ao alinhamento necessário
  final Alignment? dividerAlignment;

  /// Passar [bool] valor para mostrar ou ocultar o divisor
  final bool showDivider;

  /// passar [double] digite para aumentar ou diminuir a largura do divisor
  final double? dividerWidth;

  /// passar [double] digite para aumentar ou diminuir a altura do divisor
  final double? dividerHeight;

  /// imagem de fundo do tipo [ImageProvider] Para definir o fundo de [AnterosTypography]
  final ImageProvider? backgroundImage;

  /// BackgroundImageColorFilter do tipo [ColorFilter] Para definir o
  /// cor de fundo de [AnterosTypography] Somente quando o BackgroundImage está disponível
  final ColorFilter? backgroundImagecolorFilter;

  /// Tipo de cabeçalho de [AnterosTypographyType] isto é, digitação1, digitação2, digitação3, digitação4, digitação5, digitação6
  final AnterosTypographyType type;

  /// passar [FontWeight] por Espessura da fonte
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    double? fontSize;

    if (type == AnterosTypographyType.typo1) {
      fontSize = 25.0;
    } else if (type == AnterosTypographyType.typo2) {
      fontSize = 22.0;
    } else if (type == AnterosTypographyType.typo3) {
      fontSize = 19.0;
    } else if (type == AnterosTypographyType.typo4) {
      fontSize = 17.0;
    } else if (type == AnterosTypographyType.typo5) {
      fontSize = 15.0;
    } else if (type == AnterosTypographyType.typo6) {
      fontSize = 13.0;
    }

    return Container(
      padding: EdgeInsets.all(backgroundImage != null ? 10 : 0),
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: BoxFit.cover,
                colorFilter: backgroundImagecolorFilter ??
                    const ColorFilter.mode(Colors.black54, BlendMode.darken),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              icon ?? Container(),
              icon != null
                  ? const Padding(padding: EdgeInsets.only(left: 10))
                  : Container(),
              text != null
                  ? Expanded(
                      child: Text(
                        text!,
                        style: TextStyle(
                          color: textColor ??
                              (backgroundImage != null
                                  ? Colors.white
                                  : Colors.black),
                          fontSize: fontSize,
                          letterSpacing: 0.3,
                          fontWeight: fontWeight,
                        ),
                      ),
                    )
                  : child!
            ],
          ),
          showDivider && fontSize != null
              ? Container(
                  margin: const EdgeInsets.only(top: 3, bottom: 3),
                  alignment: dividerAlignment,
                  child: Container(
                    width: dividerWidth ?? 70,
                    height: dividerHeight ?? (fontSize / 5),
                    decoration: BoxDecoration(
                      color: dividerColor ??
                          (backgroundImage != null
                              ? Colors.white
                              : Colors.black),
                      borderRadius: dividerBorderRadius ??
                          const BorderRadius.all(
                            Radius.circular(5),
                          ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
