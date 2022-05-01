/// [AnterosBadgePosition] é usado para posicionar os emblemas para o início, o fundo superior,
/// Início inferior ou final inferior do botão do ícone
/// Veja Gficonbadge

class AnterosBadgePosition {
  const AnterosBadgePosition({this.top, this.end, this.bottom, this.start});

  factory AnterosBadgePosition.topStart(
          {double top = -5, double start = -10}) =>
      AnterosBadgePosition(top: top, start: start);

  factory AnterosBadgePosition.topEnd({double top = -8, double end = -10}) =>
      AnterosBadgePosition(top: top, end: end);

  factory AnterosBadgePosition.bottomEnd(
          {double bottom = -8, double end = -10}) =>
      AnterosBadgePosition(bottom: bottom, end: end);

  factory AnterosBadgePosition.bottomStart(
          {double bottom = -8, double start = -10}) =>
      AnterosBadgePosition(bottom: bottom, start: start);

  /// define a posição do crachá
  final double? top;

  /// define a posição do crachá
  final double? end;

  /// define a posição do crachá
  final double? start;

  /// define a posição do crachá
  final double? bottom;
}
