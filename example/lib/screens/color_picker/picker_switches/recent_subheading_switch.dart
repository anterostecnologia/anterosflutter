import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class RecentSubheadingSwitch extends ConsumerWidget {
  const RecentSubheadingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Subtítulo de cores recentes'),
      subtitle:
          const Text('Você pode fornecer seu próprio widget de subtítulo, se '
              'é nulo, não há subtítulo.'),
      value: ref.watch(showRecentSubheadingPod),
      onChanged: (bool value) =>
          ref.read(showRecentSubheadingPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showRecentSubheadingPod)
          ? "ColorPicker(recentColorsSubheading: Text('Recent colors'))"
          : 'ColorPicker(recentColorsSubheading: null)',
    );
  }
}
