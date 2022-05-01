import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class LongPressMenuSwitch extends ConsumerWidget {
  const LongPressMenuSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Pressione e segure o menu COPY-PASTE'),
      value: ref.watch(longPressMenuPod),
      onChanged: (bool value) => ref.read(longPressMenuPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(longPressMenu: '
          '${ref.read(longPressMenuPod)}))',
    );
  }
}
