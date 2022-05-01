import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class OkButtonSwitch extends ConsumerWidget {
  const OkButtonSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text(
          'A barra de ferramentas da caixa de diálogo tem o botão OK'),
      subtitle: const Text('Use a API para alterar o ícone e o tema do botão.'),
      value: ref.watch(okButtonPod),
      onChanged: (bool value) => ref.read(okButtonPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(okButton: '
          '${ref.read(okButtonPod)}))',
    );
  }
}
