import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosCheckboxListTile extends StatelessWidget {
  /// [AnterosCheckboxListTile] é um bloco com uma pequena caixa à direita (como em uma lista de verificação)
  /// no qual colocar uma marca de seleção para fazer uma seleção com várias opções de personalização.
  const AnterosCheckboxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.icon,
    this.description,
    this.listItemTextColor = AnterosColors.DARK,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.size = AnterosSize.MEDIUM,
    this.type = AnterosCheckboxType.basic,
    this.activeBgColor = AnterosColors.PRIMARY,
    this.inactiveBgColor = AnterosColors.WHITE,
    this.activeBorderColor = AnterosColors.WHITE,
    this.inactiveBorderColor = AnterosColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: AnterosColors.WHITE,
    ),
    this.inactiveIcon,
    this.customBgColor = AnterosColors.SUCCESS,
    this.position = AnterosPosition.end,
    this.selected = false,
    this.autofocus = false,
  }) : super(key: key);

  ///tipo de [String] usado para passar texto, alternativa à propriedade title e tem prioridade mais alta que title
  final String? titleText;

  ///tipo de [String] usado para passar texto, alternativa à propriedade subTitle e tem prioridade mais alta que subTitle
  final String? subTitleText;

  /// A cor de fundo do AnterosListTile. Pode ser dado [Color] ou [AnterosColors]
  final Color? color;

  /// Se a posição for inicial, a caixa de seleção virá em vez do avatar,
  /// tipo de [Widget] ou [AnterosAvatar] usado para criar perfil de usuário arredondado
  final Widget? avatar;

  /// O título a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? title;

  /// O subtítulo a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? subTitle;

  /// A descrição a ser exibida dentro do [AnterosListTile]. veja [Texto]
  final Widget? description;

  /// define a margem de AnterosListTile
  final EdgeInsets margin;

  /// define o preenchimento de AnterosListTile
  final EdgeInsets padding;

  /// tipo de [AnterosCheckboxType] que é de quatro tipos é básico, quadrado, circular e personalizado
  final AnterosCheckboxType type;

  /// tipo de [double] que é AnterosSize, ou seja, pequeno, médio e grande e pode usar qualquer valor duplo
  final double size;

  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção ativa
  final Color activeBgColor;

  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção inativa
  final Color inactiveBgColor;

  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção ativa
  final Color activeBorderColor;

  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção inativa
  final Color inactiveBorderColor;

  /// A cor para a cor do texto do item da lista.
  final Color? listItemTextColor;

  /// Chamado quando o usuário marca ou desmarca a caixa de seleção.
  final ValueChanged<bool>? onChanged;

  /// Usado para definir o estado atual da caixa de seleção
  final bool value;

  /// Posição permite que o usuário defina a posição de [AnterosCheckbox] com base em [AnterosPosition]
  final AnterosPosition position;

  /// tipo de Widget usado para alterar o ícone ativo da caixa de seleção
  final Widget activeIcon;

  /// tipo de [Widget] usado para alterar o ícone inativo da caixa de seleção
  final Widget? inactiveIcon;

  /// tipo de [Color] usado para alterar apenas a cor de fundo da caixa de seleção ativa personalizada
  final Color customBgColor;

  /// Para que o bloco da lista apareça selecionado quando a caixa de seleção estiver marcada, passe o mesmo valor para ambos.
  /// Normalmente, esta propriedade é deixada com seu valor padrão, false.
  final bool selected;

  /// No estado verdadeiro, ele deve se concentrar se nada mais já estiver focado.
  /// O padrão é falso
  final bool autofocus;

  /// Se a posição for final A caixa de seleção virá em vez do ícone, O ícone a ser exibido dentro do [AnterosListTile]. veja [ícone]
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final AnterosCheckbox checkbox = AnterosCheckbox(
        autofocus: autofocus,
        onChanged: onChanged,
        value: value,
        size: size,
        activeBgColor: activeBgColor,
        inactiveIcon: inactiveIcon,
        activeBorderColor: activeBorderColor,
        inactiveBgColor: inactiveBgColor,
        activeIcon: activeIcon,
        inactiveBorderColor: inactiveBorderColor,
        customBgColor: customBgColor,
        // checkColor: checkColor,
        type: type);
    return MergeSemantics(
      child: AnterosListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        onTap: onChanged != null
            ? () {
                onChanged!(!value);
              }
            : null,
        selected: selected,
        avatar: position == AnterosPosition.start ? checkbox : avatar,
        titleText: titleText,
        subTitle: subTitle,
        subTitleText: subTitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        listItemTextColor: listItemTextColor,
        icon: position == AnterosPosition.end ? checkbox : icon,
      ),
    );
  }
}
