import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class SecondaryMenuSwitch extends ConsumerWidget {
  const SecondaryMenuSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Clique secundário no menu COPIAR-COLAR'),
      subtitle: const Text('Normalmente clique com o botão direito do mouse.'),
      value: ref.watch(secondaryMenuPod),
      onChanged: (bool value) => ref.read(secondaryMenuPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(secondaryMenu: '
          '${ref.read(secondaryMenuPod)}))',
    );
  }
}
