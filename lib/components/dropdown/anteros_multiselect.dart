import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosMultiSelect<T> extends StatefulWidget {
  /// Anteros Multiselect permite que o usuário selecione vários itens do número de
  /// Checkbox ListTile itens e exibe os itens selecionados na caixa TitleTile.
  /// Exibe a lista de itens no modo suspenso de sobreposição.
  const AnterosMultiSelect({
    required this.items,
    required this.onSelect,
    this.dropdownTitleTileText = 'Select : ',
    this.dropdownTitleTileTextStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    this.color,
    this.avatar,
    this.padding = const EdgeInsets.all(5),
    this.margin = const EdgeInsets.all(5),
    this.size = AnterosSize.SMALL,
    this.type = AnterosCheckboxType.basic,
    this.activeBgColor = AnterosColors.WHITE,
    this.inactiveBgColor = AnterosColors.WHITE,
    this.activeBorderColor = AnterosColors.WHITE,
    this.inactiveBorderColor = AnterosColors.WHITE,
    this.listItemTextColor = AnterosColors.DARK,
    this.buttonColor = AnterosColors.PRIMARY,
    this.submitButton,
    this.cancelButton,
    this.expandedIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black87,
      size: 30,
    ),
    this.collapsedIcon = const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black87,
      size: 30,
    ),
    this.dropdownBgColor = Colors.white,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: AnterosColors.DARK,
    ),
    this.inactiveIcon,
    this.customBgColor = AnterosColors.SUCCESS,
    this.selected = false,
    this.dropdownTitleTileBorder,
    this.dropdownTitleTileBorderRadius =
        const BorderRadius.all(Radius.circular(4)),
    this.dropdownTitleTileColor = AnterosColors.WHITE,
    this.hideDropdownUnderline = false,
    this.dropdownUnderlineBorder =
        const BorderSide(color: Colors.black45, width: 1),
    this.dropdownTitleTileMargin = const EdgeInsets.all(16),
    this.dropdownTitleTilePadding = const EdgeInsets.all(12),
    this.dropdownTitleTileHintText,
    this.dropdownTitleTileHintTextStyle =
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    this.dropdownButton,
    Key? key,
  }) : super(key: key);

  /// define a lista de itens que o usuário pode selecionar
  final List<dynamic> items;

  /// retorno de chamada quando o usuário seleciona o item no menu suspenso,
  /// no retorno de chamada obtemos o índice da lista de itens selecionados
  final ValueChanged<List<dynamic>> onSelect;

  /// tipo de [String] para definir o título dropdownTitleTile
  final String dropdownTitleTileText;

  /// tipo de [TextStyle] para definir o textStyle de [dropdownTitleTileText]
  final TextStyle dropdownTitleTileTextStyle;

  /// tipo de [String] para definir o texto da dica dropdownTitleTile
  final String? dropdownTitleTileHintText;

  /// tipo de [TextStyle] para definir o textStyle de [dropdownTitleTileHintTextStyle]
  final TextStyle dropdownTitleTileHintTextStyle;

  /// define o raio da borda do dropdownTitleTile
  final BorderRadius dropdownTitleTileBorderRadius;

  /// define a borda do dropdownTitleTile.
  final Border? dropdownTitleTileBorder;

  /// define a cor de fundo do dropdownButton
  final dynamic dropdownTitleTileColor;

  /// no estado verdadeiro, oculta a borda do Sublinhado do menu suspenso
  /// valor padrão é false
  final bool hideDropdownUnderline;

  /// define a borda da borda do Dropdown Underline
  final BorderSide dropdownUnderlineBorder;

  /// define a margem dropdownTitleTile
  final EdgeInsets dropdownTitleTileMargin;

  /// define o preenchimento dropdownTitleTile
  final EdgeInsets dropdownTitleTilePadding;

  /// define o ícone à direita do dropdownTitleTile quando o dropdown está visível
  final Widget expandedIcon;

  /// define o ícone à direita do dropdownTitleTile quando o dropdown não está visível
  final Widget collapsedIcon;

  /// define o botão de envio no menu suspenso
  final Widget? submitButton;

  /// define o botão cancelar no menu suspenso
  final Widget? cancelButton;

  /// define a cor de fundo do ListTile da caixa de seleção suspensa. Pode ser dado [Color] ou [AnterosColors]
  final dynamic color;

  /// tipo de [Widget] ou [AnterosAvatar] usado para definir a caixa de seleção suspensa ListTile's lead
  final Widget? avatar;

  /// define a margem da caixa de seleção suspensa ListTile
  final EdgeInsets margin;

  /// define o preenchimento da caixa de seleção suspensa ListTile
  final EdgeInsets padding;

  /// define o tipo de caixa de seleção do ListTile suspenso
  /// tipo de [AnterosCheckboxType] que é de quatro tipos é básico, quadrado, circular e personalizado
  final AnterosCheckboxType type;

  /// define o tamanho da caixa de seleção do ListTile suspenso
  /// tipo de [double] que é AnterosSize, ou seja, pequeno, médio e grande e pode usar qualquer valor duplo
  final double size;

  /// define a cor de fundo da caixa de seleção do ListTile quando está ativo
  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção ativa
  final Color activeBgColor;

  /// define a cor de fundo da caixa de seleção do ListTile quando está inativo
  /// tipo de [Color] usado para alterar o backgroundColor da caixa de seleção inativa
  final Color inactiveBgColor;

  /// define a cor da borda da caixa de seleção do ListTile quando está ativo
  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção ativa
  final Color activeBorderColor;

  /// define a cor da borda da caixa de seleção do ListTile quando está inativa
  /// tipo de [Color] usado para alterar a cor da borda da caixa de seleção inativa
  final Color inactiveBorderColor;

  /// define a cor de fundo do botão do ListTile suspenso
  /// tipo de [Color] usado para alterar a cor de fundo do botão
  final Color buttonColor;

  /// A cor para a cor do texto do item da lista.
  final Color? listItemTextColor;

  /// define o ícone ativo da caixa de seleção do ListTile
  /// tipo de [Widget] usado para alterar o ícone ativo da caixa de seleção
  final Widget activeIcon;

  /// define o ícone inativo da caixa de seleção do ListTile
  ///tipo de [Widget] usado para alterar o ícone inativo da caixa de seleção
  final Widget? inactiveIcon;

  /// tipo de [Color] usado para alterar apenas a cor de fundo da caixa de seleção ativa personalizada
  final Color customBgColor;

  /// Para que o bloco da lista apareça selecionado quando a caixa de seleção estiver marcada, passe o mesmo valor para ambos.
  /// Normalmente, esta propriedade é deixada com seu valor padrão, false.
  final bool selected;

  /// define a cor de fundo do menu suspenso. Pode ser dado [Color] ou [AnterosColors]
  final Color dropdownBgColor;

  final Widget? dropdownButton;

  @override
  _AnterosMultiSelectState createState() => _AnterosMultiSelectState();
}

