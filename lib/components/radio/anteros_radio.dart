import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosRadio<T> extends StatefulWidget {
  /// [AnterosRadio] é um tipo de indicador de seleção em uma lista de opções.
  const AnterosRadio(
      {Key? key,
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
      this.activeIcon = const Icon(
        Icons.check,
        size: 20,
        color: AnterosColors.DARK,
      ),
      this.inactiveIcon,
      this.customBgColor = AnterosColors.SUCCESS,
      this.autofocus = false,
      this.focusNode,
      this.toggleable = false})
      : super(key: key);

  /// tipo de [AnterosRadioType] que é de quatro tipos é básico, quadrado, circular e personalizado
  final AnterosRadioType type;

  /// tipo de [double] que é AnterosSize, ou seja, pequeno, médio e grande e pode usar qualquer valor duplo
  final double size;

  /// digite pf [Color] usado para alterar a cor de verificação quando o botão de opção está ativo
  final Color radioColor;

  /// tipo de [Color] usado para alterar o backgroundColor do botão de opção ativo
  final Color activeBgColor;

  /// tipo de [Color] usado para alterar o backgroundColor do botão de rádio inativo
  final Color inactiveBgColor;

  /// tipo de [Color] usado para alterar a cor da borda do botão de opção ativo
  final Color activeBorderColor;

  /// tipo de [Color] usado para alterar a cor da borda do botão de opção inativo
  final Color inactiveBorderColor;

  /// Chamado quando o usuário marca ou desmarca o botão de rádio
  final ValueChanged<T>? onChanged;

  ///tipo de Widget usado para alterar o ícone ativo do botão de opção
  final Widget activeIcon;

  ///tipo de [Widget] usado para alterar o ícone inativo do botão de opção
  final Widget? inactiveIcon;

  /// tipo de [Color] usado para alterar apenas a cor de fundo do botão de opção ativo personalizado
  final Color customBgColor;

  /// no estado verdadeiro este widget será selecionado como foco inicial
  /// quando nenhum outro nó em seu escopo está focado no momento
  final bool autofocus;

  /// um nó de foco opcional para usar como nó de foco para este widget.
  final FocusNode? focusNode;

  /// O valor representado por este botão de rádio.
  final T value;

  /// O valor atualmente selecionado para um grupo de botões de opção. O botão de opção é considerado selecionado se seu [value] corresponder ao
  /// [groupValue].
  final T groupValue;

  /// define o valor do rádio
  final bool toggleable;

  @override
  _AnterosRadioState<T> createState() => _AnterosRadioState<T>();
}

class _AnterosRadioState<T> extends State<AnterosRadio<T>>
    with TickerProviderStateMixin {
  bool get enabled => widget.onChanged != null;
  bool selected = false;
  T? groupValue;

  void onStatusChange() {
    groupValue = widget.value;
    _handleChanged(widget.value == groupValue);
  }

  void _handleChanged(bool selected) {
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    selected = widget.value == widget.groupValue;
    return InkWell(
        borderRadius: widget.type == AnterosRadioType.basic &&
                widget.type == AnterosRadioType.blunt
            ? BorderRadius.circular(50)
            : widget.type == AnterosRadioType.square
                ? BorderRadius.circular(0)
                : BorderRadius.circular(10),
        enableFeedback: enabled,
        onTap: onStatusChange,
        child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
                color: selected ? widget.activeBgColor : widget.inactiveBgColor,
                borderRadius: widget.type == AnterosRadioType.basic
                    ? BorderRadius.circular(50)
                    : widget.type == AnterosRadioType.square
                        ? BorderRadius.circular(0)
                        : BorderRadius.circular(10),
                border: Border.all(
                    color: selected
                        ? widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: selected
                ? widget.type == AnterosRadioType.basic ||
                        widget.type == AnterosRadioType.square
                    ? Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: widget.size * 0.7,
                            height: widget.size * 0.7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.radioColor),
                          )
                        ],
                      )
                    : widget.type == AnterosRadioType.blunt
                        ? Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                width: widget.size * 0.8,
                                height: widget.size * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    color: widget.customBgColor),
                              )
                            ],
                          )
                        : widget.type == AnterosRadioType.custom
                            ? widget.activeIcon
                            : widget.inactiveIcon
                : widget.inactiveIcon));
  }
}
