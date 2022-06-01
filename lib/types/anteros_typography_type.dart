/// [AnterosTypographyType] é usado para alterar o tipo de widget de título de Anterostypografia.
enum AnterosTypographyType {
  /// [AnterosTypographyType.typo1] Tipo usado para widget de título com fontsize = 25.0
  typo1,

  /// [AnterosTypographyType.typo2] Tipo usado para widget de título com fontsize = 22.0
  typo2,

  /// [AnterosTypographyType.typo3] Tipo usado para widget de título com fontsize = 19.0
  typo3,

  /// [AnterosTypographyType.typo4] Tipo usado para widget de título com fontsize = 17.0
  typo4,

  /// [AnterosTypographyType.typo5] Tipo usado para widget de título com fontsize = 15.0
  typo5,

  /// [AnterosTypographyType.typo6] Tipo usado para widget de título com fontsize = 13.0
  typo6,
}

extension TypographyExtension on AnterosTypographyType {
  double getValue() {
    double value = 0.0;
    if (this.name == AnterosTypographyType.typo1.name) {
      value = 28.0;
    } else if (this.name == AnterosTypographyType.typo2.name) {
      value = 25.0;
    } else if (this.name == AnterosTypographyType.typo3.name) {
      value = 22.0;
    } else if (this.name == AnterosTypographyType.typo4.name) {
      value = 20.0;
    } else if (this.name == AnterosTypographyType.typo5.name) {
      value = 18.0;
    } else if (this.name == AnterosTypographyType.typo6.name) {
      value = 16.0;
    }
    return value;
  }
}
