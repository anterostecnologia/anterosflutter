import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ControlPasteSwitch extends ConsumerWidget {
  const ControlPasteSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar atalho de teclado COLAR'),
      subtitle: const Text('CMD-V na Apple, CTRL-V em outros'),
      value: ref.watch(ctrlVPod),
      onChanged: (bool value) => ref.read(ctrlVPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(ctrlV: '
          '${ref.read(ctrlVPod)}))',
    );
  }
}
