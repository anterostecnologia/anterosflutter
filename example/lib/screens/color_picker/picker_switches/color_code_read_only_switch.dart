import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class ColorCodeReadOnlySwitch extends ConsumerWidget {
  const ColorCodeReadOnlySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text(
          'A exibição do código de cores e a entrada são somente leitura'),
      subtitle: const Text(
          'Normalmente, o campo de código de cores pode ser editado em '
          'Selecionador de rodas. Defina como ON para torná-lo somente leitura.'),
      value: ref.watch(colorCodeReadOnlyPod),
      onChanged: (bool value) =>
          ref.read(colorCodeReadOnlyPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(colorCodeReadOnly: '
          '${ref.read(colorCodeReadOnlyPod)})',
    );
  }
}
