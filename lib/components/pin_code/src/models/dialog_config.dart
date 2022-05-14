part of anteros_pin_code_fields;

class DialogConfig {
  /// title of the [AlertDialog] while pasting the code. Default to [Paste Code]
  final String? dialogTitle;

  /// content of the [AlertDialog] while pasting the code. Default to ["Do you want to paste this code "]
  final String? dialogContent;

  /// Affirmative action text for the [AlertDialog]. Default to "Paste"
  final String? affirmativeText;

  /// Negative action text for the [AlertDialog]. Default to "Cancel"
  final String? negativeText;

  /// The default dialog theme, should it be iOS or other(including web and Android)
  final PinCodePlatform platform;
  DialogConfig._internal({
    this.dialogContent,
    this.dialogTitle,
    this.affirmativeText,
    this.negativeText,
    this.platform = PinCodePlatform.other,
  });

  factory DialogConfig(
      {String? affirmativeText,
      String? dialogContent,
      String? dialogTitle,
      String? negativeText,
      PinCodePlatform? platform}) {
    return DialogConfig._internal(
      affirmativeText: affirmativeText == null ? "Colar" : affirmativeText,
      dialogContent: dialogContent == null
          ? "Você quer colar este código "
          : dialogContent,
      dialogTitle: dialogTitle == null ? "Colar código" : dialogTitle,
      negativeText: negativeText == null ? "Cancelar" : negativeText,
      platform: platform == null ? PinCodePlatform.other : platform,
    );
  }
}
