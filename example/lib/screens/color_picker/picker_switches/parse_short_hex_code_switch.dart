import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ParseShortHexCodeSwitch extends ConsumerWidget {
  const ParseShortHexCodeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text(
          'Analisar código de 3 caracteres como formato RGB hexadecimal WEB de 3 caracteres'),
      subtitle: const Text('Aplica-se à ação de colar e à cor '
          'entrada de código.'),
      value: ref.watch(parseShortHexCodePod),
      onChanged: (bool value) =>
          ref.read(parseShortHexCodePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(parseShortHexCode: '
          '${ref.read(parseShortHexCodePod)}))',
    );
  }
}
