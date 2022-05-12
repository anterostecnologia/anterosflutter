import 'package:anterosflutter/components/dialogs/src/anteros_awesome_base_dialog.dart';
import 'package:flutter/material.dart';

/// Widget que exibe a caixa de diálogo com a imagem obtida na rede.
///
/// Passe o URL da imagem de rede para [AnterosNetworkDialog]'s [image] prop usando Flutter's `Image.network(src)` widget.
/// ```
/// AnterosNetworkDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   image: Image.network(
///     'https://example.com/link/to/image.gif',
///     fit: BoxFit.cover,
///   ),
///   ...,
/// );
class AnterosNetworkDialog extends StatelessWidget {
  const AnterosNetworkDialog({
    Key? key,
    required this.image,
    required this.title,
    this.onOkButtonPressed,
    this.onCancelButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.onlyCancelButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.normal,
  }) : super(key: key);

  /// Imagem a ser exibida na caixa de diálogo.
  ///
  /// Passar `Image.network(src)` widget aqui.
  /// De preferência com `fit: BoxFit.cover` Propriedade para cobrir a parte superior inteira da caixa de diálogo.
  /// Todas as propriedades do widget de imagem são passadas diretamente para a caixa de diálogo GIFF, portanto, fique à vontade para experimentar.
  final Widget image;

  /// Texto do título.
  final Text title;

  /// Descrição Texto
  final Text? description;

  /// Define a caixa de diálogo para ter apenas o botão OK.
  ///
  /// O padrão é falso.
  /// Se definido como true, não há necessidade de definir [buttonCancelText], [buttonCancelColor] e [onCancelButtonPressed]
  final bool onlyOkButton;

  /// Define a caixa de diálogo para ter apenas o botão cancelar.
  ///
  /// O padrão é falso.
  /// Se definido como true, não há necessidade de definir [buttonOkText], [buttonOkColor] e [onOkButtonPressed]
  final bool onlyCancelButton;

  /// Texto para o botão OK.
  ///
  /// O padrão é `OK`.
  final Text? buttonOkText;

  /// Texto para cancelar o botão
  ///
  /// O padrão é `Cancela`.
  final Text? buttonCancelText;

  /// Cor do botão OK.
  ///
  /// O padrão é `Colors.green`.
  final Color buttonOkColor;

  /// Cor do botão Cancelar
  ///
  /// O padrão é `Colors.grey`.
  final Color buttonCancelColor;

  /// O raio aplicado aos cantos dos botões.
  ///
  /// O padrão é 8.
  final double buttonRadius;

  /// O raio aplicado aos cantos da caixa de diálogo.
  ///
  /// O padrão é 8.
  final double cornerRadius;

  /// Função de retorno de chamada a ser chamado quando o botão OK é pressionado.
  ///
  /// Se definido como nulo, o botão será desativado e por
  /// o padrão se parecerá com um botão plano no Theme's `disabledColor`.
  final VoidCallback? onOkButtonPressed;

  /// Função de retorno de chamada a ser chamado quando o botão Cancelar é pressionado.
  ///
  /// Por padrão (ou se definido como nulo) fecha a caixa de diálogo via `Navigator.of(context).pop()`.
  final VoidCallback? onCancelButtonPressed;

  /// Define como a caixa de diálogo entrará na tela.
  ///
  /// O padrão é[EntryAnimation.normal] - diálogo de material padrão
  /// Animação de entrada, ou seja, desbotamento lento no centro da tela.
  final EntryAnimation entryAnimation;
  @override
  Widget build(BuildContext context) {
    return AnterosBaseAwesomeDialog(
      imageWidget: image,
      cornerRadius: cornerRadius,
      title: title,
      description: description,
      onlyOkButton: onlyOkButton,
      onlyCancelButton: onlyCancelButton,
      buttonCancelColor: buttonCancelColor,
      buttonRadius: buttonRadius,
      buttonCancelText: buttonCancelText,
      buttonOkColor: buttonOkColor,
      onOkButtonPressed: onOkButtonPressed,
      onCancelButtonPressed: onCancelButtonPressed,
      buttonOkText: buttonOkText,
      entryAnimation: entryAnimation,
    );
  }
}
