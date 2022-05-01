import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ControlCopySwitch extends ConsumerWidget {
  const ControlCopySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar atalho COPIAR do teclado'),
      subtitle: const Text('CMD-C na Apple, CTRL-C em outros'),
      value: ref.watch(ctrlCPod),
      onChanged: (bool value) => ref.read(ctrlCPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(ctrlC: '
          '${ref.read(ctrlCPod)}))',
    );
  }
}
