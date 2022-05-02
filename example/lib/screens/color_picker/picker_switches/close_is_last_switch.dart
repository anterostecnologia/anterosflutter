import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class CloseIsLastSwitch extends ConsumerWidget {
  const CloseIsLastSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title:
          const Text('Barra de ferramentas de diálogo FECHAR é o último botão'),
      subtitle: const Text('O botão FECHAR é o último, desligue para fazer OK '
          'botão o último na barra de ferramentas.'),
      value: ref.watch(closeIsLastPod),
      onChanged: (bool value) => ref.read(closeIsLastPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(closeIsLast: '
          '${ref.read(closeIsLastPod)}))',
    );
  }
}
