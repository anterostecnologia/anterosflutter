/// Classe de utilidade. Não tente usá-lo!
///
/// Contém uma posição personalizada para o [Badge]
class AnterosAdvancedBadgePosition {
  /// Esta é a distância até o lado superior de um widget pai.
  final double? top;

  /// Esta é a distância até o lado final de um widget pai.
  final double? end;

  /// Esta é a distância até o lado inicial de um widget pai.
  final double? start;

  /// Esta é a distância até o lado inferior de um widget pai.
  final double? bottom;

  /// Isso indica que a centralização é necessária
  final bool isCenter;

  /// Isso cria uma nova instância deste widget
  const AnterosAdvancedBadgePosition({
    this.top,
    this.end,
    this.bottom,
    this.start,
    this.isCenter = false,
  });

  /// Método de fábrica que cria uma nova instância deste widget
  /// de acordo com o centro
  factory AnterosAdvancedBadgePosition.center() {
    return AnterosAdvancedBadgePosition(isCenter: true);
  }

  /// Método de fábrica que cria uma nova instância deste widget
  /// de acordo com [top] e [start]
  factory AnterosAdvancedBadgePosition.topStart(
      {double top = -5, double start = -10}) {
    return AnterosAdvancedBadgePosition(top: top, start: start);
  }

  /// Método de fábrica que cria uma nova instância deste widget
  /// de acordo com [top] e [end]
  factory AnterosAdvancedBadgePosition.topEnd(
      {double top = -8, double end = -10}) {
    return AnterosAdvancedBadgePosition(top: top, end: end);
  }

  /// Método de fábrica que cria uma nova instância deste widget
  /// de acordo com [bottom] e [end]
  factory AnterosAdvancedBadgePosition.bottomEnd(
      {double bottom = -8, double end = -10}) {
    return AnterosAdvancedBadgePosition(bottom: bottom, end: end);
  }

  /// Método de fábrica que cria uma nova instância deste widget
  /// de acordo com [bottom] e [start]
  factory AnterosAdvancedBadgePosition.bottomStart(
      {double bottom = -8, double start = -10}) {
    return AnterosAdvancedBadgePosition(bottom: bottom, start: start);
  }
}
