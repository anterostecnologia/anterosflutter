import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ToolbarPasteSwitch extends ConsumerWidget {
  const ToolbarPasteSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar botão de ação COLAR da barra de ferramentas'),
      value: ref.watch(pasteButtonPod),
      onChanged: (bool value) => ref.read(pasteButtonPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(pasteButton: '
          '${ref.read(pasteButtonPod)}))',
    );
  }
}
