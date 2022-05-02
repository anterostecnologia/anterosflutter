import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ColorValueSwitch extends ConsumerWidget {
  const ColorValueSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Valor inteiro do código de cor'),
      subtitle: const Text(
          'Mostra o valor inteiro da cor, que pode ser pintado e '
          'copiado. Normalmente DESLIGADO, utilizável como um recurso de desenvolvimento.'),
      value: ref.watch(showColorValuePod),
      onChanged: (bool value) =>
          ref.read(showColorValuePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(showColorValue: '
          '${ref.read(showColorValuePod)})',
    );
  }
}
