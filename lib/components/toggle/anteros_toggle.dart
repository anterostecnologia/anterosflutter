import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Um botão de alternância permite que o usuário altere uma configuração entre dois estados.
///
/// O estado de cada botão é controlado pela ISSELECTECT, que é uma lista de bools que determina
/// Se um botão estiver em um estado não selecionado ou selecionado.Eles são ambos
/// correlacionado pelo seu índice na lista.O comprimento de isSelected deve
/// corresponde ao comprimento da lista de crianças.
///
/// ## botões de alternância personalizados
/// O comportamento de cada alternância pode ser configurado pelo retorno de chamada pressionado, que
/// pode atualizar a lista ISSELECTECT, como desejar.
class AnterosToggle extends StatefulWidget {
  /// Cria o botão alternar para alternar entre os estados ligados.
  const AnterosToggle(
      {Key? key,
      required this.onChanged,
      required this.value,
      this.enabledText,
      this.disabledText,
      this.enabledTextStyle,
      this.enabledThumbColor,
      this.enabledTrackColor,
      this.disabledTextStyle,
      this.disabledTrackColor,
      this.disabledThumbColor,
      this.type,
      this.boxShape,
      this.borderRadius,
      this.duration = const Duration(milliseconds: 400)})
      : super(key: key);

  ///tipo [String] usado para adicionar texto personalizado, isto é, ativar
  final String? enabledText;

  ///tipo [String] usado para adicionar texto personalizado, isto é, desativar
  final String? disabledText;

  ///tipo de [TextStyle] usado para definir as propriedades de estilo do texto ativado
  final TextStyle? enabledTextStyle;

  ///tipo de [TextStyle] usado para definir as propriedades de estilo do texto desativado
  final TextStyle? disabledTextStyle;

  ///tipo de [Color] usado para a cor do polegar ativo
  final Color? enabledThumbColor;

  ///tipo de [Color] usado para a cor do polegar inativo
  final Color? disabledThumbColor;

  ///tipo de [Color] usado para a cor da pista ativa
  final Color? enabledTrackColor;

  ///tipo de [Color] usado para a cor do polegar inativo
  final Color? disabledTrackColor;

  ///tipo de [BoxShape] usado para definir formas, isto é, círculo, retângulo
  final BoxShape? boxShape;

  ///tipo de [BorderRadius] usado para definir o raio do contêiner
  final BorderRadius? borderRadius;

  ///tipo de animação [Duration] chamado quando o interruptor anima durante a duração específica
  final Duration duration;

  /// Botão tipo de [AnterosToggleType] ou seja, Android, iOS, personalizado, quadrado
  final AnterosToggleType? type;

  /// Esta propriedade não deve ser nula.Usado para definir o estado atual de alternância
  final bool value;

  /// Chamado quando o usuário atingir ou desativar o interruptor.
  final ValueChanged<bool?> onChanged;

  @override
  _AnterosToggleState createState() => _AnterosToggleState();
}

class _AnterosToggleState extends State<AnterosToggle>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool isOn;

  @override
  void initState() {
    isOn = widget.value;

    controller = AnimationController(duration: widget.duration, vsync: this);
    offset = (isOn
            ? Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              )
            : Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(1, 0),
              ))
        .animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();

    controller.dispose();
    super.dispose();
  }

  void onStatusChange() {
    setState(() {
      isOn = !isOn;
    });
    switch (controller.status) {
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      case AnimationStatus.completed:
        controller.reverse();
        break;
      default:
    }
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: widget.type == AnterosToggleType.android ? 25 : 30,
            width: widget.type == AnterosToggleType.android ? 40 : 50,
          ),
          Positioned(
            top: 5,
            child: InkWell(
              borderRadius: widget.type == AnterosToggleType.square
                  ? const BorderRadius.all(Radius.circular(0))
                  : widget.borderRadius ??
                      const BorderRadius.all(Radius.circular(20)),
              onTap: onStatusChange,
              child: Container(
                width: widget.type == AnterosToggleType.ios ? 45 : 36,
                height: widget.type == AnterosToggleType.ios ? 25 : 15,
                decoration: BoxDecoration(
                    color: isOn
                        ? widget.enabledTrackColor ?? Colors.lightGreen
                        : widget.disabledTrackColor ?? Colors.grey,
                    borderRadius: widget.type == AnterosToggleType.square
                        ? const BorderRadius.all(Radius.circular(0))
                        : widget.borderRadius ??
                            const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: widget.type == AnterosToggleType.ios
                      ? const EdgeInsets.only(left: 3.5, right: 3.5, top: 5.4)
                      : const EdgeInsets.only(left: 3, right: 3, top: 3.4),
                  child: isOn
                      ? Text(
                          widget.enabledText ??
                              (widget.type == AnterosToggleType.custom
                                  ? 'ON'
                                  : ''),
                          style: widget.enabledTextStyle ??
                              (widget.type == AnterosToggleType.ios
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 12)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 8)))
                      : Text(
                          widget.disabledText ??
                              (widget.type == AnterosToggleType.custom
                                  ? 'OFF'
                                  : ''),
                          textAlign: TextAlign.end,
                          style: widget.disabledTextStyle ??
                              (widget.type == AnterosToggleType.ios
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 12)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 8)),
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            top: widget.type == AnterosToggleType.ios ? 7.5 : 3,
            left: widget.type == AnterosToggleType.ios ? 2 : 0,
            child: InkWell(
              onTap: onStatusChange,
              child: SlideTransition(
                position: offset,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: widget.type == AnterosToggleType.square
                        ? BoxShape.rectangle
                        : widget.boxShape ?? BoxShape.circle,
                    color: isOn
                        ? widget.enabledThumbColor ?? Colors.white
                        : widget.disabledThumbColor ?? Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
