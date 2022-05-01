import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ColorNameSwitch extends ConsumerWidget {
  const ColorNameSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Nomeie essa cor'),
      subtitle: const Text(
          'Dê um nome à cor selecionada com base no mais próximo '
          'correspondência de cores em uma pesquisa com 1.566 nomes de cores.'),
      value: ref.watch(showColorNamePod),
      onChanged: (bool value) => ref.read(showColorNamePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(showColorName: '
          '${ref.read(showColorNamePod)})',
    );
  }
}
