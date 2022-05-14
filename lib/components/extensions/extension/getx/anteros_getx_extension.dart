part of anteros_extensions;

extension AnterosGetExtension on GetInterface {
  /// Mostre uma caixa de diálogo de confirmação
  coolDialogConfirmation(
      {

      /// Título da caixa de diálogo
      String title = "Confirme",

      /// Texto da caixa de diálogo
      required String text,

      /// Cor de fundo do cabeçalho
      Color backgroundColor = const Color(0xFF515C6F),

      // Acionado quando o botão confirmar é tocado
      VoidCallback? onConfirmBtnTap,

      /// Acionado quando o botão Cancelar é tocado
      VoidCallback? onCancelBtnTap}) {
    AnterosCoolAlert.show(
        context: Get.context!,
        type: AnterosCoolAlertType.confirm,
        text: title,
        confirmBtnText: 'Sim',
        cancelBtnText: 'Não',
        onConfirmBtnTap: onConfirmBtnTap,
        onCancelBtnTap: onCancelBtnTap,
        confirmBtnColor: Colors.green,
        backgroundColor: backgroundColor,
        cancelBtnColor: AnterosColors.DANGER);
  }

  /// Mostre uma caixa de diálogo de erro
  coolAlertError(
      {

      /// Título da caixa de diálogo
      String title = "Erro",

      /// Texto da caixa de diálogo
      required String text,

      /// Cor de fundo do cabeçalho
      Color backgroundColor = const Color(0xFF515C6F),

      // Acionado quando o botão confirmar é tocado
      VoidCallback? onConfirmBtnTap,

      /// Determina quanto tempo a caixa de diálogo permanece aberta antes de fechar
      /// [default] é nulo
      /// Quando for nulo, não será automático
      Duration? autoCloseDuration}) {
    AnterosCoolAlert.show(
        context: Get.context!,
        type: AnterosCoolAlertType.error,
        text: title,
        autoCloseDuration: autoCloseDuration,
        onConfirmBtnTap: onConfirmBtnTap,
        confirmBtnText: 'Ok',
        backgroundColor: backgroundColor,
        confirmBtnColor: AnterosColors.DANGER);
  }

  /// Mostre uma caixa de diálogo de atenção
  coolAlertWarning(
      {

      /// Título da caixa de diálogo
      String title = "Atenção",

      /// Texto da caixa de diálogo
      required String text,

      /// Cor de fundo do cabeçalho
      Color backgroundColor = const Color(0xFF515C6F),

      // Acionado quando o botão confirmar é tocado
      VoidCallback? onConfirmBtnTap,

      /// Determina quanto tempo a caixa de diálogo permanece aberta antes de fechar
      /// [default] é nulo
      /// Quando for nulo, não será automático
      Duration? autoCloseDuration}) {
    AnterosCoolAlert.show(
        context: Get.context!,
        type: AnterosCoolAlertType.warning,
        text: title,
        autoCloseDuration: autoCloseDuration,
        onConfirmBtnTap: onConfirmBtnTap,
        backgroundColor: backgroundColor,
        confirmBtnText: 'Ok',
        confirmBtnColor: AnterosColors.WARNING);
  }

  /// Mostre uma caixa de diálogo de informação
  coolAlertInfo(
      {

      /// Título da caixa de diálogo
      String title = "Informação",

      /// Texto da caixa de diálogo
      required String text,

      /// Cor de fundo do cabeçalho
      Color backgroundColor = const Color(0xFF515C6F),

      // Acionado quando o botão confirmar é tocado
      VoidCallback? onConfirmBtnTap,

      /// Determina quanto tempo a caixa de diálogo permanece aberta antes de fechar
      /// [default] é nulo
      /// Quando for nulo, não será automático
      Duration? autoCloseDuration}) {
    AnterosCoolAlert.show(
        context: Get.context!,
        type: AnterosCoolAlertType.success,
        text: title,
        autoCloseDuration: autoCloseDuration,
        onConfirmBtnTap: onConfirmBtnTap,
        backgroundColor: backgroundColor,
        confirmBtnText: 'Ok',
        confirmBtnColor: AnterosColors.INFO);
  }

