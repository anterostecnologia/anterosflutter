import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class OpacitySubheadingSwitch extends ConsumerWidget {
  const OpacitySubheadingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Subtítulo do controle deslizante de opacidade'),
      subtitle:
          const Text('Você pode fornecer seu próprio widget de subtítulo, se '
              'é nulo, não há subtítulo.'),
      value: ref.watch(showOpacitySubheadingPod),
      onChanged: (bool value) =>
          ref.read(showOpacitySubheadingPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showOpacitySubheadingPod)
          ? '"ColorPicker(opacitySubheading: '
              "Text('Selecione a sombra do subtítulo de opacidade'))"
          : 'ColorPicker(opacitySubheading: null)',
    );
  }
}
