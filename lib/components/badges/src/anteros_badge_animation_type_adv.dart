import 'package:flutter/material.dart';

/// Este é um conjunto de animações que você pode usar para seu widget [Badge].
enum AnterosAdvancedBadgeAnimationType {
  /// Este valor é para usar a animação do slide
  ///
  /// Veja também:
  /// * [Transição de slide]
  slide,

  /// Este valor é para usar a animação de escala
  ///
  /// Veja também:
  /// * [ScaleTransition]
  scale,

  /// Este valor é para usar a animação de fade
  ///
  /// Veja também:
  /// * [FadeTransition]
  fade,
}