  /// Mostre uma caixa de diálogo de customizada
  coolAlert({
    /// Título da caixa de diálogo
    required String title,

    /// Texto da caixa de diálogo
    required String text,

    /// Widget personalizado da caixa de diálogo
    Widget? widget,

    // Tipo de alerta [success, error, warning, confirm, info, loading, custom]
    required AnterosCoolAlertType type,

    // Tipo de animação  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    AnterosCoolAlertAnimType animType = AnterosCoolAlertAnimType.scale,

    /// Barreira dissisível
    bool barrierDismissible = true,

    // Acionado quando o botão confirmar é tocado
    VoidCallback? onConfirmBtnTap,

    /// Acionado quando o botão Cancelar é tocado
    VoidCallback? onCancelBtnTap,

    /// Texto do botão de confirmação
    String confirmBtnText = 'Ok',

    /// Cancelar texto do botão
    String cancelBtnText = 'Cancela',

    /// Cor para confirmar o botão
    Color confirmBtnColor = Colors.green,

    /// Cor para confirmar o botão
    Color cancelBtnColor = AnterosColors.DANGER,

    /// TextStyle para o botão confirmar
    TextStyle? confirmBtnTextStyle,

    /// TextStyle para o botão cancelar
    TextStyle? cancelBtnTextStyle,

    /// Determina se o botão cancelar é mostrado ou não
    bool showCancelBtn = false,

    /// Raio de borda de diálogo
    double borderRadius = 10.0,

    /// Cor de fundo do cabeçalho
    Color backgroundColor = const Color(0xFF515C6F),

    /// Caminho do ativo de flare
    String? flareAsset,

    /// Nome da animação de flare
    String flareAnimationName = 'play',

    /// Caminho de ativos do seu arquivo Lottie
    String? lottieAsset,

    /// Largura do diálogo
    double? width,

    /// Determina quanto tempo a caixa de diálogo permanece aberta antes de fechar
    /// [default] é nulo
    /// Quando for nulo, não será automático
    Duration? autoCloseDuration,

    /// Determina se os loops de animação ou não
    bool loopAnimation = false,
  }) {
    AnterosCoolAlert.show(
      context: Get.context!,
      type: type,
      text: text,
      autoCloseDuration: autoCloseDuration,
      confirmBtnText: confirmBtnText,
      cancelBtnText: cancelBtnText,
      title: title,
      animType: animType,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      confirmBtnTextStyle: confirmBtnTextStyle,
      cancelBtnTextStyle: cancelBtnTextStyle,
      showCancelBtn: showCancelBtn,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      flareAsset: flareAsset,
      flareAnimationName: flareAnimationName,
      lottieAsset: lottieAsset,
      width: width,
      loopAnimation: loopAnimation,
    );
  }

