enum AnterosSocialType {
  facebook,
  whatsapp,
  twitter,
  google,
  dribble,
  linkedin,
  youtube,
  slack,
  pinterest,
  wechat,
  line,
}

enum AnterosSocialButtonType {
  /// Tipo padrão é [AnterosSocialButtonType.solid], usado para preencher de cor para o widget
  solid,

  /// Tipo [AnterosSocialButtonType.outline], Usado para widget com borda contínua e preenche a cor com cores.Transparent
  outline,

  /// Type [AnterosSocialButtonType.outline2x], usado para widget com contorno2x borda e borda.width = 2.0 e preencha a cor com cores.Transparent
  outline2x,

  /// Type [AnterosSocialButtonType.transparent], usado para widget com cor de preenchimento com cores.
  transparent,

  /// Tipo [AnterosSocialButtonType.icon], usado para widget com apenas ícone preenchido em contêiner quadrado
  icon,
}
