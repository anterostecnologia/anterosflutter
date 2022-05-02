import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class SubheadingSwitch extends ConsumerWidget {
  const SubheadingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Subtítulo de seleção de tons'),
      subtitle:
          const Text('Você pode fornecer seu próprio widget de subtítulo, se '
              'é nulo, não há subtítulo.'),
      value: ref.watch(showSubheadingPod),
      onChanged: (bool value) =>
          ref.read(showSubheadingPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showSubheadingPod)
          ? "ColorPicker(subheading: Text('Selecione a tonalidade da cor'))"
          : 'ColorPicker(subheading: null)',
    );
  }
}
