/// [AnterosShimmerDirection] controla a direção do efeito de brilho
///
enum AnterosShimmerDirection {
  /// Direção padrão é [AnterosShimmerDirection.leftToRight],que inicia o
  /// Animação de efeito brilhante do lado esquerdo para o direito do widget infantil.
  leftToRight,

  /// Direção [AnterosShimmerDirection.rightToLeft], que inicia o brilho
  /// Animação de efeito do lado direito para esquerda do widget infantil.
  rightToLeft,

  /// Direção [AnterosShimmerDirection.topToBottom], que inicia o brilho
  /// Animação de efeito de cima para baixo do widget infantil.
  topToBottom,

  /// Direção [AnterosShimmerDirection.bottomToTop], que inicia o brilho
  /// Animação de efeito de baixo para o lado superior do widget infantil.
  bottomToTop
}
