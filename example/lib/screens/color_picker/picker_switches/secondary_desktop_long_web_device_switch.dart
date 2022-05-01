import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class SecondaryDesktopLongWebDeviceSwitch extends ConsumerWidget {
  const SecondaryDesktopLongWebDeviceSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title:
          const Text('Pressione e segure o menu COPY-PASTE no Android/iOS/Web, '
              'clique com o botão direito nos desktops'),
      value: ref.watch(secondaryDesktopWebLongPod),
      onChanged: (bool value) =>
          ref.read(secondaryDesktopWebLongPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(\n'
          '    secondaryOnDesktopLongOnDeviceAndWeb: '
          '${ref.read(secondaryDesktopWebLongPod)}))',
    );
  }
}
