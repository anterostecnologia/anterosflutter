import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class Index850Switch extends ConsumerWidget {
  const Index850Switch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Incluir índice de cor cinza 850'),
      subtitle: const Text('Incluir a não tão conhecida cor 850 na '
          'a amostra cinza, LIGUE. Normalmente mantido DESLIGADO.'),
      value: ref.watch(includeIndex850Pod),
      onChanged: (bool value) =>
          ref.read(includeIndex850Pod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(includeIndex850: '
          '${ref.read(includeIndex850Pod)})',
    );
  }
}
