import 'package:anterosflutter/components/badges/src/anteros_badge_position_adv.dart';
import 'package:flutter/widgets.dart';

/// Classe de utilidade. Não tente usá-lo!
///
/// Este é apenas um wrap confortável para [PositionedDirectional],
/// [AnterosAdvancedBadgeBadgePosition] e [filho].
class AnterosAdvancedBadgePositioned extends StatelessWidget {
  /// Isso especifica uma posição de crachá de acordo com [filho]
  final AnterosAdvancedBadgePosition? position;

  /// É um filho que será exibido de acordo com [position]
  final Widget child;

  /// Isso cria uma nova instância de [AnterosAdvancedBadgePositioned].
  ///
  /// Veja também:
  /// * [PosicionadoDirecional]
  const AnterosAdvancedBadgePositioned(
      {Key? key, this.position, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topRight = AnterosAdvancedBadgePosition.topEnd();
      return PositionedDirectional(
        top: topRight.top,
        end: topRight.end,
        child: child,
      );
    }

    if (position.isCenter) {
      return Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      );
    }

    return PositionedDirectional(
      top: position.top,
      end: position.end,
      bottom: position.bottom,
      start: position.start,
      child: child,
    );
  }
}
