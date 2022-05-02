import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class WheelHasBorderSwitch extends ConsumerWidget {
  const WheelHasBorderSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Limite em torno da roda de cores'),
      subtitle: const Text('Com a API você também pode ajustar o '
          'cor da borda'),
      value: ref.watch(wheelHasBorderPod),
      onChanged: (bool value) =>
          ref.read(wheelHasBorderPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(wheelHasBorder: '
          '${ref.read(wheelHasBorderPod)})',
    );
  }
}
