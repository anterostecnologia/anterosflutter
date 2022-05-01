import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class TonalSwitch extends ConsumerWidget {
  const TonalSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar paleta de tons'),
      subtitle: const Text('Ative para mostrar a paleta de tons do Material 3 '
          'para a cor selecionada e habilitar a seleção do tom de cor.'),
      value: ref.watch(enableTonesSelectionPod),
      onChanged: (bool value) =>
          ref.read(enableTonesSelectionPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(enableTonalPalette: '
          '${ref.read(enableTonesSelectionPod)})',
    );
  }
}
