import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'anteros_awesome_base_dialog.dart';

/// Widget que exibe diálogo com ativo de flare.
///
/// Você precisa de arquivo local [Flare](https://github.com/2d-inc/Flare-Flutter) `.flr` asset para esse tipo de diálogo.
/// Place the asset under `/assets` directory in the project root.
/// Adicione o ativo a `pubspec.yaml` igual a
/// ```
/// assets:
/// - assets/my_awesome_flare.flr
/// ```
/// Definir [AnterosFlareDialog]'s [flarePath] suporte para o caminho do ativo.
/// Você também deve especificar o nome da sequência de animação para aplicar via `flareAnimation` prop.
/// ```
/// AnterosFlareDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   flarePath: 'assets/my_awesome_flare.flr',
///   flareAnimation: 'dancing',
///   ...,
/// );
class AnterosFlareDialog extends StatelessWidget {
  const AnterosFlareDialog({
    Key? key,
    required this.flarePath,
    required this.flareAnimation,
    required this.title,
    this.onOkButtonPressed,
    this.flareFit = BoxFit.cover,
    this.onCancelButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.onlyCancelButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.cardBackgroundColor,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.normal,
  }) : super(key: key);

  /// Caminho para o asset de flare.
  final String flarePath;

  /// Nome da animação de flare para aplicar.
  final String flareAnimation;

  /// BoxFit dimensionamento do asset de flare.
  final BoxFit flareFit;

  /// Texto do título.
  final Text title;

  /// Descrição Texto.
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
  /// O padrão é `ok`.
  final Text? buttonOkText;

  /// Texto para cancelar o botão
  ///
  /// O padrão é `Cancela'.
  final Text? buttonCancelText;

  /// Cor do botão OK.
  ///
  /// O padrão é `Colors.green`.
  final Color buttonOkColor;

  /// Cor do botão Cancelar
  ///
  /// O padrão é `Colors.grey`.
  final Color buttonCancelColor;

  /// Esses adereços não são usados no momento.
  final Color? cardBackgroundColor;

  /// Radius aplicado aos cantos dos botões.
  ///
  /// O padrão é 8.
  final double buttonRadius;

  /// Radius aplicado aos cantos da caixa de diálogo.
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
  /// O padrão é [EntryAnimation.normal] - diálogo de material padrão
  /// Animação de entrada, ou seja, desbotamento lento no centro da tela.
  final EntryAnimation entryAnimation;
  @override
  Widget build(BuildContext context) {
    final imageWidget = FlareActor(
      flarePath,
      alignment: Alignment.center,
      fit: flareFit,
      animation: flareAnimation,
    );
    return AnterosBaseAwesomeDialog(
      imageWidget: imageWidget,
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
      buttonOkText: buttonOkText,
      onCancelButtonPressed: onCancelButtonPressed,
      entryAnimation: entryAnimation,
    );
  }
}
