import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class OpacitySwitch extends ConsumerWidget {
  const OpacitySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar opacidade'),
      subtitle: const Text(
          'Use um controle deslizante para ajustar a opacidade da cor.'),
      value: ref.watch(enableOpacityPod),
      onChanged: (bool value) => ref.read(enableOpacityPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(enableOpacity: ${ref.read(enableOpacityPod)})',
    );
  }
}
