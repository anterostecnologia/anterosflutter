import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosRadioListTile<T> extends StatelessWidget {
  /// [AnterosRadioListTile] é um título de lista com [AnterosRadio] nele.
  const AnterosRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = AnterosSize.SMALL,
    this.type = AnterosRadioType.basic,
    this.radioColor = AnterosColors.SUCCESS,
    this.activeBgColor = AnterosColors.WHITE,
    this.inactiveBgColor = AnterosColors.WHITE,
    this.activeBorderColor = AnterosColors.DARK,
    this.inactiveBorderColor = AnterosColors.DARK,
    this.position = AnterosPosition.end,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: AnterosColors.DARK,
    ),
    this.inactiveIcon,
    this.customBgColor = AnterosColors.SUCCESS,
    this.autofocus = false,
    this.focusNode,
    this.toggleable = false,
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
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
  }) : super(key: key);

  ///tipo de [String] usado para passar texto, alternativa à propriedade title e tem prioridade mais alta que title
  final String? titleText;

  ///tipo de [String] usado para passar texto, alternativa à propriedade subTitle e tem prioridade mais alta que subTitle
  final String? subTitleText;

  /// A cor de fundo do AnterosListTile. Pode ser dado [Color] ou [AnterosColors]
  final Color? color;

  /// Se a posição for start Checkbox virá ao invés de avatar, tipo de [Widget] ou [AnterosAvatar] usado para criar perfil de usuário arredondado
  final Widget? avatar;

  /// O título a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? title;

  /// O subtítulo a ser exibido dentro do [AnterosListTile]. veja [Texto]
  final Widget? subTitle;

  /// A descrição a ser exibida dentro do [AnterosListTile]. veja [Texto]
  final Widget? description;

  /// Se a posição for final A caixa de seleção virá em vez do ícone, O ícone a ser exibido dentro do [AnterosListTile]. veja [ícone]
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

  /// Position permite que o usuário defina a posição de [AnterosCheckbox] com base em [AnterosPosition]
  final AnterosPosition position;

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

  /// A cor do [Material] do bloco quando um ponteiro está pairando sobre ele.
  final Color? hoverColor;

  /// no estado verdadeiro este widget será selecionado como foco inicial
  /// quando nenhum outro nó em seu escopo está focado no momento
  final bool autofocus;

  /// um nó de foco opcional para usar como nó de foco para este widget.
  final FocusNode? focusNode;

  /// tipo de [AnterosRadioType] que é de quatro tipos é básico, quadrado, circular e personalizado
  final AnterosRadioType type;

  /// tipo de [double] que é AnterosSize, ou seja, pequeno, médio e grande e pode usar qualquer valor duplo
  final double size;

  /// digite pf [Color] usado para alterar a cor de seleção quando a caixa de seleção está ativa
  final Color radioColor;

  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção ativa
  final Color activeBgColor;

  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção inativa
  final Color inactiveBgColor;

  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção ativa
  final Color activeBorderColor;

  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção inativa
  final Color inactiveBorderColor;

  /// Chamado quando o usuário marca ou desmarca a caixa de seleção.
  final ValueChanged<dynamic>? onChanged;

  ///tipo de Widget usado para alterar o ícone ativo da caixa de seleção
  final Widget activeIcon;

  /// tipo de [widget] usado para alterar o ícone inativo da caixa de seleção
  final Widget? inactiveIcon;

  /// tipo de [Color] usado para alterar apenas a cor de fundo da caixa de seleção ativa personalizada
  final Color customBgColor;

  /// o valor representado por este botão de rádio.
  final T value;

  /// o valor atualmente selecionado para um grupo de botões de rádio.O botão de rádio é considerado selecionado se o seu [value] corresponde ao [groupValue].
  final T groupValue;

  /// define o valor do rádio
  final bool toggleable;

  /// Se este botão de rádio está verificado.Para controlar este valor, defina [value] e [groupValue] adequadamente.
  bool get checked => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final AnterosRadio radio = AnterosRadio(
      onChanged: onChanged,
      value: value,
      groupValue: groupValue,
      size: size,
      type: type,
      radioColor: radioColor,
      activeBgColor: activeBgColor,
      inactiveIcon: inactiveIcon,
      activeBorderColor: activeBorderColor,
      inactiveBgColor: inactiveBgColor,
      activeIcon: activeIcon,
      inactiveBorderColor: inactiveBorderColor,
      customBgColor: customBgColor,
      toggleable: toggleable,
    );
    return MergeSemantics(
      child: AnterosListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        focusNode: focusNode,
        onTap: onChanged != null
            ? () {
                if (toggleable && checked) {
                  onChanged!(null);
                  return;
                }
                if (!checked) {
                  onChanged!(value);
                }
              }
            : null,
        selected: selected,
        avatar: position == AnterosPosition.start ? radio : avatar,
        titleText: titleText,
        subTitle: subTitle,
        subTitleText: subTitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        icon: position == AnterosPosition.end ? radio : icon,
      ),
    );
  }
}
