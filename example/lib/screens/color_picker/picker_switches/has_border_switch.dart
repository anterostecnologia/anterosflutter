import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class HasBorderSwitch extends ConsumerWidget {
  const HasBorderSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Borda ao redor dos itens de escolha de cores'),
      subtitle: const Text('Com a API você também pode ajustar o'
          'Cor da borda.'),
      value: ref.watch(hasBorderPod),
      onChanged: (bool value) => ref.read(hasBorderPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(hasBorder: ${ref.read(hasBorderPod)})',
    );
  }
}
