import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class DialogActionsButtonsSwitch extends ConsumerWidget {
  const DialogActionsButtonsSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text(
          'A caixa de diálogo tem botões CANCELAR OK na parte inferior'),
      subtitle:
          const Text('Desligue para remover os botões de ação inferiores.'),
      value: ref.watch(dialogActionButtonsPod),
      onChanged: (bool value) =>
          ref.read(dialogActionButtonsPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(dialogActionButtons: '
          '${ref.read(dialogActionButtonsPod)}))',
    );
  }
}
