import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ColorCodeSwitch extends ConsumerWidget {
  const ColorCodeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Exibição e entrada de código de cores'),
      subtitle:
          const Text('Mostra o valor RGB hexadecimal da cor selecionada. No '
              'seletor de rodas, você também pode inserir um valor HEX RGB.'),
      value: ref.watch(showColorCodePod),
      onChanged: (bool value) => ref.read(showColorCodePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(showColorCode: '
          '${ref.read(showColorCodePod)})',
    );
  }
}
