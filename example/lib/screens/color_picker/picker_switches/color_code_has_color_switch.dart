import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ColorCodeHasColorSwitch extends ConsumerWidget {
  const ColorCodeHasColorSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title:
          const Text('A exibição do código de cores e a entrada são coloridas'),
      subtitle: const Text('Ative para usar a cor selecionada como campo'
          'cor de fundo.'),
      value: ref.watch(colorCodeHasColorPod),
      onChanged: (bool value) =>
          ref.read(colorCodeHasColorPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(colorCodeHasColor: '
          '${ref.read(colorCodeHasColorPod)})',
    );
  }
}
