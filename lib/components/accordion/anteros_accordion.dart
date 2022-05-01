import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosAccordion extends StatefulWidget {
  /// Um ​​acordeão é usado para mostrar (e ocultar) o conteúdo. Use [showAccordion] para ocultar e mostrar o conteúdo do acordeão.
  const AnterosAccordion(
      {Key? key,
      this.title,
      this.content,
      this.titleChild,
      this.contentChild,
      this.collapsedTitleBackgroundColor = AnterosColors.WHITE,
      this.expandedTitleBackgroundColor = const Color(0xFFE0E0E0),
      this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
      this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
      this.titlePadding = const EdgeInsets.all(10),
      this.contentBackgroundColor,
      this.contentPadding = const EdgeInsets.all(10),
      this.titleBorder = const Border(),
      this.contentBorder = const Border(),
      this.margin,
      this.showAccordion = false,
      this.onToggleCollapsed,
      this.titleBorderRadius = const BorderRadius.all(Radius.circular(0)),
      this.contentBorderRadius = const BorderRadius.all(Radius.circular(0))})
      : super(key: key);

  /// controla se o acordeão deve ser recolhido ou não permitindo ser controlado de fora
  final bool showAccordion;

  /// filho do tipo [Widget]é uma alternativa à chave de título. title terá prioridade sobre titleChild
  final Widget? titleChild;

  /// conteúdo do tipo[String] que mostra as mensagens após o [AnterosAccordion] ser expandido
  final String? content;

  /// contentChild do tipo [Widget]é uma alternativa à chave de conteúdo. conteúdo terá prioridade sobre contentChild
  final Widget? contentChild;

  /// tipo de [Color] ou [AnterosColors] que é usado para alterar a cor de fundo do título [AnterosAccordion] quando ele é recolhido
  final Color collapsedTitleBackgroundColor;

  /// tipo de [Color] ou [AnterosColors] que é usado para alterar a cor de fundo do título [AnterosAccordion] quando expandido
  final Color expandedTitleBackgroundColor;

  ///CollapsedIcon do tipo [Widget] que é usado para mostrar quando o [AnterosAccordion] é recolhido
  final Widget collapsedIcon;

  /// expandidoIcon do tipo[Widget] que é usado quando o [AnterosAccordion] é expandido
  final Widget expandedIcon;

  /// o texto do tipo [String] é alternativo ao filho. text terá prioridade sobre titleChild
  final String? title;

  /// textStyle do tipo [textStyle] será aplicável apenas ao texto e não ao filho
  final TextStyle textStyle;

  /// titlePadding do tipo [EdgeInsets] que é usado para definir o preenchimento do título [AnterosAccordion]
  final EdgeInsets titlePadding;

  /// descriptionPadding do tipo [EdgeInsets] que é usado para definir o preenchimento da descrição [AnterosAccordion]
  final EdgeInsets contentPadding;

  /// tipo de [Color] ou [AnterosColors] que é usado para alterar a cor de fundo da descrição [AnterosAccordion]
  final Color? contentBackgroundColor;

  /// margem do tipo [EdgeInsets] que é usada para definir a margem do [AnterosAccordion]
  final EdgeInsets? margin;

  /// titleBorderColor do tipo [Color] ou [AnterosColors] que é usado para alterar a cor da borda do título
  final Border titleBorder;

  /// contentBorderColor do tipo [Color] ou [AnterosColors] que é usado para alterar a cor da borda do conteúdo
  final Border contentBorder;

  /// titleBorderRadius do tipo [Radius] que é usado para alterar o raio da borda do título
  final BorderRadius titleBorderRadius;

  /// contentBorderRadius do tipo [Radius] que é usado para alterar o raio da borda do conteúdo
  final BorderRadius contentBorderRadius;

  /// função chamada quando o corpo do conteúdo foi recolhido
  final Function(bool)? onToggleCollapsed;

  @override
  _AnterosAccordionState createState() => _AnterosAccordionState();
}

class _AnterosAccordionState extends State<AnterosAccordion>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool showAccordion;

  @override
  void initState() {
    showAccordion = widget.showAccordion;
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin ?? const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: _toggleCollapsed,
              borderRadius: widget.titleBorderRadius,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.titleBorderRadius,
                  border: widget.titleBorder,
                  color: showAccordion
                      ? widget.expandedTitleBackgroundColor
                      : widget.collapsedTitleBackgroundColor,
                ),
                padding: widget.titlePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: widget.title != null
                          ? Text(widget.title!, style: widget.textStyle)
                          : (widget.titleChild ?? Container()),
                    ),
                    showAccordion ? widget.expandedIcon : widget.collapsedIcon
                  ],
                ),
              ),
            ),
            showAccordion
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: widget.contentBorderRadius,
                      border: widget.contentBorder,
                      color: widget.contentBackgroundColor ?? Colors.white70,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: widget.contentPadding,
                    child: SlideTransition(
                      position: offset,
                      child: widget.content != null
                          ? Text(widget.content!)
                          : (widget.contentChild ?? Container()),
                    ))
                : Container()
          ],
        ),
      );

  void _toggleCollapsed() {
    setState(() {
      switch (controller.status) {
        case AnimationStatus.completed:
          controller.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
      showAccordion = !showAccordion;
      if (widget.onToggleCollapsed != null) {
        widget.onToggleCollapsed!(showAccordion);
      }
    });
  }
}
