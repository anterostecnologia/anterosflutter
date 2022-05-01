import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class PickerAutoFocusSwitch extends ConsumerWidget {
  const PickerAutoFocusSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Seletor usa foco automático'),
      subtitle: const Text('Para que os atalhos de teclado funcionem melhor, o '
          'picker tenta pegar o foco por padrão. Desligue este comportamento se '
          'está no caminho. Se os atalhos de teclado copiar e colar forem '
          'desativado, esta configuração não importa, o selecionador nunca tenta'
          'para foco automático quando não são usados.'),
      value: ref.watch(autoFocusPod),
      onChanged: (bool value) => ref.read(autoFocusPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(autoFocus: '
          '${ref.read(autoFocusPod)}))',
    );
  }
}
