import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosDropdown<T> extends StatefulWidget {
  /// Anteros Dropdown permite que o usuário selecione a partir do número de itens e exiba selecionados
  /// item no botão. Ele exibe a lista de itens na forma suspensa de sobreposição.
  const AnterosDropdown(
      {Key? key,
      required this.items,
      this.icon,
      this.selectedItemBuilder,
      this.value,
      this.hint,
      this.disabledHint,
      required this.onChanged,
      this.onTap,
      this.elevation = 8,
      this.style,
      this.underline,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize = 24.0,
      this.isDense = true,
      this.isExpanded = false,
      this.itemHeight = 40,
      this.focusColor,
      this.focusNode,
      this.autofocus = false,
      this.dropdownColor,
      this.padding = const EdgeInsets.all(5),
      this.borderRadius = const BorderRadius.all(Radius.circular(4)),
      this.border = const BorderSide(
          color: Colors.transparent, width: 1, style: BorderStyle.solid),
      this.dropdownButtonColor = AnterosColors.WHITE})
      : super(key: key);

  final DropdownButtonBuilder? selectedItemBuilder;
  final List<DropdownMenuItem<T>>? items;

  /// O widget a ser usado para o ícone do botão suspenso.
  /// O padrão é um [Icon] com o glifo [Icons.arrow_drop_down].
  final Widget? icon;

  /// A coordenada z na qual colocar o menu quando aberto.
  final int elevation;

  /// O valor do [DropdownMenuItem] selecionado no momento.
  final T? value;

  /// Define a borda do botão suspenso
  final BorderSide border;

  /// Define o preenchimento dado dentro do dropdown
  final EdgeInsets padding;

  /// Um ​​widget de espaço reservado exibido pelo botão suspenso.
  final Widget? hint;

  /// Uma mensagem para mostrar quando a lista suspensa está desabilitada.
  final Widget? disabledHint;

  /// Chamado quando o usuário seleciona um item.
  /// Se o retorno de chamada [onChanged] for nulo ou a lista de [DropdownButton.items]
  /// for null então o botão suspenso será desabilitado,
  final ValueChanged<T?>? onChanged;

  /// Chamado quando o botão suspenso é tocado.
  final VoidCallback? onTap;

  /// Padrões para o valor [TextTheme.subtitle1] do atual
  /// [ThemeData.textTheme] do [Theme] atual.
  final TextStyle? style;

  /// O widget a ser usado para desenhar o sublinhado do botão suspenso.
  final Widget? underline;

  /// A cor de qualquer [Icon] descendente de [icon] se este botão estiver desabilitado,
  /// ou seja, se [onChanged] for nulo.
  final Color? iconDisabledColor;

  /// A cor de qualquer [Icon] descendente de [icon] se este botão estiver habilitado,
  /// ou seja, se [onChanged] for definido.
  final Color? iconEnabledColor;

  /// O tamanho a ser usado para o botão do ícone de seta para baixo do botão suspenso.
  final double iconSize;

  /// Reduz a altura do botão.
  final bool isDense;

  /// Configura o conteúdo interno do dropdown para preencher horizontalmente seu pai.
  final bool isExpanded;

  /// Define a altura dos itens do menu
  final double? itemHeight;

  /// A cor do [Material] do botão quando ele tem o foco de entrada.
  final Color? focusColor;

  /// Define o foco do teclado para este widget.
  final FocusNode? focusNode;

  /// No estado verdadeiro, ele deve se concentrar se nada mais já estiver focado.
  /// O padrão é falso
  final bool autofocus;

  /// Define a cor de fundo do dropdown.
  final Color? dropdownColor;

  /// Define o raio da borda do dropdown.
  final BorderRadius borderRadius;

  /// Define a cor de fundo do dropdownButton.
  final dynamic dropdownButtonColor;

  @override
  _AnterosDropdownState createState() => _AnterosDropdownState();
}

class _AnterosDropdownState extends State<AnterosDropdown> {
  @override
  Widget build(BuildContext context) => Material(
        color: widget.dropdownButtonColor,
        shape: RoundedRectangleBorder(
          side: widget.border,
          borderRadius: widget.borderRadius,
        ),
        child: Container(
          height: widget.itemHeight,
          padding: widget.padding,
          child: DropdownButton(
            items: widget.items,
            selectedItemBuilder: widget.selectedItemBuilder,
            value: widget.value,
            hint: widget.hint,
            disabledHint: widget.disabledHint,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            elevation: widget.elevation,
            style: widget.style,
            icon: widget.icon,
            iconDisabledColor: widget.iconDisabledColor,
            iconEnabledColor: widget.iconEnabledColor,
            iconSize: widget.iconSize,
            isDense: widget.isDense,
            isExpanded: widget.isExpanded,
            // itemHeight: widget.itemHeight,
            focusColor: widget.focusColor,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            dropdownColor: widget.dropdownColor,
          ),
        ),
      );
}
