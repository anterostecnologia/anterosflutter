import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class MaterialNameSwitch extends ConsumerWidget {
  const MaterialNameSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Nome da cor do material'),
      subtitle: const Text('Se a cor selecionada for um material padrão color, '
          'seu nome é mostrado junto com seu índice de tonalidade.'),
      value: ref.watch(showMaterialNamePod),
      onChanged: (bool value) =>
          ref.read(showMaterialNamePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(showMaterialName: '
          '${ref.read(showMaterialNamePod)})',
    );
  }
}
