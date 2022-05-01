import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class DialogActionIconsSwitch extends ConsumerWidget {
  const DialogActionIconsSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Os botões de ação da caixa de diálogo têm ícones'),
      subtitle:
          const Text('Use a API para personalizar também o botão e o ícone.'),
      value: ref.watch(dialogActionIconsPod),
      onChanged: (bool value) =>
          ref.read(dialogActionIconsPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(dialogActionIcons: '
          '${ref.read(dialogActionIconsPod)}))',
    );
  }
}
