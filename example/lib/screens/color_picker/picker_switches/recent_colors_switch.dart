import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class RecentColorsSwitch extends ConsumerWidget {
  const RecentColorsSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Cores recentes'),
      subtitle: const Text(
          'Mostra uma lista de cores selecionadas recentemente. Vocês '
          'também pode controlar quantas cores são mantidas com a API.'),
      value: ref.watch(showRecentColorsPod),
      onChanged: (bool value) =>
          ref.read(showRecentColorsPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(showRecentColors: '
          '${ref.read(showRecentColorsPod)})',
    );
  }
}
