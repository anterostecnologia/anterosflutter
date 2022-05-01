import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class CloseButtonSwitch extends ConsumerWidget {
  const CloseButtonSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('A barra de ferramentas de diálogo tem o botão FECHAR'),
      subtitle: const Text('Use a API para alterar o ícone e o tema do botão.'),
      value: ref.watch(closeButtonPod),
      onChanged: (bool value) => ref.read(closeButtonPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(closeButton: '
          '${ref.read(closeButtonPod)}))',
    );
  }
}
