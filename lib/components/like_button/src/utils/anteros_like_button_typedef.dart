import 'package:flutter/material.dart';

/// toque em retornar
/// você pode enviar sua solicitação aqui
/// se falhou, retorna null
///
typedef LikeButtonTapCallback = Future<bool?> Function(bool isLiked);

///cria widget quando isLike está mudando
typedef LikeWidgetBuilder = Widget? Function(bool isLiked);

///cria widget quando likeCount está mudando
typedef LikeCountWidgetBuilder = Widget? Function(
  int? likeCount,
  bool isLiked,
  String text,
);

enum LikeCountAnimationType {
  //sem animação
  none,
  //animação apenas na parte de mudança
  part,
  //animação em todos
  all,
}

///gosto da posição do widget de contagem
///esquerda do widget semelhante
///direita do widget como
enum CountPostion {
  left,
  right,
  top,
  bottom,
}

///retorna o widget de contagem com decoração
typedef CountDecoration = Widget? Function(
  Widget count,
  int? likeCount,
);
