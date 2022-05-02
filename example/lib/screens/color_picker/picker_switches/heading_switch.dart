import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class HeadingSwitch extends ConsumerWidget {
  const HeadingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Cabeçalho'),
      subtitle:
          const Text('Você pode fornecer seu próprio widget de título, se '
              'é nulo, não há título.'),
      value: ref.watch(showHeadingPod),
      onChanged: (bool value) => ref.read(showHeadingPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showHeadingPod)
          ? "ColorPicker(heading: Text('Select color'))"
          : 'ColorPicker(heading: null)',
    );
  }
}
