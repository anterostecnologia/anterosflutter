import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class EnableTooltipsSwitch extends ConsumerWidget {
  const EnableTooltipsSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Ativar dicas de ferramentas'),
      subtitle: const Text(
          'Desligue para desativar todas as dicas de ferramentas no seletor.'
          '\n(Também ativa e desativa as dicas de ferramentas da API nesta demonstração, todas '
          'exceto este.)'),
      value: ref.watch(enableTooltipsPod),
      onChanged: (bool value) =>
          ref.read(enableTooltipsPod.state).state = value,
      tooltipEnabled: true,
      tooltip: 'ColorPicker(enableTooltips: '
          '${ref.watch(enableTooltipsPod)})',
    );
  }
}
