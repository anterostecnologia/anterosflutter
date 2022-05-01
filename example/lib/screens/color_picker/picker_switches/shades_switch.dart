import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ShadesSwitch extends ConsumerWidget {
  const ShadesSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar tons de cores'),
      subtitle: const Text('DESLIGUE para usar apenas o principal '
          'cor em uma amostra de cor de material. Normalmente deixado LIGADO.'),
      value: ref.watch(enableShadesSelectionPod),
      onChanged: (bool value) =>
          ref.read(enableShadesSelectionPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(enableShadesSelection: '
          '${ref.read(enableShadesSelectionPod)})',
    );
  }
}