  /// Mostre uma caixa de diálogo de usando um asset
  awesomeAssetDialog(
      {

      /// Imagem a ser exibida na caixa de diálogo.
      ///
      /// Passar `Image.asset(name)` widget aqui.
      /// De preferência com `fit: BoxFit.cover` Propriedade para cobrir a parte superior inteira da caixa de diálogo.
      /// Todas as propriedades de Image widget são passados diretamente para o diálogo, portanto, fique à vontade para experimentar.
      image,

      /// Texto do título.
      title,

      /// Descrição Texto.
      required String description,

      /// Define a caixa de diálogo para ter apenas o botão OK.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonCancelText], [buttonCancelColor] e [onCancelButtonPressed]
      bool onlyOkButton = true,

      /// Define a caixa de diálogo para ter apenas o botão cancelar.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonOkText], [buttonOkColor] e [onOkButtonPressed]
      bool onlyCancelButton = false,

      /// Cor do botão OK.
      ///
      /// O padrão é `Colors.green`.
      Color buttonOkColor = Colors.green,

      /// Cor do botão Cancelar
      ///
      /// O padrão é `AnterosColors.DANGER`.
      Color buttonCancelColor = AnterosColors.DANGER,

      /// Define como a caixa de diálogo GIFF entrará na tela.
      ///
      /// O padrão é [EntryAnimation.normal] - diálogo de material padrão
      /// Animação de entrada, ou seja, desbotamento lento no centro da tela.
      EntryAnimation entryAnimation = EntryAnimation.normal,

      /// Texto para o botão OK.
      ///
      /// O padrão é `OK`.
      String buttonOkText = 'Ok',

      /// Texto para cancelar o botão
      ///
      /// O padrão é `Cancela`.
      String buttonCancelText = 'Cancela',

      /// Função de retorno de chamada a ser chamado quando o botão OK é pressionado.
      ///
      /// Se definido como nulo, o botão será desativado e por
      /// o padrão se parecerá com um botão plano no Theme's `disabledColor`.
      final VoidCallback? onOkButtonPressed,

      /// Callback function a ser chamado quando o botão Cancelar é pressionado.
      ///
      /// Por padrão (ou se definido como nulo) fecha a caixa de diálogo via `Navigator.of(context).pop()`.
      final VoidCallback? onCancelButtonPressed}) {
    showDialog(
        context: Get.context!,
        builder: (_) => AnterosAssetAwesomeDialog(
            image: image,
            title: title,
            description: Text(description),
            onlyOkButton: onlyOkButton,
            onlyCancelButton: onlyCancelButton,
            buttonOkColor: buttonOkColor,
            buttonCancelColor: buttonCancelColor,
            buttonOkText: Text(buttonOkText),
            buttonCancelText: Text(buttonCancelText),
            onOkButtonPressed: onOkButtonPressed,
            onCancelButtonPressed: onCancelButtonPressed,
            entryAnimation: entryAnimation));
  }

  /// Mostre uma caixa de diálogo de usando um asset do tipo Flare(animação)
  awesomeFlareDialog(
      {

      /// Caminho para o asset de flare.
      required String flarePath,

      /// Nome da animação de flare para aplicar.
      required String flareAnimation,

      /// BoxFit dimensionamento do asset de flare.
      BoxFit flareFit = BoxFit.cover,

      /// Texto do título.
      title,

      /// Descrição Texto.
      required String description,

      /// Define a caixa de diálogo para ter apenas o botão OK.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonCancelText], [buttonCancelColor] e [onCancelButtonPressed]
      bool onlyOkButton = true,

      /// Define a caixa de diálogo para ter apenas o botão cancelar.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonOkText], [buttonOkColor] e [onOkButtonPressed]
      bool onlyCancelButton = false,

      /// Cor do botão OK.
      ///
      /// O padrão é `Colors.green`.
      Color buttonOkColor = Colors.green,

      /// Cor do botão Cancelar
      ///
      /// O padrão é `AnterosColors.DANGER`.
      Color buttonCancelColor = AnterosColors.DANGER,

      /// Define como a caixa de diálogo GIFF entrará na tela.
      ///
      /// O padrão é [EntryAnimation.normal] - diálogo de material padrão
      /// Animação de entrada, ou seja, desbotamento lento no centro da tela.
      EntryAnimation entryAnimation = EntryAnimation.normal,

      /// Texto para o botão OK.
      ///
      /// O padrão é `OK`.
      String buttonOkText = 'Ok',

      /// Texto para cancelar o botão
      ///
      /// O padrão é `Cancela`.
      String buttonCancelText = 'Cancela',

      /// Função de retorno de chamada a ser chamado quando o botão OK é pressionado.
      ///
      /// Se definido como nulo, o botão será desativado e por
      /// o padrão se parecerá com um botão plano no Theme's `disabledColor`.
      final VoidCallback? onOkButtonPressed,

      /// Callback function a ser chamado quando o botão Cancelar é pressionado.
      ///
      /// Por padrão (ou se definido como nulo) fecha a caixa de diálogo via `Navigator.of(context).pop()`.
      final VoidCallback? onCancelButtonPressed}) {
    showDialog(
        context: Get.context!,
        builder: (_) => AnterosFlareDialog(
            flarePath: flarePath,
            flareAnimation: flareAnimation,
            flareFit: flareFit,
            title: title,
            description: Text(description),
            onlyOkButton: onlyOkButton,
            onlyCancelButton: onlyCancelButton,
            buttonOkColor: buttonOkColor,
            buttonCancelColor: buttonCancelColor,
            buttonOkText: Text(buttonOkText),
            buttonCancelText: Text(buttonCancelText),
            onOkButtonPressed: onOkButtonPressed,
            onCancelButtonPressed: onCancelButtonPressed,
            entryAnimation: entryAnimation));
  }

