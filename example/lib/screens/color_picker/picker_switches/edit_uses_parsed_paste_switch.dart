import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class EditUsesParsedPasteSwitch extends ConsumerWidget {
  const EditUsesParsedPasteSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text(
          'O campo de entrada do código de cores usa o analisador de colagem'),
      subtitle: const Text(
          'Desligue para usar a colagem de campo de texto normal. '
          'Este recurso se aplica apenas a atalhos de teclado na área de trabalho.'),
      value: ref.watch(editUsesParsedPastePod),
      onChanged: (bool value) =>
          ref.read(editUsesParsedPastePod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(editUsesParsedPaste: '
          '${ref.read(editUsesParsedPastePod)}))',
    );
  }
}
