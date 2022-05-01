import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosCheckbox extends StatefulWidget {
  /// [AnterosCheckbox] é uma pequena caixa (como em uma lista de verificação) na qual colocar uma marca de seleção para fazer uma seleção com várias opções de personalização.
  const AnterosCheckbox(
      {Key? key,
      this.size = AnterosSize.MEDIUM,
      this.type = AnterosCheckboxType.basic,
      this.activeBgColor = AnterosColors.PRIMARY,
      this.inactiveBgColor = AnterosColors.WHITE,
      this.activeBorderColor = AnterosColors.WHITE,
      this.inactiveBorderColor = AnterosColors.DARK,
      required this.onChanged,
      required this.value,
      this.activeIcon = const Icon(
        Icons.check,
        size: 20,
        color: AnterosColors.WHITE,
      ),
      this.inactiveIcon,
      this.customBgColor = AnterosColors.SUCCESS,
      this.autofocus = false,
      this.focusNode})
      : super(key: key);

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

  /// Chamado quando o usuário marca ou desmarca a caixa de seleção.
  final ValueChanged<bool>? onChanged;

  /// Usado para definir o estado atual da caixa de seleção
  final bool value;

  /// tipo de [Widget] usado para alterar o ícone ativo da caixa de seleção
  final Widget activeIcon;

  /// tipo de [Widget] usado para alterar o ícone inativo da caixa de seleção
  final Widget? inactiveIcon;

  /// tipo de [Color] usado para alterar apenas a cor de fundo da caixa de seleção ativa personalizada
  final Color customBgColor;

  /// no estado verdadeiro este widget será selecionado como foco inicial
  /// quando nenhum outro nó em seu escopo está focado no momento
  final bool autofocus;

  /// um nó de foco opcional para usar como nó de foco para este widget.
  final FocusNode? focusNode;

  @override
  _AnterosCheckboxState createState() => _AnterosCheckboxState();
}

class _AnterosCheckboxState extends State<AnterosCheckbox> {
  bool get enabled => widget.onChanged != null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: enabled,
        child: InkResponse(
          highlightShape: widget.type == AnterosCheckboxType.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          containedInkWell: widget.type != AnterosCheckboxType.circle,
          canRequestFocus: enabled,
          onTap: widget.onChanged != null
              ? () {
                  widget.onChanged!(!widget.value);
                }
              : null,
          child: Container(
            height: widget.size,
            width: widget.size,
            margin: widget.type != AnterosCheckboxType.circle
                ? const EdgeInsets.all(10)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
                color: enabled
                    ? widget.value
                        ? widget.type == AnterosCheckboxType.custom
                            ? Colors.white
                            : widget.activeBgColor
                        : widget.inactiveBgColor
                    : Colors.grey,
                borderRadius: widget.type == AnterosCheckboxType.basic
                    ? BorderRadius.circular(3)
                    : widget.type == AnterosCheckboxType.circle
                        ? BorderRadius.circular(50)
                        : BorderRadius.zero,
                border: Border.all(
                    color: widget.value
                        ? widget.type == AnterosCheckboxType.custom
                            ? Colors.black87
                            : widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: widget.value
                ? widget.type == AnterosCheckboxType.custom
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
                                shape: BoxShape.rectangle,
                                color: widget.customBgColor),
                          )
                        ],
                      )
                    : widget.activeIcon
                : widget.inactiveIcon,
          ),
        ),
      );
}