  /// Mostre uma caixa de diálogo de usando um asset disponivel na rede passando uma URL.
  awesomeNetworkDialog(
      {

      /// Imagem a ser exibida na caixa de diálogo.
      ///
      /// Passar `Image.network(src)` widget aqui.
      /// De preferência com `fit: BoxFit.cover` Propriedade para cobrir a parte superior inteira da caixa de diálogo.
      /// Todas as propriedades do widget de imagem são passadas diretamente para a caixa de diálogo, portanto,
      /// fique à vontade para experimentar.
      image,

      /// Texto do título.
      title,

      /// Descrição Texto.
      required String description,

      /// Define a caixa de diálogo para ter apenas o botão OK.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonCancelText], [buttonCancelColor] e [onCancelButtonPressed]
      bool onlyOkButton = true,

      /// Define a caixa de diálogo para ter apenas o botão cancelar.
      ///
      /// O padrão é falso.
      /// Se definido como true, não há necessidade de definir [buttonOkText], [buttonOkColor] e [onOkButtonPressed]
      bool onlyCancelButton = false,

      /// Cor do botão OK.
      ///
      /// O padrão é `Colors.green`.
      Color buttonOkColor = Colors.green,

      /// Cor do botão Cancelar
      ///
      /// O padrão é `AnterosColors.DANGER`.
      Color buttonCancelColor = AnterosColors.DANGER,

      /// Define como a caixa de diálogo GIFF entrará na tela.
      ///
      /// O padrão é [EntryAnimation.normal] - diálogo de material padrão
      /// Animação de entrada, ou seja, desbotamento lento no centro da tela.
      EntryAnimation entryAnimation = EntryAnimation.normal,

      /// Texto para o botão OK.
      ///
      /// O padrão é `OK`.
      String buttonOkText = 'Ok',

      /// Texto para cancelar o botão
      ///
      /// O padrão é `Cancela`.
      String buttonCancelText = 'Cancela',

      /// Função de retorno de chamada a ser chamado quando o botão OK é pressionado.
      ///
      /// Se definido como nulo, o botão será desativado e por
      /// o padrão se parecerá com um botão plano no Theme's `disabledColor`.
      final VoidCallback? onOkButtonPressed,

      /// Callback function a ser chamado quando o botão Cancelar é pressionado.
      ///
      /// Por padrão (ou se definido como nulo) fecha a caixa de diálogo via `Navigator.of(context).pop()`.
      final VoidCallback? onCancelButtonPressed}) {
    showDialog(
        context: Get.context!,
        builder: (_) => AnterosNetworkDialog(
            image: image,
            title: title,
            description: Text(description),
            onlyOkButton: onlyOkButton,
            onlyCancelButton: onlyCancelButton,
            buttonOkText: Text(buttonOkText),
            buttonCancelText: Text(buttonCancelText),
            buttonOkColor: buttonOkColor,
            buttonCancelColor: buttonCancelColor,
            onOkButtonPressed: onOkButtonPressed,
            onCancelButtonPressed: onCancelButtonPressed,
            entryAnimation: entryAnimation));
  }

  /// Mostre uma caixa de diálogo do tipo [AnterosBaseAwesomeDialog] passado como parâmetro.
  awesomeDialog(AnterosBaseAwesomeDialog dialog) {
    showDialog(context: Get.context!, builder: (_) => dialog);
  }
}
