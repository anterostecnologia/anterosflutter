import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class TitleSwitch extends ConsumerWidget {
  const TitleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Título da barra de ferramentas'),
      subtitle: const Text(
          'Você pode fornecer seu próprio título da barra de ferramentas do seletor, se '
          'é nulo não há título.'),
      value: ref.watch(showTitlePod),
      onChanged: (bool value) => ref.read(showTitlePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: ref.read(showTitlePod)
          ? "ColorPicker(title: Text('Seletor de cores'))"
          : 'ColorPicker(title: null)',
    );
  }
}
