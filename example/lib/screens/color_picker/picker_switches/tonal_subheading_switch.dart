import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class TonalSubheadingSwitch extends ConsumerWidget {
  const TonalSubheadingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Subtítulo da paleta de tons'),
      subtitle: const Text(
          'Você pode fornecer seu próprio subtítulo de paleta de tons '
          ' widget, se for nulo, não há subtítulo tonal.'),
      value: ref.watch(showTonalSubheadingPod),
      onChanged: (bool value) =>
          ref.read(showTonalSubheadingPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showTonalSubheadingPod)
          ? "ColorPicker(tonalSubheading: Text('Paleta de tons de 3 materiais'))"
          : 'ColorPicker(tonalSubheading: null)',
    );
  }
}