class _AnterosMultiSelectState<T> extends State<AnterosMultiSelect<T>> {
  bool showDropdown = false;
  final _controller = TextEditingController();
  final List _selectedTitles = [];
  final List _selectedTitlesIndex = [];

  void _onItemSelect(bool selected, int index) {
    if (selected == true) {
      setState(() {
        _selectedTitles.add(widget.items[index]);
        _selectedTitlesIndex.add(index);
      });
    } else {
      setState(() {
        _selectedTitles.remove(widget.items[index]);
        _selectedTitlesIndex.remove(index);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget dropdownTile() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _selectedTitles.isEmpty
                ? Expanded(
                    child: Text(widget.dropdownTitleTileText,
                        style: widget.dropdownTitleTileTextStyle))
                : Expanded(
                    child: Text(_selectedTitles.join(',  ').toString(),
                        style: widget.dropdownTitleTileTextStyle)),
            !showDropdown ? widget.expandedIcon : widget.collapsedIcon,
          ],
        );

    return Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                showDropdown = !showDropdown;
              });
            },
            child: Container(
                margin: widget.dropdownTitleTileMargin,
                padding: widget.dropdownTitleTilePadding,
                decoration: BoxDecoration(
                    color: widget.dropdownTitleTileColor,
                    border: widget.dropdownTitleTileBorder,
                    borderRadius: widget.dropdownTitleTileBorderRadius),
                child: Container(
                  decoration: BoxDecoration(
                    border: widget.hideDropdownUnderline
                        ? const Border(
                            bottom: BorderSide(color: Colors.transparent))
                        : Border(bottom: widget.dropdownUnderlineBorder),
                  ),
                  child: widget.dropdownTitleTileHintText == null
                      ? dropdownTile()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.dropdownTitleTileHintText}',
                              style: widget.dropdownTitleTileHintTextStyle,
                            ),
                            dropdownTile(),
                            const SizedBox(
                              height: 2,
                            )
                          ],
                        ),
                ))),
        showDropdown
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: widget.dropdownBgColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                          children: List.generate(
                              widget.items.length,
                              (index) => AnterosCheckboxListTile(
                                    value: _selectedTitles
                                        .contains(widget.items[index]),
                                    onChanged: (bool selected) {
                                      _controller.text;
                                      _onItemSelect(selected, index);

                                      widget.onSelect(_selectedTitlesIndex);
                                    },
                                    selected: widget.selected,
                                    avatar: widget.avatar,
                                    titleText: widget.items[index],
                                    color: widget.color,
                                    padding: widget.padding,
                                    margin: widget.margin,
                                    size: widget.size,
                                    activeBgColor: widget.activeBgColor,
                                    inactiveIcon: widget.inactiveIcon,
                                    activeBorderColor: widget.activeBorderColor,
                                    inactiveBgColor: widget.inactiveBgColor,
                                    activeIcon: widget.activeIcon,
                                    inactiveBorderColor:
                                        widget.inactiveBorderColor,
                                    listItemTextColor: widget.listItemTextColor,
                                    customBgColor: widget.customBgColor,
                                    // checkColor: widget.checkColor,
                                    type: widget.type,
                                  ))),
                      widget.dropdownButton ??
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AnterosButton(
                                color: widget.buttonColor,
                                onPressed: () {
                                  setState(() {
                                    showDropdown = !showDropdown;
                                    _selectedTitles.clear();
                                    _selectedTitlesIndex.clear();
                                  });
                                },
                                child:
                                    widget.cancelButton ?? const Text('CANCEL'),
                              ),
                              AnterosButton(
                                color: widget.buttonColor,
                                onPressed: () {
                                  setState(() {
                                    showDropdown = !showDropdown;
                                  });
                                },
                                child: widget.submitButton ?? const Text('OK'),
                              )
                            ],
                          )
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
