import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosListTile extends StatelessWidget {
  /// Cria ListTile com widget de imagem à esquerda, título, à direita para quase todos os tipos de design de ListTile.
  const AnterosListTile({
    Key? key,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.listItemTextColor = AnterosColors.DARK,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  /// tipo de [String] usado para passar texto, alternativa à propriedade title e tem prioridade mais alta que title
  final String? titleText;

  /// tipo de [String] usado para passar texto, alternativa à propriedade subTitle e tem prioridade maior que subTitle
  final String? subTitleText;

  /// A cor de fundo do AnterosListTile. Pode ser dado [Color] ou [AnterosColors]
  final Color? color;

  /// tipo de [Widget] ou [AnterosAvatar] usado para criar perfil de usuário arredondado
  final Widget? avatar;

  /// O título a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? title;

  /// O subtítulo a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? subTitle;

  /// A descrição a ser exibida dentro do [AnterosListTile]. veja [Texto]
  final Widget? description;

  /// O ícone a ser exibido dentro do [AnterosListTile]. veja [ícone]
  final Widget? icon;

  /// define a margem de AnterosListTile
  final EdgeInsets margin;

  /// define o preenchimento de AnterosListTile
  final EdgeInsets padding;

  /// Se este bloco de lista é interativo.
  ///
  /// Se false, este bloco de lista é estilizado com a cor desabilitada do
  /// atual [Theme] e os callbacks [onTap] e [onLongPress] são
  /// inoperante.
  final bool enabled;

  /// Chamado quando o usuário toca neste bloco de lista.
  ///
  /// Inoperante se [habilitado] for falso.
  final GestureTapCallback? onTap;

  /// Chamado quando o usuário pressiona longamente neste bloco de lista.
  ///
  /// Inoperante se [habilitado] for falso.
  final GestureLongPressCallback? onLongPress;

  /// Se este bloco também estiver [habilitado], os ícones e o texto serão renderizados com a mesma cor.
  ///
  /// Por padrão, a cor selecionada é a cor primária do tema. A cor selecionada
  /// pode ser substituído por um [ListTileTheme].
  final bool selected;

  /// A cor do [Material] do bloco quando ele tem o foco de entrada.
  final Color? focusColor;

  /// A cor para a cor do texto do item da lista.
  final Color? listItemTextColor;

  /// A cor do [Material] do bloco quando um ponteiro está pairando sobre ele.
  final Color? hoverColor;

  /// Define o foco do teclado para este widget.
  final FocusNode? focusNode;

  /// No estado verdadeiro, ele deve se concentrar se nada mais já estiver focado.
  /// O padrão é falso
  final bool autofocus;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        canRequestFocus: enabled,
        focusNode: focusNode,
        focusColor: focusColor,
        hoverColor: hoverColor,
        autofocus: autofocus,
        child: Semantics(
          selected: selected,
          enabled: enabled,
          child: Container(
            // constraints: const BoxConstraints(minHeight: 50),
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                avatar ?? Container(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        titleText != null
                            ? Text(
                                titleText!,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: listItemTextColor),
                              )
                            : title ?? Container(),
                        subTitleText != null
                            ? Text(
                                subTitleText!,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  color: Colors.black54,
                                ),
                              )
                            : subTitle ?? Container(),
                        description ?? Container()
                      ],
                    ),
                  ),
                ),
                icon ?? Container(),
              ],
            ),
          ),
        ),
      );
}
